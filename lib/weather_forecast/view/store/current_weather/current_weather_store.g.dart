// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CurrentWeatherStore on _CurrentWeatherStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_CurrentWeatherStore.loading'))
      .value;

  final _$requestAtom = Atom(name: '_CurrentWeatherStore.request');

  @override
  ObservableFuture<WeatherModel> get request {
    _$requestAtom.reportRead();
    return super.request;
  }

  @override
  set request(ObservableFuture<WeatherModel> value) {
    _$requestAtom.reportWrite(value, super.request, () {
      super.request = value;
    });
  }

  final _$_CurrentWeatherStoreActionController =
      ActionController(name: '_CurrentWeatherStore');

  @override
  void getCurrentWeather(String city) {
    final _$actionInfo = _$_CurrentWeatherStoreActionController.startAction(
        name: '_CurrentWeatherStore.getCurrentWeather');
    try {
      return super.getCurrentWeather(city);
    } finally {
      _$_CurrentWeatherStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
request: ${request},
loading: ${loading}
    ''';
  }
}
