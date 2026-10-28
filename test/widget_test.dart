import 'package:flutter_test/flutter_test.dart';
import 'package:task_04_quiz_app/main.dart';

void main() {
  testWidgets('Quizora app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const QuizApp());

    expect(find.byType(QuizApp), findsOneWidget);
  });
}


