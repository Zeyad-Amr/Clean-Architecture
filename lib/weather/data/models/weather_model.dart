import 'package:movies_app/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.id,
    required super.countryName,
    required super.main,
    required super.description,
    required super.pressure,
    required super.temp,
  });

  factory WeatherModel.fromJsom(Map<String, dynamic> json) {
    return WeatherModel(
      id: json["id"],
      countryName: json["name"],
      main: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      pressure: json["main"]["pressure"],
      temp: json["main"]["temp"],
    );
  }
}
