import 'dart:math';

import 'package:flutter/material.dart';

class DiceGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
          backgroundColor: Colors.red, title: Center(child: Text("Dice Game"))),
      body: PlayDice(),
    );
  }
}

class PlayDice extends StatefulWidget {
  const PlayDice({Key key}) : super(key: key);

  @override
  _PlayDiceState createState() => _PlayDiceState();
}

class _PlayDiceState extends State<PlayDice> {
  var leftDiceValue = 1;
  var rightDiceValue = 1;
  renNum() {
    setState(() {
      leftDiceValue = 1 + Random().nextInt(6);
      rightDiceValue = 1 + Random().nextInt(6);
      print("Left Button Pressed, and Value = $leftDiceValue");
      print("Right Button Pressed, and Value = $rightDiceValue");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () {
                renNum();
              },
              child: Image.asset('images/dice$leftDiceValue.png'),
            ),
          ),
          Expanded(
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () {
                renNum();
              },
              child: Image.asset('images/dice$rightDiceValue.png'),
            ),
          ),
        ],
      ),
    );
  }
}
