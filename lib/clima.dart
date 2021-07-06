import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'fede742245c927d36d7585a7966be2da';

class LoadingWeather extends StatefulWidget {
  @override
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
    print('This id weather Data Information $weatherData');
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

class Location {
  double latitude;
  double longitude;

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print('This is position $position');
    } catch (e) {
      print(e);
    }
    print('This is latitude Data $latitude');
    print('This is longitude Data $longitude');
  }
}

class NetworkHelper {
  String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class WeatherScreen extends StatefulWidget {
  final weatherData;
  WeatherScreen(this.weatherData);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String cityName;
  String weatherIcon;
  String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() {
    setState(() {
      if (widget.weatherData != null) {
        double temp = widget.weatherData['main']['temp'];
        temperature = temp.toInt();
        var condition = widget.weatherData['weather'][0]['id'];
        cityName = widget.weatherData['name'];
        weatherIcon = weather.getWeatherIcon(condition);
        weatherMessage = weather.getMessage(temperature);
      } else {
        temperature = 0;
        cityName = 'No Data';
        weatherIcon = 'Error';
        weatherMessage = 'I can\'t find your data.';
      }
      print('Check error data ${widget.weatherData}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Weather'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.location_city),
      //     )
      //   ],
      // ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('$temperature'),
              Text('$weatherIcon'),
              Text("$cityName"),
              Text("$weatherMessage"),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    print(
        'This is Location Data Information ${location.getCurrentLocation()}, ${location.latitude}');
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    final weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '☁🌧🌩⛅🌪⛈🌥🌥🌫🌬';
    } else if (condition < 400) {
      return '🌨';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃	';
    } else if (condition < 800) {
      return '🌥';
    } else if (condition == 400) {
      return '🌞';
    } else if (condition <= 804) {
      return '☁	';
    } else {
      return '😎';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time ';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧥 and 👖';
    } else {
      return 'Bring a 👕 just in case';
    }
  }
}
// 'https://i.pinimg.com/564x/62/33/8f/62338f2bb6a11ba88530416edbb3ab21.jpg',
