import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

const apiKey = 'fede742245c927d36d7585a7966be2da';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    print('This is Weather City Model Data $weatherData');
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    print('This is Weather Location Model Data $weatherData');
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

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

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

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
