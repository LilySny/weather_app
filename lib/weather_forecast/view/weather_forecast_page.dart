import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/weather_forecast/data/service/weather_service.dart';
import 'package:weather_app/weather_forecast/data/service/weather_service_impl.dart';
import 'package:weather_app/weather_forecast/view/store/current_weather_store.dart';
import 'package:weather_app/weather_forecast/view/widgets/weather_info_widget.dart';

class WeatherForecastPage extends StatefulWidget {
  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  CurrentWeatherStore _currentWeatherStore;
  WeatherService _weatherService;
  Dio _dio;
  TextEditingController _searchQueryController = TextEditingController();

  @override
  void initState() {
    _dio = Dio();
    _weatherService = WeatherServiceImpl(_dio);
    _currentWeatherStore = CurrentWeatherStore(_weatherService)
      ..getCurrentWeather('silverstone');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              if (_searchQueryController == null ||
                  _searchQueryController.text.isEmpty) {
                Navigator.pop(context);
                return;
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Observer(
              builder: (BuildContext context) {
                var data = _currentWeatherStore.request.value?.mainInfo;
                return _currentWeatherStore.loading
                    ? Center(child: CircularProgressIndicator())
                    : WeatherInfoWidget(
                        city: 'silverstone',
                        temperature: data == null
                            ? '0°C'
                            : '${data?.temp?.toStringAsFixed(0)}°C',
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
