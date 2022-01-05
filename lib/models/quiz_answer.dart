import 'package:flutter/material.dart';

enum QuizAnswer { correct, wrong }

extension QuizAnswerExtension on QuizAnswer {
  MaterialColor get color {
    switch (this) {
      case QuizAnswer.correct:
        return Colors.green;
      case QuizAnswer.wrong:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case QuizAnswer.correct:
        return Icons.check;
      case QuizAnswer.wrong:
        return Icons.close;
    }
  }
}
