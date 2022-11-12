import 'package:movies_app/weather/domain/entities/weather.dart';

/// "Contraction" using abstraction
/// Applying Solid Principle of "Dependency Inversion Principle"

abstract class BaseWeatherRepository {
  Future<Weather> getWeatherByCityName(String cityName);
}
