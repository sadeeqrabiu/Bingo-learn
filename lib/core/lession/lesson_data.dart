
import 'package:bingolearn/core/lession/lesson_model.dart';

class LessonData{
  LessonData._();

  static const googleAIStudioAPIKey = 'AIzaSyAfnQqSJeljb4_g-CmweqsiQ_fDXxkPTfk';

  /// Lesson Phases
  static final lessons = <LessonModel>[
    LessonModel(
      phase: 'I am',
    ),
    LessonModel(
      phase: 'Hello',
    ),
    LessonModel(
      phase: 'He is',
    ),
    LessonModel(
      phase: 'she is',
    ),
    LessonModel(
      phase: 'We are',
    ),
    LessonModel(
      phase: 'Thank you',
    ),
    LessonModel(
      phase: 'How are you',
    ),
    LessonModel(
      phase: 'Goodbye',
    ),
    LessonModel(
      phase: 'what is your name',
    ),
    LessonModel(
      phase: 'My name is',
    ),
  ];
}
