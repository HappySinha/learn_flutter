import 'dart:math';

import 'package:flutter/material.dart';

class BallPage extends StatefulWidget {
  const BallPage({Key key}) : super(key: key);

  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Ask me Anything"),
      ),
      body: Container(
        color: Colors.blue[200],
        child: Center(
          child: TextButton(
            onPressed: () {
              setState(() {
                ballNumber = Random().nextInt(5) + 1;
              });

              print("I got Pressed $ballNumber");
            },
            child: Image.asset('images/ball$ballNumber.png'),
          ),
        ),
      ),
    );
  }
}
