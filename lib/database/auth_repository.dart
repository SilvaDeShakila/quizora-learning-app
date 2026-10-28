import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class AuthRepository {
  AuthRepository._();

  static final AuthRepository instance = AuthRepository._();

  final AppDatabase _appDatabase = AppDatabase.instance;

  static const int _passwordIterations = 210000;
  static const String _passwordAlgorithm = 'PBKDF2-HMAC-SHA256';

  Future<Map<String, Object?>> signUp({
    required String displayName,
    required String email,
    required String password,
  }) async {
    final cleanName = displayName.trim();
    final cleanEmail = email.trim().toLowerCase();

    if (cleanName.isEmpty) {
      throw ArgumentError('Display name is required.');
    }

    if (!cleanEmail.contains('@') ||
        !cleanEmail.substring(cleanEmail.indexOf('@') + 1).contains('.')) {
      throw ArgumentError('Enter a valid email address.');
    }

    if (password.length < 8) {
      throw ArgumentError('Password must contain at least 8 characters.');
    }

    final db = await _appDatabase.database;

    final existingUsers = await db.query(
      'users',
      columns: ['id'],
      where: 'email = ?',
      whereArgs: [cleanEmail],
      limit: 1,
    );

    if (existingUsers.isNotEmpty) {
      throw StateError('An account with this email already exists.');
    }

    final salt = List<int>.generate(16, (_) => Random.secure().nextInt(256));

    final passwordHash = await _derivePasswordHash(
      password: password,
      salt: salt,
      iterations: _passwordIterations,
    );

    final storedPassword = jsonEncode({
      'algorithm': _passwordAlgorithm,
      'iterations': _passwordIterations,
      'salt': base64Encode(salt),
      'hash': base64Encode(passwordHash),
    });

    final userId = await db.insert('users', {
      'display_name': cleanName,
      'email': cleanEmail,
      'password_hash': storedPassword,
      'created_at': DateTime.now().toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.abort);

    final rows = await db.query(
      'users',
      columns: ['id', 'display_name', 'email', 'created_at'],
      where: 'id = ?',
      whereArgs: [userId],
      limit: 1,
    );

    if (rows.isEmpty) {
      throw StateError('The account was created but could not be loaded.');
    }

    return rows.first;
  }

  Future<Map<String, Object?>?> login({
    required String email,
    required String password,
  }) async {
    final cleanEmail = email.trim().toLowerCase();
    final db = await _appDatabase.database;

    final rows = await db.query(
      'users',
      columns: ['id', 'display_name', 'email', 'password_hash', 'created_at'],
      where: 'email = ?',
      whereArgs: [cleanEmail],
      limit: 1,
    );

    if (rows.isEmpty) {
      return null;
    }

    final user = rows.first;
    final storedPassword = user['password_hash'] as String;

    final passwordMatches = await _verifyPassword(
      password: password,
      storedPassword: storedPassword,
    );

    if (!passwordMatches) {
      return null;
    }

    return {
      'id': user['id'],
      'display_name': user['display_name'],
      'email': user['email'],
      'created_at': user['created_at'],
    };
  }

  Future<Map<String, Object?>?> getUserById(int userId) async {
    final db = await _appDatabase.database;

    final rows = await db.query(
      'users',
      columns: ['id', 'display_name', 'email', 'created_at'],
      where: 'id = ?',
      whereArgs: [userId],
      limit: 1,
    );

    return rows.isEmpty ? null : rows.first;
  }

  Future<void> updateDisplayName({
    required int userId,
    required String displayName,
  }) async {
    final cleanName = displayName.trim();

    if (cleanName.isEmpty) {
      throw ArgumentError('Display name is required.');
    }

    final db = await _appDatabase.database;

    final updatedRows = await db.update(
      'users',
      {'display_name': cleanName},
      where: 'id = ?',
      whereArgs: [userId],
    );

    if (updatedRows == 0) {
      throw StateError('User account was not found.');
    }
  }

  Future<int> saveQuizAttempt({
    required int userId,
    required String quizTitle,
    required String subject,
    required String topic,
    required int score,
    required int total,
    required int percentage,
    DateTime? completedAt,
  }) async {
    if (total <= 0 || score < 0 || score > total) {
      throw ArgumentError('Quiz score or total is invalid.');
    }

    final db = await _appDatabase.database;

    return db.insert('quiz_attempts', {
      'user_id': userId,
      'quiz_title': quizTitle,
      'subject': subject,
      'topic': topic,
      'score': score,
      'total': total,
      'percentage': percentage,
      'completed_at': (completedAt ?? DateTime.now()).toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<List<Map<String, Object?>>> getQuizAttempts(int userId) async {
    final db = await _appDatabase.database;

    return db.query(
      'quiz_attempts',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'completed_at DESC',
    );
  }

  Future<List<int>> _derivePasswordHash({
    required String password,
    required List<int> salt,
    required int iterations,
  }) async {
    final algorithm = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: iterations,
      bits: 256,
    );

    final secretKey = await algorithm.deriveKey(
      secretKey: SecretKey(utf8.encode(password)),
      nonce: salt,
    );

    return secretKey.extractBytes();
  }

  Future<bool> _verifyPassword({
    required String password,
    required String storedPassword,
  }) async {
    try {
      final decoded = jsonDecode(storedPassword);

      if (decoded is! Map<String, dynamic> ||
          decoded['algorithm'] != _passwordAlgorithm) {
        return false;
      }

      final iterations = decoded['iterations'];
      final encodedSalt = decoded['salt'];
      final encodedHash = decoded['hash'];

      if (iterations is! int ||
          iterations < 100000 ||
          iterations > 1000000 ||
          encodedSalt is! String ||
          encodedHash is! String) {
        return false;
      }

      final salt = base64Decode(encodedSalt);
      final expectedHash = base64Decode(encodedHash);

      final actualHash = await _derivePasswordHash(
        password: password,
        salt: salt,
        iterations: iterations,
      );

      return _constantTimeEquals(actualHash, expectedHash);
    } on FormatException {
      return false;
    } on ArgumentError {
      return false;
    }
  }

  bool _constantTimeEquals(List<int> first, List<int> second) {
    if (first.length != second.length) {
      return false;
    }

    var difference = 0;

    for (var i = 0; i < first.length; i++) {
      difference |= first[i] ^ second[i];
    }

    return difference == 0;
  }
}
