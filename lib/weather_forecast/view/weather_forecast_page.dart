import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/weather_forecast/view/store/current_weather/current_weather_store.dart';
import 'package:weather_app/weather_forecast/view/store/forecast_weather/forecast_weather_store.dart';
import 'package:weather_app/weather_forecast/view/widgets/weather_info_widget.dart';

import '../../shared/core_utils.dart';

class WeatherForecastPage extends StatefulWidget {
  final String city;

  const WeatherForecastPage({Key key, @required this.city}) : super(key: key);

  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  CurrentWeatherStore _currentWeatherStore;
  ForecastWeatherStore _forecastWeatherStore;

  @override
  void initState() {
    _currentWeatherStore = getIt<CurrentWeatherStore>()
      ..getCurrentWeather(widget.city.toLowerCase().trim());
    _forecastWeatherStore = getIt<ForecastWeatherStore>()
      ..getForecastWeather(widget.city.toLowerCase().trim());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city ?? 'Weather Forecast'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          children: [
            Center(
              child: Observer(
                builder: (BuildContext context) {
                  var data = _currentWeatherStore.request.value?.mainInfo;
                  return _currentWeatherStore.loading
                      ? Center(child: CircularProgressIndicator())
                      : WeatherInfoWidget(
                          text: widget.city,
                          temperature: data == null
                              ? '0°C'
                              : '${data?.temp?.toStringAsFixed(0)}°C',
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                bottom: 50.0,
              ),
              child: Divider(),
            ),
            Expanded(
              child: Observer(
                builder: (BuildContext context) {
                  var data = _forecastWeatherStore.request?.value?.list;
                  if (_forecastWeatherStore.request.status ==
                      FutureStatus.rejected) {
                    return Center(
                      child: Text(
                        'An error occurred, try again later',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else if (_forecastWeatherStore.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount:
                            _forecastWeatherStore.getUniqueDays(data).length,
                        itemBuilder: (context, index) {
                          var item =
                              _forecastWeatherStore.getUniqueDays(data)[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WeatherInfoWidget(
                              text: '${item?.dtTxt?.day}/${item?.dtTxt?.month}',
                              temperature: data == null
                                  ? '0°C'
                                  : '${item?.mainInfo?.temp?.toStringAsFixed(0)}°C',
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
