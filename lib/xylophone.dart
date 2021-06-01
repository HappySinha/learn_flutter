import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Xylophone extends StatelessWidget {
  const Xylophone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var btnWidth = MediaQuery.of(context).size.width;
    var btnHeight = MediaQuery.of(context).size.height / 7;
    var paddingAll = EdgeInsets.symmetric(horizontal: 0, vertical: 0);
    // void playSound(a) {
    //   AudioCache().play('note$a.wav');
    // }

    buildKey(sunNum, colors) {
      return FlatButton(
        onPressed: () {
          AudioCache().play('note$sunNum.wav');
        },
        padding: paddingAll,
        child: Container(
          color: colors,
          height: btnHeight,
          width: btnWidth,
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[700],
      //   title: Text("Xylophone"),
      // ),
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: [
          buildKey(1, Colors.pinkAccent),
          buildKey(2, Colors.deepOrangeAccent),
          buildKey(3, Colors.orangeAccent),
          buildKey(4, Colors.greenAccent),
          buildKey(5, Colors.cyanAccent),
          buildKey(6, Colors.blueAccent),
          buildKey(7, Colors.purpleAccent),
          // buildKey(1),
          // ignore: deprecated_member_use
          // FlatButton(
          //   onPressed: () {
          //     playSound(1);
          //   },
          //   padding: paddingAll,
          //   child: Container(
          //     color: Colors.pinkAccent,
          //     height: btnHeight,
          //     width: btnWidth,
          //   ),
          // ),
          // // ignore: deprecated_member_use
          // FlatButton(
          //   onPressed: () {
          //     playSound(2);
          //   },
          //   padding: paddingAll,
          //   child: Container(
          //     color: Colors.deepOrangeAccent,
          //     height: btnHeight,
          //     width: btnWidth,
          //   ),
          // ),
          // // ignore: deprecated_member_use
          // FlatButton(
          //   onPressed: () {
          //     playSound(3);
          //   },
          //   padding: paddingAll,
          //   child: Container(
          //     color: Colors.orangeAccent,
          //     height: btnHeight,
          //     width: btnWidth,
          //   ),
          // ),
          // // ignore: deprecated_member_use
          // FlatButton(
          //   onPressed: () {
          //     playSound(4);
          //   },
          //   padding: paddingAll,
          //   child: Container(
          //     color: Colors.grey,
          //     height: btnHeight,
          //     width: btnWidth,
          //   ),
          // ),
          // // ignore: deprecated_member_use
          // FlatButton(
          //   onPressed: () {
          //     playSound(5);
          //   },
          //   padding: paddingAll,
          //   child: Container(
          //     color: Colors.greenAccent,
          //     height: btnHeight,
          //     width: btnWidth,
          //   ),
          // ),
          // // ignore: deprecated_member_use
          // FlatButton(
          //   onPressed: () {
          //     playSound(6);
          //   },
          //   padding: paddingAll,
          //   child: Container(
          //     color: Colors.cyanAccent,
          //     height: btnHeight,
          //     width: btnWidth,
          //   ),
          // ),
          // // ignore: deprecated_member_use
          // FlatButton(
          //   onPressed: () {
          //     playSound(7);
          //   },
          //   padding: paddingAll,
          //   child: Container(
          //     color: Colors.lightBlueAccent,
          //     height: btnHeight,
          //     width: btnWidth,
          //   ),
          // ),
        ],
      ),
    );
  }
}
