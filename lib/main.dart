import 'package:flutter/material.dart';
import 'database/auth_repository.dart';
import 'screens/auth_screen.dart';
import 'models/learning_catalog.dart';
import 'data/learning_catalog_data.dart';

void main() {
  runApp(const QuizApp());
}

const Color ink = Color(0xFFF2F5FA);
const Color violet = Color(0xFF26D9F2);
const Color canvas = Color(0xFF151B28);
const Color mint = Color(0xFF35D39A);
const Color coral = Color(0xFFFF7272);

class QuizQuestion {
  final String question;
  final List<String> options;
  final int answerIndex;
  final String explanation;
  final String category;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.explanation,
    required this.category,
  });
}

final List<QuizQuestion> questions = learningSubjects
    .expand((subject) => subject.topics)
    .expand(
      (topic) => topic.quizzes.expand(
        (quiz) => quiz.questions.map(
          (question) => QuizQuestion(
            question: question.question,
            options: question.options,
            answerIndex: question.answerIndex,
            explanation: question.explanation,
            category: topic.title,
          ),
        ),
      ),
    )
    .toList();

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: canvas,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: violet,
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.standard,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
          headlineMedium: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(fontSize: 15, height: 1.5),
          bodyMedium: TextStyle(fontSize: 13, height: 1.45),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size(0, 48),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      home: AuthGate(
        authenticatedBuilder: (user, onLogout) =>
            QuizHomePage(currentUser: user, onLogout: onLogout),
      ),
    );
  }
}

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({
    super.key,
    required this.currentUser,
    required this.onLogout,
  });

  final Map<String, Object?> currentUser;
  final VoidCallback onLogout;

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  @override
  void initState() {
    super.initState();
    displayName = (widget.currentUser['display_name'] as String?) ?? 'Learner';
    _loadQuizHistory();
  }

  int currentIndex = 0;
  int score = 0;
  int? selectedIndex;
  bool finished = false;
  bool started = false;
  String selectedCategory = 'ALL';
  LearningSubject? selectedSubject;
  LearningTopic? selectedTopic;
  LearningQuiz? selectedQuiz;
  List<int?> answers = List<int?>.filled(questions.length, null);
  List<Map<String, dynamic>> quizHistory = [];
  bool progressLoaded = false;
  int selectedTabIndex = 0;
  String displayName = 'Learner';
  String exploreSearchQuery = '';

  Future<void> _loadQuizHistory() async {
    try {
      final userId = widget.currentUser['id'] as int;
      final attempts = await AuthRepository.instance.getQuizAttempts(userId);

      quizHistory = attempts.map((attempt) {
        return <String, dynamic>{
          'title': attempt['quiz_title'],
          'subject': attempt['subject'],
          'topic': attempt['topic'],
          'score': attempt['score'],
          'total': attempt['total'],
          'percentage': attempt['percentage'],
          'completedAt': attempt['completed_at'],
        };
      }).toList();
    } catch (error) {
      debugPrint('Could not load account quiz history: $error');
    }

    if (mounted) {
      setState(() => progressLoaded = true);
    }
  }

  Future<void> _saveQuizAttempt() async {
    final total = activeQuestions.length;
    if (total == 0) return;

    final title =
        selectedQuiz?.title ??
        (selectedCategory == 'ALL' ? 'All Questions' : selectedCategory);
    final subject = selectedSubject?.title ?? 'General';
    final topic = selectedTopic?.title ?? selectedCategory;
    final percentage = (score / total * 100).round();
    final completedAt = DateTime.now();

    try {
      final userId = widget.currentUser['id'] as int;
      await AuthRepository.instance.saveQuizAttempt(
        userId: userId,
        quizTitle: title,
        subject: subject,
        topic: topic,
        score: score,
        total: total,
        percentage: percentage,
        completedAt: completedAt,
      );

      if (!mounted) return;
      setState(() {
        quizHistory.insert(0, <String, dynamic>{
          'title': title,
          'subject': subject,
          'topic': topic,
          'score': score,
          'total': total,
          'percentage': percentage,
          'completedAt': completedAt.toIso8601String(),
        });
        if (quizHistory.length > 50) {
          quizHistory = quizHistory.take(50).toList();
        }
      });
    } catch (error) {
      debugPrint('Could not save account quiz attempt: $error');
    }
  }

  List<QuizQuestion> get activeQuestions {
    if (selectedQuiz != null) {
      return selectedQuiz!.questions
          .map(
            (question) => QuizQuestion(
              question: question.question,
              options: question.options,
              answerIndex: question.answerIndex,
              explanation: question.explanation,
              category: selectedTopic?.title ?? 'Learning',
            ),
          )
          .toList();
    }
    if (selectedCategory == 'ALL') return questions;
    return questions
        .where(
          (question) =>
              question.category.toLowerCase() == selectedCategory.toLowerCase(),
        )
        .toList();
  }

  QuizQuestion get currentQuestion => activeQuestions[currentIndex];

  void _startCategoryQuiz(String category) {
    setState(() {
      selectedCategory = category;
      currentIndex = 0;
      score = 0;
      selectedIndex = null;
      finished = false;
      started = true;
      answers = List<int?>.filled(activeQuestions.length, null);
    });
  }

  void _startLearningQuiz(LearningQuiz quiz) {
    setState(() {
      selectedQuiz = quiz;
      currentIndex = 0;
      score = 0;
      selectedIndex = null;
      finished = false;
      started = true;
      answers = List<int?>.filled(quiz.questions.length, null);
    });
  }

  void chooseAnswer(int index) {
    if (selectedIndex != null) return;

    setState(() {
      selectedIndex = index;
      answers[currentIndex] = index;
      if (index == currentQuestion.answerIndex) score++;
    });
  }

  void nextQuestion() {
    if (selectedIndex == null) return;

    setState(() {
      if (currentIndex < activeQuestions.length - 1) {
        currentIndex++;
        selectedIndex = null;
      } else {
        finished = true;
        _saveQuizAttempt();
      }
    });
  }

  void restartQuiz() {
    setState(() {
      currentIndex = 0;
      score = 0;
      selectedIndex = null;
      finished = false;
      started = true;
      for (var i = 0; i < answers.length; i++) {
        answers[i] = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: (!started && !finished)
          ? NavigationBar(
              selectedIndex: selectedTabIndex,
              onDestinationSelected: (index) {
                setState(() => selectedTabIndex = index);
              },
              backgroundColor: const Color(0xFF1C2433),
              indicatorColor: violet.withValues(alpha: 0.16),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.explore_outlined),
                  selectedIcon: Icon(Icons.explore_rounded),
                  label: 'Explore',
                ),
                NavigationDestination(
                  icon: Icon(Icons.insights_outlined),
                  selectedIcon: Icon(Icons.insights_rounded),
                  label: 'Progress',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline_rounded),
                  selectedIcon: Icon(Icons.person_rounded),
                  label: 'Profile',
                ),
              ],
            )
          : null,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: finished
                  ? _buildResults()
                  : started
                  ? _buildQuiz()
                  : _buildSelectedTab(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedTab() {
    switch (selectedTabIndex) {
      case 1:
        return _buildExploreScreen();
      case 2:
        return _buildProgressScreen();
      case 3:
        return _buildProfileScreen();
      default:
        return _buildHome();
    }
  }

  Widget _screenHeading(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ink,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF9AA8BC),
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildExploreScreen() {
    final query = exploreSearchQuery.trim().toLowerCase();

    final matchingQuizzes = <Map<String, dynamic>>[];
    for (final subject in learningSubjects) {
      for (final topic in subject.topics) {
        for (final quiz in topic.quizzes) {
          final searchable = [
            subject.title,
            subject.description,
            topic.title,
            topic.description,
            quiz.title,
            quiz.description,
            quiz.difficulty.label,
          ].join(' ').toLowerCase();

          if (query.isNotEmpty && searchable.contains(query)) {
            matchingQuizzes.add({
              'subject': subject,
              'topic': topic,
              'quiz': quiz,
            });
          }
        }
      }
    }

    return SingleChildScrollView(
      key: const ValueKey('explore'),
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _screenHeading(
            'Explore subjects',
            'Find a topic or choose a quiz to start learning.',
          ),
          const SizedBox(height: 22),
          TextField(
            onChanged: (value) => setState(() => exploreSearchQuery = value),
            style: const TextStyle(color: ink),
            decoration: InputDecoration(
              hintText: 'Search subjects, topics or quizzes',
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: exploreSearchQuery.isEmpty
                  ? null
                  : IconButton(
                      tooltip: 'Clear search',
                      onPressed: () => setState(() => exploreSearchQuery = ''),
                      icon: const Icon(Icons.close_rounded),
                    ),
              filled: true,
              fillColor: const Color(0xFF202A3A),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (query.isNotEmpty)
            if (matchingQuizzes.isEmpty)
              _buildEmptyExplore()
            else ...[
              Text(
                '${matchingQuizzes.length} matching quizzes',
                style: const TextStyle(
                  color: ink,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              ...matchingQuizzes.map((item) {
                final subject = item['subject'] as LearningSubject;
                final topic = item['topic'] as LearningTopic;
                final quiz = item['quiz'] as LearningQuiz;

                return Card(
                  color: const Color(0xFF202A3A),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF30334B),
                      child: Icon(Icons.quiz_rounded, color: violet),
                    ),
                    title: Text(
                      quiz.title,
                      style: const TextStyle(
                        color: ink,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    subtitle: Text(
                      '${subject.title} Ã¢â‚¬Â¢ ${topic.title}\n'
                      '${quiz.questions.length} questions Ã¢â‚¬Â¢ '
                      '${quiz.estimatedMinutes} min',
                      style: const TextStyle(
                        color: Color(0xFF9AA8BC),
                        height: 1.5,
                      ),
                    ),
                    isThreeLine: true,
                    trailing: const Icon(
                      Icons.play_circle_outline_rounded,
                      color: violet,
                    ),
                    onTap: () => _startLearningQuiz(quiz),
                  ),
                );
              }),
            ]
          else ...[
            const Text(
              'ALL SUBJECTS',
              style: TextStyle(
                color: Color(0xFF9AA8BC),
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            ...learningSubjects.map(
              (subject) => Card(
                color: const Color(0xFF202A3A),
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: Color(0xFF344156)),
                ),
                child: ExpansionTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFF30334B),
                    child: Icon(Icons.school_rounded, color: violet),
                  ),
                  title: Text(
                    subject.title,
                    style: const TextStyle(
                      color: ink,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(
                    '${subject.topics.length} topics',
                    style: const TextStyle(color: Color(0xFF9AA8BC)),
                  ),
                  children: [
                    ...subject.topics.map(
                      (topic) => ExpansionTile(
                        tilePadding: const EdgeInsets.only(left: 20, right: 16),
                        title: Text(
                          topic.title,
                          style: const TextStyle(
                            color: ink,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          '${topic.quizzes.length} quizzes',
                          style: const TextStyle(color: Color(0xFF9AA8BC)),
                        ),
                        children: topic.quizzes
                            .map(
                              (quiz) => ListTile(
                                contentPadding: const EdgeInsets.only(
                                  left: 32,
                                  right: 18,
                                ),
                                leading: const Icon(
                                  Icons.play_circle_outline_rounded,
                                  color: violet,
                                ),
                                title: Text(
                                  quiz.title,
                                  style: const TextStyle(color: ink),
                                ),
                                subtitle: Text(
                                  '${quiz.questions.length} questions Ã¢â‚¬Â¢ '
                                  '${quiz.estimatedMinutes} min',
                                  style: const TextStyle(
                                    color: Color(0xFF9AA8BC),
                                  ),
                                ),
                                onTap: () => _startLearningQuiz(quiz),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyExplore() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF202A3A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          Icon(Icons.search_off_rounded, size: 42, color: violet),
          SizedBox(height: 12),
          Text(
            'No matching quizzes',
            style: TextStyle(
              color: ink,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Try a different subject, topic or keyword.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF9AA8BC)),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressScreen() {
    return SingleChildScrollView(
      key: const ValueKey('progress'),
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _screenHeading(
            'Your progress',
            'Review completed quizzes and your average score.',
          ),
          const SizedBox(height: 22),
          _buildProgressSection(),
        ],
      ),
    );
  }

  Widget _buildProfileScreen() {
    final completed = quizHistory.length;
    final average = completed == 0
        ? 0
        : (quizHistory.fold<int>(
                    0,
                    (sum, attempt) =>
                        sum + ((attempt['percentage'] as num?)?.toInt() ?? 0),
                  ) /
                  completed)
              .round();

    return SingleChildScrollView(
      key: const ValueKey('profile'),
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _screenHeading(
            'Your profile',
            'Make your learning space feel like yours.',
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF30334B), Color(0xFF202A3A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF454968)),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 38,
                  backgroundColor: Color(0xFF454968),
                  child: Icon(Icons.person_rounded, color: violet, size: 42),
                ),
                const SizedBox(height: 14),
                Text(
                  displayName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ink,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Quizora learner',
                  style: TextStyle(color: Color(0xFF9AA8BC)),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.currentUser['email'] as String? ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFF9AA8BC)),
                ),
                const SizedBox(height: 18),
                OutlinedButton.icon(
                  onPressed: _editDisplayName,
                  icon: const Icon(Icons.edit_rounded),
                  label: const Text('Edit display name'),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: widget.onLogout,
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Log out'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: _homeStat(
                  Icons.task_alt_rounded,
                  '$completed',
                  'Quizzes completed',
                  violet,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _homeStat(
                  Icons.trending_up_rounded,
                  '$average%',
                  'Average score',
                  mint,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF202A3A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF344156)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ABOUT YOUR DATA',
                  style: TextStyle(
                    color: ink,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your account and quiz history are stored locally on this device. Quiz scores are saved to the account you sign in with.',
                  style: TextStyle(color: Color(0xFF9AA8BC), height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _editDisplayName() async {
    final controller = TextEditingController(text: displayName);

    final newName = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit display name'),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 30,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(hintText: 'Enter your name'),
          onSubmitted: (value) => Navigator.of(dialogContext).pop(value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(controller.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    final trimmedName = newName?.trim();
    if (trimmedName != null && trimmedName.isNotEmpty) {
      try {
        final userId = widget.currentUser['id'] as int;
        await AuthRepository.instance.updateDisplayName(
          userId: userId,
          displayName: trimmedName,
        );
        if (mounted) {
          setState(() => displayName = trimmedName);
        }
      } catch (error) {
        debugPrint('Could not update account display name: $error');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not save your name.')),
          );
        }
      }
    }

    controller.dispose();
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      key: const ValueKey('home'),
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: violet,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.bolt_rounded,
                  color: Color(0xFF151B28),
                  size: 29,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'QUIZORA',
                      style: TextStyle(
                        color: ink,
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'THINK. PLAY. GROW.',
                      style: TextStyle(
                        color: Color(0xFF9AA8BC),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF222B3B),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF303B4F)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.stars_rounded,
                      color: Color(0xFFFFC857),
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '$score pts',
                      style: const TextStyle(
                        color: ink,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 38),
          const Text(
            'YOUR NEXT',
            style: TextStyle(
              color: Color(0xFF26D9F2),
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'BRILLIANT BRAIN\nBOOST.',
            style: TextStyle(
              color: ink,
              fontSize: 37,
              height: 1.12,
              fontWeight: FontWeight.w900,
              letterSpacing: -1.1,
            ),
          ),
          const SizedBox(height: 13),
          const Text(
            'Challenge yourself with quick questions,\\nlearn something new, and track your progress.',
            style: TextStyle(
              color: Color(0xFF9AA8BC),
              height: 1.55,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 27),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF202A3A),
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: const Color(0xFF344156)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: const Color(0xFF303849),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.auto_awesome_rounded,
                        color: Color(0xFFFFC857),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DAILY CHALLENGE',
                            style: TextStyle(
                              color: Color(0xFFFFC857),
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Ready to test your knowledge?',
                            style: TextStyle(
                              color: ink,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.quiz_outlined,
                      color: Color(0xFF9AA8BC),
                      size: 17,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      '${questions.length} questions',
                      style: const TextStyle(
                        color: Color(0xFFB5C0D0),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.timer_outlined,
                      color: Color(0xFF9AA8BC),
                      size: 17,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'No time limit',
                      style: TextStyle(color: Color(0xFFB5C0D0), fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    onPressed: () => _startCategoryQuiz(selectedCategory),
                    style: FilledButton.styleFrom(
                      backgroundColor: violet,
                      foregroundColor: const Color(0xFF151B28),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start quiz',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_rounded, size: 21),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 29),
          const Text(
            'YOUR OVERVIEW',
            style: TextStyle(
              color: ink,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _homeStat(
                  Icons.quiz_rounded,
                  '${questions.length}',
                  'Questions',
                  violet,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _homeStat(
                  Icons.category_rounded,
                  '${questions.map((q) => q.category).toSet().length}',
                  'Categories',
                  const Color(0xFFFFC857),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _homeStat(
                  Icons.emoji_events_rounded,
                  '${questions.length}',
                  'Max points',
                  mint,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildProgressSection(),
          const SizedBox(height: 29),
          Text(
            selectedSubject == null
                ? 'EXPLORE SUBJECTS'
                : selectedTopic == null
                ? selectedSubject!.title.toUpperCase()
                : selectedTopic!.title.toUpperCase(),
            style: const TextStyle(
              color: ink,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            selectedSubject == null
                ? 'Choose a subject to begin learning.'
                : selectedTopic == null
                ? selectedSubject!.description
                : selectedTopic!.description,
            style: const TextStyle(color: Color(0xFF9AA8BC), fontSize: 12),
          ),
          const SizedBox(height: 15),
          if (selectedSubject != null)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => setState(() {
                  if (selectedTopic != null) {
                    selectedTopic = null;
                    selectedQuiz = null;
                  } else {
                    selectedSubject = null;
                    selectedQuiz = null;
                  }
                }),
                icon: const Icon(Icons.arrow_back_rounded),
                label: Text(selectedTopic == null ? 'All subjects' : 'Topics'),
              ),
            ),
          if (selectedSubject == null)
            ...learningSubjects.map(
              (subject) => _homeCategory(
                Icons.school_rounded,
                subject.title,
                subject.description,
                violet,
                subject.topics.length,
                onTap: () => setState(() {
                  selectedSubject = subject;
                  selectedTopic = null;
                  selectedQuiz = null;
                }),
              ),
            )
          else if (selectedTopic == null)
            ...selectedSubject!.topics.map(
              (topic) => _homeCategory(
                Icons.menu_book_rounded,
                topic.title,
                topic.description,
                violet,
                topic.quizzes.length,
                onTap: () => setState(() {
                  selectedTopic = topic;
                  selectedQuiz = null;
                }),
              ),
            )
          else ...[
            ...selectedTopic!.quizzes.map(
              (quiz) => _homeCategory(
                Icons.quiz_rounded,
                quiz.title,
                '${quiz.difficulty.label} ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢ ${quiz.estimatedMinutes} min\n${quiz.description}',
                violet,
                quiz.questions.length,
                onTap: () => setState(() => selectedQuiz = quiz),
              ),
            ),
            if (selectedQuiz != null)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF202A3A),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: violet),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedQuiz!.title,
                      style: const TextStyle(
                        color: ink,
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${selectedQuiz!.difficulty.label} ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢ '
                      '${selectedQuiz!.questions.length} questions ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢ '
                      '${selectedQuiz!.estimatedMinutes} minutes',
                      style: const TextStyle(color: Color(0xFF9AA8BC)),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: FilledButton(
                        onPressed: () => _startLearningQuiz(selectedQuiz!),
                        child: const Text('Start selected quiz'),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    final average = quizHistory.isEmpty
        ? 0
        : (quizHistory.fold<int>(
                    0,
                    (sum, attempt) =>
                        sum + ((attempt['percentage'] as num?)?.toInt() ?? 0),
                  ) /
                  quizHistory.length)
              .round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'YOUR PROGRESS',
          style: TextStyle(
            color: ink,
            fontSize: 17,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF202A3A),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFF344156)),
          ),
          child: !progressLoaded
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(color: violet),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _progressMetric(
                            'Completed',
                            '${quizHistory.length}',
                            Icons.task_alt_rounded,
                            violet,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _progressMetric(
                            'Average score',
                            '$average%',
                            Icons.trending_up_rounded,
                            mint,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'RECENT ATTEMPTS',
                      style: TextStyle(
                        color: Color(0xFF9AA8BC),
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (quizHistory.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Your completed quizzes will appear here. Start a quiz to track your progress.',
                          style: TextStyle(
                            color: Color(0xFF9AA8BC),
                            height: 1.5,
                            fontSize: 12,
                          ),
                        ),
                      )
                    else
                      ...quizHistory.take(3).map((attempt) {
                        final title = (attempt['title'] ?? 'Quiz').toString();
                        final score = (attempt['score'] as num?)?.toInt() ?? 0;
                        final total = (attempt['total'] as num?)?.toInt() ?? 0;
                        final percentage =
                            (attempt['percentage'] as num?)?.toInt() ?? 0;
                        final date = DateTime.tryParse(
                          (attempt['completedAt'] ?? '').toString(),
                        )?.toLocal();
                        final dateLabel = date == null
                            ? 'Date unavailable'
                            : '${date.year}-'
                                  '${date.month.toString().padLeft(2, '0')}-'
                                  '${date.day.toString().padLeft(2, '0')}';

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF303849),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.quiz_outlined,
                                  color: violet,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: ink,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      dateLabel,
                                      style: const TextStyle(
                                        color: Color(0xFF9AA8BC),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '$percentage%',
                                    style: TextStyle(
                                      color: percentage >= 80
                                          ? mint
                                          : percentage >= 50
                                          ? const Color(0xFFFFC857)
                                          : coral,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '$score/$total',
                                    style: const TextStyle(
                                      color: Color(0xFF9AA8BC),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                  ],
                ),
        ),
      ],
    );
  }

  Widget _progressMetric(
    String label,
    String value,
    IconData icon,
    Color accent,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF293447),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accent, size: 20),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: ink,
              fontSize: 23,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF9AA8BC), fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _homeStat(IconData icon, String value, String label, Color accent) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF202A3A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF303B4F)),
      ),
      child: Column(
        children: [
          Icon(icon, color: accent, size: 21),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: ink,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF9AA8BC), fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _homeCategory(
    IconData icon,
    String title,
    String subtitle,
    Color accent,
    int count, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF202A3A),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF303B4F)),
        ),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: accent, size: 23),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: ink,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF9AA8BC),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '$count Qs',
              style: TextStyle(
                color: accent,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuiz() {
    final question = currentQuestion;
    final progress = (currentIndex + 1) / activeQuestions.length;

    return SingleChildScrollView(
      key: const ValueKey('quiz'),
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: violet,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.bolt_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'QUIZORA',
                    style: TextStyle(
                      color: ink,
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    'Learn something new',
                    style: TextStyle(color: Color(0xFF9AA8BC), fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.stars_rounded,
                      color: Color(0xFFFFB547),
                      size: 19,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '$score pts',
                      style: const TextStyle(
                        color: ink,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(23),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF26364A), Color(0xFF1C2635)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(27),
              boxShadow: [
                BoxShadow(
                  color: violet.withValues(alpha: 0.20),
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.17),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        question.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.auto_awesome_rounded,
                      color: Color(0xFF26D9F2),
                      size: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 23),
                Text(
                  'Question ${currentIndex + 1} of ${activeQuestions.length}',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.78),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  question.question,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    height: 1.28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 7,
                    backgroundColor: Colors.white.withValues(alpha: 0.22),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF26D9F2),
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  '${(progress * 100).round()}% completed',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 27),
          const Text(
            'Choose your answer',
            style: TextStyle(
              color: ink,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Select one option to continue.',
            style: TextStyle(color: Color(0xFF9AA8BC), fontSize: 13),
          ),
          const SizedBox(height: 17),
          ...List.generate(
            question.options.length,
            (index) => _buildOption(question, index),
          ),
          if (selectedIndex != null) ...[
            const SizedBox(height: 8),
            _buildFeedback(question),
          ],
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 57,
            child: FilledButton(
              onPressed: selectedIndex == null ? null : nextQuestion,
              style: FilledButton.styleFrom(
                backgroundColor: violet,
                disabledBackgroundColor: const Color(0xFF303B4F),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentIndex == activeQuestions.length - 1
                        ? 'See my results'
                        : 'Next question',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 9),
                  const Icon(Icons.arrow_forward_rounded, size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: Text(
              'TAKE YOUR TIME  ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¢  HAVE FUN',
              style: TextStyle(
                color: Colors.blueGrey.shade400,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(QuizQuestion question, int index) {
    final isSelected = selectedIndex == index;
    final isAnswered = selectedIndex != null;
    final isCorrect = index == question.answerIndex;

    Color borderColor = const Color(0xFF3A465A);
    Color background = const Color(0xFF202A3A);
    Color iconColor = const Color(0xFF8790A4);
    IconData? trailingIcon;

    if (isAnswered && isCorrect) {
      borderColor = mint;
      background = const Color(0xFF183B36);
      iconColor = mint;
      trailingIcon = Icons.check_circle_rounded;
    } else if (isSelected && !isCorrect) {
      borderColor = coral;
      background = const Color(0xFF40282D);
      iconColor = coral;
      trailingIcon = Icons.cancel_rounded;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(17),
        child: InkWell(
          onTap: isAnswered ? null : () => chooseAnswer(index),
          borderRadius: BorderRadius.circular(17),
          child: Container(
            constraints: const BoxConstraints(minHeight: 65),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Text(
                    String.fromCharCode(65 + index),
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Text(
                    question.options[index],
                    style: TextStyle(
                      color: ink,
                      fontSize: 14,
                      fontWeight: isSelected || (isAnswered && isCorrect)
                          ? FontWeight.w800
                          : FontWeight.w600,
                    ),
                  ),
                ),
                if (trailingIcon != null)
                  Icon(trailingIcon, color: iconColor, size: 22)
                else
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.blueGrey.shade200,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeedback(QuizQuestion question) {
    final correct = selectedIndex == question.answerIndex;
    final color = correct ? mint : coral;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: correct ? const Color(0xFF183B36) : const Color(0xFF40282D),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            correct ? Icons.check_circle_rounded : Icons.lightbulb_rounded,
            color: color,
            size: 23,
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  correct ? 'Great job!' : 'Not quite!',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  question.explanation,
                  style: const TextStyle(
                    color: ink,
                    height: 1.45,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResults() {
    final percentage = (score / activeQuestions.length * 100).round();
    final title = percentage >= 80
        ? 'Outstanding!'
        : percentage >= 50
        ? 'Well done!'
        : 'Keep learning!';
    final message = percentage >= 80
        ? 'You have a fantastic grasp of these topics.'
        : percentage >= 50
        ? 'Good effort! A little more practice will help.'
        : 'Every attempt helps you learn something new.';

    return SingleChildScrollView(
      key: const ValueKey('results'),
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: violet,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.bolt_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Container(
            height: 112,
            width: 112,
            decoration: BoxDecoration(
              color: const Color(0xFF3B3425),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Icon(
              percentage >= 80
                  ? Icons.emoji_events_rounded
                  : percentage >= 50
                  ? Icons.workspace_premium_rounded
                  : Icons.auto_awesome_rounded,
              color: const Color(0xFFE5A326),
              size: 63,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'QUIZ COMPLETED',
            style: TextStyle(
              color: violet,
              fontSize: 11,
              letterSpacing: 2.1,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ink,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF9AA8BC),
              height: 1.5,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF202A3A),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: const Color(0xFF344156)),
            ),
            child: Column(
              children: [
                Text(
                  '$percentage%',
                  style: const TextStyle(
                    color: violet,
                    fontSize: 53,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  'YOUR FINAL SCORE',
                  style: TextStyle(
                    color: Color(0xFF9AA8BC),
                    fontSize: 10,
                    letterSpacing: 1.6,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 23),
                Row(
                  children: [
                    Expanded(
                      child: _statCard(
                        icon: Icons.check_circle_rounded,
                        label: 'Correct',
                        value: '$score',
                        color: mint,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _statCard(
                        icon: Icons.cancel_rounded,
                        label: 'Incorrect',
                        value: '${activeQuestions.length - score}',
                        color: coral,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: score / activeQuestions.length,
                    minHeight: 9,
                    backgroundColor: const Color(0xFF303B4F),
                    valueColor: const AlwaysStoppedAnimation<Color>(violet),
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  '$score out of ${activeQuestions.length} questions answered correctly',
                  style: const TextStyle(
                    color: Color(0xFF9AA8BC),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 57,
            child: FilledButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text(
                'Try again',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: violet,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
            ),
          ),
          const SizedBox(height: 13),
          TextButton.icon(
            onPressed: () => _showReview(context),
            icon: const Icon(Icons.fact_check_outlined),
            label: const Text('Review your answers'),
            style: TextButton.styleFrom(foregroundColor: ink),
          ),
        ],
      ),
    );
  }

  Widget _statCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: ink,
              fontSize: 23,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  void _showReview(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: canvas,
      builder: (sheetContext) {
        return SafeArea(
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.78,
            maxChildSize: 0.92,
            minChildSize: 0.5,
            builder: (context, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 12, 12),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Answer review',
                            style: TextStyle(
                              color: ink,
                              fontSize: 21,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(sheetContext),
                          icon: const Icon(Icons.close_rounded),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
                      itemCount: activeQuestions.length,
                      itemBuilder: (context, index) {
                        final question = activeQuestions[index];
                        final answer = answers[index];
                        final correct = answer == question.answerIndex;

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'QUESTION ${index + 1} ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¢ ${question.category}',
                                style: const TextStyle(
                                  color: violet,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.7,
                                ),
                              ),
                              const SizedBox(height: 9),
                              Text(
                                question.question,
                                style: const TextStyle(
                                  color: ink,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Your answer: ${answer == null ? 'Not answered' : question.options[answer]}',
                                style: TextStyle(
                                  color: answer == null
                                      ? const Color(0xFF9AA8BC)
                                      : correct
                                      ? mint
                                      : coral,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Correct answer: ${question.options[question.answerIndex]}',
                                style: const TextStyle(
                                  color: mint,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                question.explanation,
                                style: const TextStyle(
                                  color: Color(0xFF9AA8BC),
                                  height: 1.4,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
