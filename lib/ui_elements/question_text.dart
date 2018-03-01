import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

class QuestionText extends StatefulWidget {

  final Question _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State<StatefulWidget> createState() {
    return new QuestionTextState();
  }
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {

  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 1000), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(
            () => this.setState(
                    ()=>{}
            )
    );
    _fontSizeAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text(
              "Statement " + widget._questionNumber.toString() + ": " + widget._question.question,
              style: new TextStyle(fontSize: _fontSizeAnimation.value * 20),
          ),
        ),
      ),
    );
  }
}