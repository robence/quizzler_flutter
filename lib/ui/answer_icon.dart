import 'package:flutter/material.dart';
import 'package:quizzler_flutter/models/quiz_answer.dart';

class AnswerIcon extends StatelessWidget {
  final QuizAnswer answer;
  const AnswerIcon({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(answer.icon, color: answer.color);
  }
}
