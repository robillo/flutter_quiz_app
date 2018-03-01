import 'package:flutter/material.dart';

import '../ui_elements/answer_button.dart';
import '../ui_elements/question_text.dart';
import '../ui_elements/correct_wrong_overlay.dart';

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
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
            children: <Widget>[
              new AnswerButton(true, () => print("You Pressed True")),
              new QuestionText(new Question("Robin Is Awesome", true), 1),
              new AnswerButton(false, () => print("You Pressed False")),
            ],
        ),
        new CorrectWrongOverlay(true)
      ],
    );
  }
}