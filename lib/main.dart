import 'package:flutter/material.dart';
import 'package:quizzler_flutter/models/answer_button_type.dart';
import 'package:quizzler_flutter/models/question.dart';
import 'package:quizzler_flutter/models/quiz_answer.dart';
import 'package:quizzler_flutter/data/questions.dart';
import 'package:quizzler_flutter/ui/answer_button.dart';
import 'package:quizzler_flutter/ui/answer_icon.dart';
import 'package:quizzler_flutter/ui/question_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var questionNumber = 0;

  Question getCurrentQuestion() => questions[questionNumber];

  final List<AnswerIcon> scoreKeeper = [];

  void onAnswer(AnswerButtonType buttonType) {
    final currentQuestion = getCurrentQuestion();

    final answer = buttonType.value == currentQuestion.correctAnswer
        ? QuizAnswer.correct
        : QuizAnswer.wrong;

    setState(() {
      if (questionNumber < questions.length - 1) {
        scoreKeeper.add(AnswerIcon(answer: answer));
        questionNumber = questionNumber + 1;
      } else {
        scoreKeeper.clear();
        questionNumber = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              QuestionCard(question: getCurrentQuestion()),
              AnswerButton(
                answer: AnswerButtonType.green,
                onAnswer: onAnswer,
              ),
              AnswerButton(
                answer: AnswerButtonType.red,
                onAnswer: onAnswer,
              ),
              Row(children: scoreKeeper),
            ],
          ),
        ),
      ),
    );
  }
}
