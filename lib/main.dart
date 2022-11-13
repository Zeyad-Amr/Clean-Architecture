import 'package:flutter/material.dart';
import 'package:movies_app/weather/data/datasource/remote_datasource.dart';
import 'package:movies_app/weather/data/repository/weather_repository.dart';
import 'package:movies_app/weather/domain/entities/weather.dart';
import 'package:movies_app/weather/domain/repository/base_weather_repository.dart';
import 'package:movies_app/weather/domain/usecases/get_weather_by_country_name.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Weather? weather;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Future getWeather(String? countryName) async {
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseWeatherRepository baseWeatherRepository =
        WeatherRepository(baseRemoteDataSource);
    weather = await GetWeatherByCountryName(baseWeatherRepository).execute(
        (countryName == "" || countryName == null) ? "egypt" : countryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clean Architecture',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(controller: controller),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    getWeather(controller.text);
                  });
                },
                child: const Text("Get Weather")),
            Expanded(
              child: Center(
                child: weather == null
                    ? const CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weather!.countryName,
                          ),
                          Text(
                            "Weather: ${weather!.main}",
                          ),
                          Text(
                            weather!.description,
                          ),
                          Text(
                            "Temperature: ${weather!.temp}",
                          ),
                          Text(
                            "Pressure: ${weather!.pressure}",
                          ),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
