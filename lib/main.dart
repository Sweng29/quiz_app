import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> answerIcons = [];

  List<String> questions = [
    'The reactant that is left over is the excess reactant?',
    'If two forces are in the same direction, they cancel each other out?',
    'Pollution of ocean water by sewage is the main cause of ocean acidification?',
    'If viewed from the north pole, Earth is turning counterclockwise on its axis?',
    'Different minerals melt and crystlalize at different temperatures?'
  ];

  List<String> answers = ['True', 'False', 'False', 'True', 'True'];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Center(
                child: new Text(
                  questions[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () {
                    checkAnswer();
                  },
                  child: new Text(
                    "True",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () {
                    checkAnswer();
                  },
                  child: Text("False", style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //scrollDirection: Axis.horizontal,
                  children: answerIcons,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int generateQuestion() {
    int random = Random().nextInt(4) + 1;
    return random;
  }

  bool checkAns(int index) {
    if (answers[index] == 'True') {
      return true;
    }
    return false;
  }

  Icon addAnswersList(bool check) {
    Icon icon;
    if (check) {
      icon = Icon(
        Icons.check,
        color: Colors.green,
      );
      print("true");
      return icon;
    }
    icon = new Icon(
      Icons.close,
      color: Colors.red,
    );
    print("false");
    return icon;
  }

  checkAnswer() {
    setState(() {
      bool check = checkAns(index);
      Icon icon = addAnswersList(check);
      answerIcons.add(icon);
      print(answerIcons.length);
      index = generateQuestion();
      /*Alert(
        context: context,
        type: AlertType.success,
        title: "Congrats!",
        desc: "Flutter is more awesome.",
        buttons: [
          DialogButton(
            child: Text(
              "I know!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();*/
    });
  }
}
