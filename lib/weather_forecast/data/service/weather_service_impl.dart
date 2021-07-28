import 'package:dio/dio.dart';
import 'package:weather_app/weather_forecast/data/model/forecast_weather_model.dart';
import 'package:weather_app/weather_forecast/data/service/weather_service.dart';
import 'package:weather_app/weather_forecast/utils/utils.dart';

import '../model/weather_model.dart';

class WeatherServiceImpl implements WeatherService {
  final Dio _dio;

  WeatherServiceImpl(this._dio);

  @override
  Future<WeatherModel> getCurrentWeather(String city) async {
    final response = await _dio.get(weatherBaseUrl('weather', city, apiKey));
    return WeatherModel.fromJson(response.data);
  }

  @override
  Future<ForecastWeatherModel> getForecastWeather(String city) async {
    final response = await _dio.get(weatherBaseUrl('forecast', city, apiKey));
    return ForecastWeatherModel.fromJson(response.data);
  }
}
