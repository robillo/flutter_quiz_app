import 'package:flutter/material.dart';

import '../ui_elements/answer_button.dart';
import '../ui_elements/question_text.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
            children: <Widget>[
              new AnswerButton(true, () => print("You Pressed True")),
              new QuestionText(new Question("Robin Is Awesome", true), 1),
              new AnswerButton(false, () => print("You Pressed False")),
            ],
        ),
      ],
    );
  }
}