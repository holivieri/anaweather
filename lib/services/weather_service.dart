import 'dart:convert';

import 'package:ana_weather/models/city_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class WeatherService {
  Future<CityModel?> getWeatherByCity(Position position) async {
    final client = Client();
    String cityName = await _convertCoordenatesToCityName(
      lat: position.latitude,
      long: position.longitude,
    );

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

  Future<String> _convertCoordenatesToCityName({
    required double lat,
    required double long,
  }) async {
    final addresses = await placemarkFromCoordinates(lat, long);

    return addresses.first.locality!;
  }
}
