import 'package:flutter/material.dart';

class WeatherInfoWidget extends StatelessWidget {
  final String temperature;
  final String city;

  const WeatherInfoWidget({
    Key key,
    @required this.temperature,
    @required this.city,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(temperature ?? ''),
          Text(city ?? ''),
        ],
      ),
    );
  }
}
