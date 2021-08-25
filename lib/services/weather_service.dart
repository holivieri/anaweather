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

  Future<List<CityModel>> getWeatherForCities(String cities) async {
    final client = Client();
    String cityName = '';
    List<CityModel> list = [];

    if (cities.isEmpty) return [];

    if (!cities.contains(';')) {
      cityName = cities;
      String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=b9e0203654e67a10fa2a32b3eb8b1bb4';

      var response = await client.get(
        Uri.parse(url),
      );

      if (response.statusCode != 200) {
        return list;
      }

      final decodedResponse = json.decode(response.body);
      list.add(CityModel.fromJson(decodedResponse));
      return list;
    } else {
      final mycities = cities.split(';');
      for (final c in mycities) {
        list.add(await getCityInfo(c));
      }
      return list;
    }
  }

  Future<CityModel> getCityInfo(String city) async {
    final client = Client();

    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=b9e0203654e67a10fa2a32b3eb8b1bb4';

    var response = await client.get(
      Uri.parse(url),
    );

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
