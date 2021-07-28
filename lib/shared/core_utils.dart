import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/home/store/search_store.dart';
import 'package:weather_app/weather_forecast/data/service/weather_service.dart';
import 'package:weather_app/weather_forecast/data/service/weather_service_impl.dart';
import 'package:weather_app/weather_forecast/view/store/current_weather/current_weather_store.dart';
import 'package:weather_app/weather_forecast/view/store/forecast_weather/forecast_weather_store.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  setupServices();
  setupStores();
}

void setupStores() {
  getIt.registerSingleton<SearchStore>(SearchStore());

  getIt.registerSingleton<CurrentWeatherStore>(
      CurrentWeatherStore(getIt<WeatherService>()));

  getIt.registerSingleton<ForecastWeatherStore>(
      ForecastWeatherStore(getIt<WeatherService>()));
}

void setupServices() {
  getIt.registerSingleton<WeatherService>(WeatherServiceImpl(Dio()));
}
