class MainInfoModel {
  MainInfoModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;

  factory MainInfoModel.fromJson(Map<String, dynamic> json) => MainInfoModel(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
      };
}