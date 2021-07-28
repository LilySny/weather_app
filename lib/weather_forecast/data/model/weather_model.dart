import 'main_info_model.dart';

class WeatherModel {
  WeatherModel({
    this.mainInfo,
    this.id,
    this.name,
  });

  int id;
  MainInfoModel mainInfo;
  String name;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      WeatherModel(
        mainInfo: MainInfoModel.fromJson(json["main"]),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "main": mainInfo.toJson(),
        "id": id,
        "name": name,
      };
}
