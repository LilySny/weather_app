import 'package:mobx/mobx.dart';
import 'package:weather_app/weather_forecast/data/model/weather_element_model.dart';
import 'package:weather_app/weather_forecast/data/service/weather_service.dart';

part 'current_weather_store.g.dart';

class CurrentWeatherStore = _CurrentWeatherStore with _$CurrentWeatherStore;

abstract class _CurrentWeatherStore with Store {
  final WeatherService _weatherService;

  _CurrentWeatherStore(this._weatherService);

  @observable
  ObservableFuture<WeatherElementModel> request = ObservableFuture.value(null);

  @computed
  bool get loading => request.status == FutureStatus.pending;

  @action
  void getCurrentWeather(String city) {
    request = _weatherService.getCurrentWeather(city).asObservable();
  }
}
