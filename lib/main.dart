import 'package:flutter/material.dart';
import 'package:weather_app/weather_forecast/view/weather_forecast_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherForecastPage(),
    );
  }
}
