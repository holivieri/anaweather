import 'dart:convert';

import 'package:ana_weather/models/city_model.dart';
import 'package:http/http.dart';

class WeatherService {
  Future<CityModel?> getWeatherByCity(String cityName) async {
    final client = Client();
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=b9e0203654e67a10fa2a32b3eb8b1bb4';

    var response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode != 200) {
      return null;
    }

    final decodedResponse = json.decode(response.body);
    return CityModel.fromJson(decodedResponse);
  }
}
