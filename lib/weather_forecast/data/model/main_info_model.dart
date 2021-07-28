class MainInfoModel {
  MainInfoModel({
    this.temp,
    this.tempMax,
  });

  double temp;
  double tempMax;

  factory MainInfoModel.fromJson(Map<String, dynamic> json) => MainInfoModel(
        temp: json["temp"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "temp_max": tempMax,
      };
}