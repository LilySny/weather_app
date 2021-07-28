import 'package:weather_app/weather_forecast/data/model/main_info_model.dart';

class WeatherElementModel {
  WeatherElementModel({
    this.mainInfo,
    this.id,
    this.name,
    this.dtTxt,
  });

  int id;
  MainInfoModel mainInfo;
  String name;
  DateTime dtTxt;

  factory WeatherElementModel.fromJson(Map<String, dynamic> json) =>
      WeatherElementModel(
        mainInfo: MainInfoModel.fromJson(json["main"]),
        id: json["id"],
        name: json["name"],
        dtTxt: DateTime.parse(json["dt_txt"]),
      );

  Map<String, dynamic> toJson() => {
        "main": mainInfo.toJson(),
        "id": id,
        "name": name,
        "dt_txt": dtTxt.toIso8601String(),
      };
}
