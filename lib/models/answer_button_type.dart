import 'package:flutter/material.dart';

enum AnswerButtonType { green, red }

extension AnswerButtonTypeExtension on AnswerButtonType {
  MaterialColor get color {
    switch (this) {
      case AnswerButtonType.green:
        return Colors.green;
      case AnswerButtonType.red:
        return Colors.red;
    }
  }

  String get title {
    switch (this) {
      case AnswerButtonType.green:
        return 'True';
      case AnswerButtonType.red:
        return 'False';
    }
  }

  bool get value {
    switch (this) {
      case AnswerButtonType.green:
        return true;
      case AnswerButtonType.red:
        return false;
    }
  }
}
