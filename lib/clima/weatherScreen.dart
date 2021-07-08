import 'package:flutter/material.dart';
import 'weatherCity.dart';
import 'function.dart';

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
    updateUI(widget.weatherData);
    print('Data Re-InitState${widget.weatherData}');
  }

  void updateUI(dynamic weatherData) {
    print('This Widget Weather Data ${widget.weatherData}');
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = 'No Data';
        weatherIcon = 'Error';
        weatherMessage = 'I can\'t find your data.';
        return;
      } else {
        double temp = widget.weatherData['main']['temp'];
        temperature = temp.toInt();
        var condition = widget.weatherData['weather'][0]['id'];
        cityName = widget.weatherData['name'];
        weatherIcon = weather.getWeatherIcon(condition);
        weatherMessage = weather.getMessage(temperature);
      }
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$temperature'),
              Text('$weatherIcon'),
              Text("$cityName"),
              Text("$weatherMessage"),
              SizedBox(height: 50),
              IconButton(
                onPressed: () async {
                  var weatherData = await weather.getLocationWeather();
                  updateUI(weatherData);
                },
                icon: Icon(Icons.location_on_outlined),
              ),
              SizedBox(height: 50),
              IconButton(
                onPressed: () async {
                  var typeName = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CityScreen()));
                  if (typeName != null) {
                    var weatherData = weather.getCityWeather(typeName);
                    updateUI(weatherData);
                  }
                },
                icon: Icon(Icons.location_city),
              )
            ],
          ),
        ),
      ),
    );
  }
}
