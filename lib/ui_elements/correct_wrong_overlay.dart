import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {

  final bool isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this.isCorrect, this._onTap);

  @override
  State<StatefulWidget> createState() {
    return new CorrectWrongState();
  }
}

class CorrectWrongState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(
            () => this.setState(
                    () => {}
            ));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: widget._onTap,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Transform.rotate(
                  angle: _iconAnimation.value * 2 * PI,
                  child:  new Icon(widget.isCorrect ? Icons.done : Icons.clear, size: 80.0 * _iconAnimation.value,),
              ),
              decoration: new BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
            new Text(widget.isCorrect ? "Correct!" : "Wrong!", style: new TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}