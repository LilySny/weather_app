import 'package:weather_app/weather_forecast/data/model/forecast_weather_model.dart';
import 'package:weather_app/weather_forecast/data/model/weather_model.dart';

abstract class WeatherService {
  Future<WeatherModel> getCurrentWeather(String city);
  Future<ForecastWeatherModel> getForecastWeather(String city);
}
