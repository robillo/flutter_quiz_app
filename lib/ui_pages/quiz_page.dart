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

  String _questionText;
  int _questionNumber;
  bool _isCorrect;

  Question _currentQuestion;
  Quiz _quiz = new Quiz([
    new Question("Elon musk is the iron man", true),
    new Question("Robin Kamboj is God", true),
    new Question("Khattar is not a dawg", false)
  ]);

  bool _overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    _currentQuestion = _quiz.nextQuestion;
    _questionText = _currentQuestion.question;
    _questionNumber = _quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    _isCorrect = (_currentQuestion.answer == answer);
    _quiz.answer(_isCorrect);
    this.setState(() {
      _overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
            children: <Widget>[
              new AnswerButton(true, () => handleAnswer(true)),
              new QuestionText(_questionText, _questionNumber),
              new AnswerButton(false, () => handleAnswer(false)),
            ],
        ),
        _overlayShouldBeVisible == true ? new CorrectWrongOverlay(
            _isCorrect,
            () {
                _currentQuestion = _quiz.nextQuestion;
                this.setState(() {
                    _overlayShouldBeVisible = false;
                    _questionText = _currentQuestion.question;
                    _questionNumber = _quiz.questionNumber;
                });
            }
//              () => print("on tap pressed")
        ) : new Container()
      ],
    );
  }
}