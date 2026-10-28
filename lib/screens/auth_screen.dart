import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/auth_repository.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.onAuthenticated});

  final Future<void> Function(Map<String, Object?> user) onAuthenticated;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isSignUp = false;
  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _errorMessage;

  static const _background = Color(0xFF111827);
  static const _panel = Color(0xFF202A3A);
  static const _ink = Color(0xFFF4F7FB);
  static const _muted = Color(0xFF9AA8BC);
  static const _violet = Color(0xFF9B8CFF);
  static const _cyan = Color(0xFF55D6E8);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final user = _isSignUp
          ? await AuthRepository.instance.signUp(
              displayName: _nameController.text.trim(),
              email: _emailController.text.trim(),
              password: _passwordController.text,
            )
          : await AuthRepository.instance.login(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            );

      if (!mounted) return;

      if (user == null) {
        setState(() {
          _errorMessage = 'Email or password is incorrect.';
          _isLoading = false;
        });
        return;
      }

      await widget.onAuthenticated(user);
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _errorMessage = error
            .toString()
            .replaceFirst('Exception: ', '')
            .replaceFirst('StateError: ', '')
            .replaceFirst('ArgumentError: ', '');
        _isLoading = false;
      });
    }
  }

  void _switchMode() {
    setState(() {
      _isSignUp = !_isSignUp;
      _errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: 78,
                    height: 78,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [_violet, _cyan],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.auto_awesome_rounded,
                      size: 42,
                      color: _background,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'QUIZORA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _cyan,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _isSignUp ? 'Create your account' : 'Welcome back',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: _ink,
                      fontSize: 29,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    _isSignUp
                        ? 'Create a profile to keep your quiz progress private.'
                        : 'Sign in to continue your learning journey.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: _muted,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: _panel,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFF344156)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (_isSignUp) ...[
                            _buildLabel('DISPLAY NAME'),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _nameController,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(color: _ink),
                              decoration: _inputDecoration(
                                'How should we call you?',
                                Icons.person_outline_rounded,
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Enter your display name.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 18),
                          ],
                          _buildLabel('EMAIL ADDRESS'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            style: const TextStyle(color: _ink),
                            decoration: _inputDecoration(
                              'you@example.com',
                              Icons.mail_outline_rounded,
                            ),
                            validator: (value) {
                              final email = value?.trim() ?? '';
                              if (!email.contains('@') ||
                                  !email
                                      .substring(email.indexOf('@') + 1)
                                      .contains('.')) {
                                return 'Enter a valid email address.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          _buildLabel('PASSWORD'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              if (!_isLoading) _submit();
                            },
                            style: const TextStyle(color: _ink),
                            decoration:
                                _inputDecoration(
                                  'Enter your password',
                                  Icons.lock_outline_rounded,
                                ).copyWith(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: _muted,
                                    ),
                                  ),
                                ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your password.';
                              }
                              if (_isSignUp && value.length < 8) {
                                return 'Use at least 8 characters.';
                              }
                              return null;
                            },
                          ),
                          if (_errorMessage != null) ...[
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF492C3A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _errorMessage!,
                                style: const TextStyle(
                                  color: Color(0xFFFFA9B8),
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 54,
                            child: FilledButton(
                              onPressed: _isLoading ? null : _submit,
                              style: FilledButton.styleFrom(
                                backgroundColor: _violet,
                                foregroundColor: _background,
                                disabledBackgroundColor: _violet.withValues(
                                  alpha: 0.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        color: _background,
                                      ),
                                    )
                                  : Text(
                                      _isSignUp ? 'Create account' : 'Sign in',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  _isSignUp
                                      ? 'Already have an account?'
                                      : 'New to Quizora?',
                                  style: const TextStyle(
                                    color: _muted,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: _isLoading ? null : _switchMode,
                                child: Text(
                                  _isSignUp ? 'Sign in' : 'Sign up',
                                  style: const TextStyle(
                                    color: _cyan,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Your account and quiz history stay on this device.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: _muted, fontSize: 11, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: _muted,
        fontSize: 10,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.3,
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: _muted, fontSize: 13),
      prefixIcon: Icon(icon, color: _muted, size: 20),
      filled: true,
      fillColor: _background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF3B465B)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF3B465B)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: _violet, width: 1.5),
      ),
      errorStyle: const TextStyle(fontSize: 11),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key, required this.authenticatedBuilder});

  final Widget Function(Map<String, Object?> user, VoidCallback onLogout)
  authenticatedBuilder;

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  static const _sessionKey = 'session_user_id';

  Map<String, Object?>? _user;
  bool _isRestoring = true;

  @override
  void initState() {
    super.initState();
    _restoreSession();
  }

  Future<void> _restoreSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt(_sessionKey);

      if (userId != null) {
        final user = await AuthRepository.instance.getUserById(userId);
        if (user != null) {
          _user = user;
        } else {
          await prefs.remove(_sessionKey);
        }
      }
    } catch (error) {
      debugPrint('Could not restore Quizora session: $error');
    }

    if (mounted) {
      setState(() => _isRestoring = false);
    }
  }

  Future<void> _handleAuthenticated(Map<String, Object?> user) async {
    final userId = user['id'];
    if (userId is! int) {
      throw StateError('The account ID is missing or invalid.');
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_sessionKey, userId);

    if (!mounted) return;
    setState(() {
      _user = user;
      _isRestoring = false;
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionKey);

    if (!mounted) return;
    setState(() => _user = null);
  }

  @override
  Widget build(BuildContext context) {
    if (_isRestoring) {
      return const Scaffold(
        backgroundColor: Color(0xFF111827),
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFF9B8CFF)),
        ),
      );
    }

    final user = _user;
    if (user == null) {
      return AuthScreen(onAuthenticated: _handleAuthenticated);
    }

    return widget.authenticatedBuilder(user, () {
      _logout();
    });
  }
}
