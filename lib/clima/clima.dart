import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'weatherScreen.dart';
import 'function.dart';

class LoadingWeather extends StatefulWidget {
  @override
//   State<StatefulWidget> createState() {
//     return _LoadingWeatherState();
//   }
// }

  _LoadingWeatherState createState() => _LoadingWeatherState();
}

class _LoadingWeatherState extends State<LoadingWeather> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WeatherScreen(weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.grey[100],
            size: MediaQuery.of(context).size.width / 2,
          ),
        ),
      ),
    );
  }
}

// 'https://i.pinimg.com/564x/62/33/8f/62338f2bb6a11ba88530416edbb3ab21.jpg',
