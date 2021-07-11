import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 46.0,
        color: Color(0xDF1964D4),
        buttonBackgroundColor: Color(0xDF1964D4),
        backgroundColor: Color(0xFF33CCDA),
        // backgroundColor: Color(0xDF1964D4),
// animationCurve: Curves.easeInOut,
// animationDuration: Duration(milliseconds: 600),
        index: 1,
        onTap: (index) {
          if (index == 0) {
            return Navigator.pop(context);
          }
          setState(() {});
        },
        items: [
          Icon(Icons.near_me, color: Colors.white),
          Icon(Icons.location_city, color: Colors.white),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0837C2),
              Color(0xFF33CCDA),
              Color(0xFF2FC1CE),
            ],
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              InkWell(
                onTap: () {
                  Navigator.pop(context, cityName);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 6,
                          offset: Offset(1, 1)),
                    ],
                    borderRadius: BorderRadius.circular(28),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xF32CD0DE),
                        Color(0xDF2150DE),
                      ],
                    ),
                  ),
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
