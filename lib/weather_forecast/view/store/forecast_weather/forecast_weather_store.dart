import 'package:mobx/mobx.dart';
import 'package:weather_app/weather_forecast/data/model/forecast_weather_model.dart';
import 'package:weather_app/weather_forecast/data/service/weather_service.dart';

import '../../../data/model/weather_element_model.dart';

part 'forecast_weather_store.g.dart';

class ForecastWeatherStore = _ForecastWeatherStore with _$ForecastWeatherStore;

abstract class _ForecastWeatherStore with Store {
  final WeatherService _weatherService;

  _ForecastWeatherStore(this._weatherService);

  @observable
  ObservableFuture<ForecastWeatherModel> request = ObservableFuture.value(null);

  @computed
  bool get loading => request.status == FutureStatus.pending;

  @action
  void getForecastWeather(String city) {
    request = _weatherService.getForecastWeather(city).asObservable();
  }

  List<WeatherElementModel> getUniqueDays(List<WeatherElementModel> elements) {
    final uniqueDays = <int, WeatherElementModel>{};
    elements.forEach((data) => uniqueDays[data.dtTxt.day] ??= data);
    var newList = uniqueDays.values.toList().skip(1).toList();
    return newList;
  }
}
