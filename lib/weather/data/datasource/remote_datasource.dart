import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/weather/data/models/weather_model.dart';
import 'package:movies_app/weather/domain/entities/weather.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource {
  Future<Weather> getWeatherByCountryName(String countryName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<Weather> getWeatherByCountryName(String countryName) async {
    try {
      var response = await Dio().get(
          "${AppConstants.baseUrl}/weather?q=$countryName&appid=${AppConstants.apiKey}");
      debugPrint(response.toString());
      return WeatherModel.fromJsom(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return WeatherModel(
          id: 0,
          countryName: "countryName",
          main: "main",
          description: "description",
          pressure: 0,
          temp: 0.0);
    }
  }
}
