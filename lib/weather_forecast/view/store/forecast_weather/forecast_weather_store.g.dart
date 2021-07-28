// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForecastWeatherStore on _ForecastWeatherStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_ForecastWeatherStore.loading'))
      .value;

  final _$requestAtom = Atom(name: '_ForecastWeatherStore.request');

  @override
  ObservableFuture<ForecastWeatherModel> get request {
    _$requestAtom.reportRead();
    return super.request;
  }

  @override
  set request(ObservableFuture<ForecastWeatherModel> value) {
    _$requestAtom.reportWrite(value, super.request, () {
      super.request = value;
    });
  }

  final _$_ForecastWeatherStoreActionController =
      ActionController(name: '_ForecastWeatherStore');

  @override
  void getForecastWeather(String city) {
    final _$actionInfo = _$_ForecastWeatherStoreActionController.startAction(
        name: '_ForecastWeatherStore.getForecastWeather');
    try {
      return super.getForecastWeather(city);
    } finally {
      _$_ForecastWeatherStoreActionController.endAction(_$actionInfo);
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
