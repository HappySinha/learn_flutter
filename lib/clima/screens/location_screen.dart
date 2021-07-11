import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/clima/screens/city_screen.dart';
import 'package:learn_flutter/clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
    });
  }

  void getLoc() async {
    var weatherData = await weather.getLocationWeather();
    updateUI(weatherData);
  }

  void goWeather() async {
    var typedName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CityScreen();
        },
      ),
    );
    if (typedName != null) {
      var weatherData = await weather.getCityWeather(typedName);
      updateUI(weatherData);
    }
  }

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
        index: 0,
        onTap: (index) {
          if (index == 0) {
            return getLoc();
          } else if (index == 1) {
            return goWeather();
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$cityName',
                  style: GoogleFonts.bebasNeue(
                      color: Colors.white70, fontSize: 80),
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 8,
                      left: 3,
                      child: Opacity(
                        opacity: 0.4,
                        alwaysIncludeSemantics: true,
                        child: assetImage(context),
                      ),
                    ),
                    assetImage(context),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '$temperature°',
                      style: GoogleFonts.teko(
                        color: Colors.white,
                        fontSize: 140,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '$weatherMessage',
                      style: GoogleFonts.teko(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Image assetImage(BuildContext context) {
    return Image.asset(
      'images/AniSunCloud.png',
      height: MediaQuery.of(context).size.width / 1.4,
      width: MediaQuery.of(context).size.width / 1.4,
    );
  }
}
