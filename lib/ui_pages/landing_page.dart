import 'package:flutter/material.dart';
import '../ui_pages/quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
                "Quiz Game",
              style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            new Text(
                "Tap To Play",
              style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}