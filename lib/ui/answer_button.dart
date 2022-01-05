import 'package:flutter/material.dart';
import 'package:quizzler_flutter/models/answer_button_type.dart';

typedef OnAnswerFunc = void Function(AnswerButtonType answer);

class AnswerButton extends StatelessWidget {
  final AnswerButtonType answer;
  final OnAnswerFunc onAnswer;

  const AnswerButton({Key? key, required this.answer, required this.onAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: answer.color,
                padding: const EdgeInsets.all(24.0),
              ),
              onPressed: () {
                onAnswer(answer);
              },
              child: Text(answer.title),
            ),
          ),
        ),
      ],
    );
  }
}
