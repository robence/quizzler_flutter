import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final List<Icon> scoreKeeper = [
    const Icon(Icons.check, color: Colors.green),
    const Icon(Icons.check, color: Colors.green),
    const Icon(Icons.close, color: Colors.red),
    const Icon(Icons.check, color: Colors.green),
  ];

  void onAnswer() {
    setState(() {
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            const QuestionCard(title: 'This is where the question goes'),
            AnswerButton(
              title: 'True',
              color: Colors.green,
              onAnswer: onAnswer,
            ),
            AnswerButton(
              title: 'False',
              color: Colors.red,
              onAnswer: onAnswer,
            ),
            Row(children: scoreKeeper),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final String title;
  const QuestionCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onAnswer;
  const AnswerButton(
      {Key? key,
      required this.color,
      required this.title,
      required this.onAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: color,
                padding: const EdgeInsets.all(24.0),
              ),
              onPressed: () {
                onAnswer();
              },
              child: Text(title),
            ),
          ),
        ),
      ],
    );
  }
}
