import 'package:flutter/material.dart';

class WeatherInfoWidget extends StatelessWidget {
  final String temperature;
  final String text;

  const WeatherInfoWidget({
    Key key,
    @required this.temperature,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
      ),
      child: Column(
        children: [
          Text(
            temperature ?? '',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text ?? '',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
