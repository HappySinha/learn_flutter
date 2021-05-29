import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
//      appBar: AppBar(
//          title: Center(
//              child: Text('My Self',
//                  style: TextStyle(fontWeight: FontWeight.bold))),
//          backgroundColor: Colors.blueGrey[800]),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
//        crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("images/happySin.png"),
              ),
              SizedBox(height: 20),
              Text(
                "Happy Sinha",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'dancing',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Column(
                  children: [
                    Text(
                      'FLUTTER DEVELOPER',
                      style: TextStyle(
                          color: Colors.blueGrey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 2.5,
                          fontFamily: 'SansPro'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Text(
                        'Hello, My name is Happy Sinha, I am Mobile App Developer. I have more than 2 years of experience as a Software developer, Currently, I am working for Stanbuzz India Pvt. Ltd. ThankYou for visiting us.',
                        style: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontFamily: 'SansPro'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
                width: 300,
              ),
//              Card(
//                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//                child: ListTile(
//                  title: Text(
//                    '+91 7903771321',
//                    style: TextStyle(
//                        color: Colors.blueGrey,
//                        fontWeight: FontWeight.bold,
//                        fontSize: 18),
//                  ),
//                  leading: Icon(
//                    Icons.phone,
//                    color: Colors.teal,
//                  ),
//                  tileColor: Colors.white,
//                ),
//              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.all(18),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 30),
                    Text(
                      '+91 7903771321',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(18),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 30),
                    Text(
                      'happyk8651@ggmail.com',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
