import 'package:flutter/material.dart';
import 'package:weather_app/home/view/home_page.dart';
import 'package:weather_app/shared/core_utils.dart';

void main() {
  setupGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
