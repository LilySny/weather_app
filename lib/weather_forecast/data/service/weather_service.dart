import 'package:weather_app/weather_forecast/data/model/weather_element_model.dart';
import 'package:weather_app/weather_forecast/data/model/forecast_weather_model.dart';

abstract class WeatherService {
  Future<WeatherElementModel> getCurrentWeather(String city);
  Future<ForecastWeatherModel> getForecastWeather(String city);
}
