import 'package:flutter/material.dart';
import 'package:quizzler_flutter/models/answer_button_type.dart';
import 'package:quizzler_flutter/question_controller.dart';
import 'package:quizzler_flutter/ui/answer_button.dart';
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
  QuestionController questionController = QuestionController();

  void onAnswer(AnswerButtonType answerButton) {
    setState(() {
      questionController.answerQuiz(answerButton);
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
              QuestionCard(question: questionController.getCurrentQuestion()),
              AnswerButton(
                answer: AnswerButtonType.green,
                onAnswer: onAnswer,
              ),
              AnswerButton(
                answer: AnswerButtonType.red,
                onAnswer: onAnswer,
              ),
              Row(children: questionController.answerList),
            ],
          ),
        ),
      ),
    );
  }
}
