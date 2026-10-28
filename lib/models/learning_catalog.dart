enum DifficultyLevel {
  beginner,
  intermediate,
  advanced,
  diploma,
  degree,
}

extension DifficultyLevelLabel on DifficultyLevel {
  String get label {
    switch (this) {
      case DifficultyLevel.beginner:
        return 'Beginner';
      case DifficultyLevel.intermediate:
        return 'Intermediate';
      case DifficultyLevel.advanced:
        return 'Advanced';
      case DifficultyLevel.diploma:
        return 'Diploma';
      case DifficultyLevel.degree:
        return 'Degree';
    }
  }
}

class LearningQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int answerIndex;
  final String explanation;

  const LearningQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.explanation,
  });
}

class LearningQuiz {
  final String id;
  final String title;
  final String description;
  final DifficultyLevel difficulty;
  final int estimatedMinutes;
  final List<LearningQuestion> questions;

  const LearningQuiz({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.estimatedMinutes,
    required this.questions,
  });
}

class LearningTopic {
  final String id;
  final String title;
  final String description;
  final List<LearningQuiz> quizzes;

  const LearningTopic({
    required this.id,
    required this.title,
    required this.description,
    required this.quizzes,
  });
}

class LearningSubject {
  final String id;
  final String title;
  final String description;
  final String iconKey;
  final List<LearningTopic> topics;

  const LearningSubject({
    required this.id,
    required this.title,
    required this.description,
    required this.iconKey,
    required this.topics,
  });
}


