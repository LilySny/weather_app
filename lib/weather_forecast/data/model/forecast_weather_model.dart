import 'package:weather_app/weather_forecast/data/model/weather_element_model.dart';

class ForecastWeatherModel {
  ForecastWeatherModel({
    this.list,
  });

  List<WeatherElementModel> list;

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      ForecastWeatherModel(
        list: List<WeatherElementModel>.from(
            json["list"].map((x) => WeatherElementModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}
