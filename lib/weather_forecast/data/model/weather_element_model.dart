import 'package:weather_app/weather_forecast/data/model/main_info_model.dart';
import 'package:weather_app/weather_forecast/data/model/weather_model.dart';

class WeatherElementModel {
  WeatherElementModel({
    this.weather,
    this.base,
    this.mainInfo,
    this.id,
    this.name,
  });

  int id;
  List<WeatherModel> weather;
  String base;
  MainInfoModel mainInfo;
  String name;

  factory WeatherElementModel.fromJson(Map<String, dynamic> json) =>
      WeatherElementModel(
        weather: List<WeatherModel>.from(
            json["weather"].map((x) => WeatherModel.fromJson(x))),
        base: json["base"],
        mainInfo: MainInfoModel.fromJson(json["main"]),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": mainInfo.toJson(),
        "id": id,
        "name": name,
      };
}
