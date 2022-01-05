import 'package:flutter/material.dart';
import 'package:quizzler_flutter/data/questions.dart';
import 'package:quizzler_flutter/models/answer_button_type.dart';
import 'package:quizzler_flutter/models/question.dart';
import 'package:quizzler_flutter/models/quiz_answer.dart';
import 'package:quizzler_flutter/ui/answer_icon.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuestionController {
  var _currentQuestionNumber = 0;

  get questions => questionData;

  get questionNumber => _currentQuestionNumber;

  final List<AnswerIcon> answerList = [];

  Question getCurrentQuestion() => questions[questionNumber];

  bool evaluateQuizAnswer(AnswerButtonType answerButton) {
    return answerButton.value == getCurrentQuestion().correctAnswer;
  }

  void answerQuiz(AnswerButtonType answerButton, BuildContext context) {
    final answer = evaluateQuizAnswer(answerButton)
        ? QuizAnswer.correct
        : QuizAnswer.wrong;

    if (questionNumber < questions.length - 1) {
      answerList.add(AnswerIcon(answer: answer));
      _currentQuestionNumber = _currentQuestionNumber + 1;
    } else {
      Alert(
              context: context,
              title: "Congratulations",
              desc: "You've completed the quiz.")
          .show();

      answerList.clear();
      _currentQuestionNumber = 0;
    }
  }
}
