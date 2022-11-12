import 'package:movies_app/weather/data/datasource/remote_datasource.dart';
import 'package:movies_app/weather/domain/entities/weather.dart';
import 'package:movies_app/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepository(this.remoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String countryName) async {
    return await remoteDataSource.getWeatherByCountryName(countryName);
  }
}
