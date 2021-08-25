import 'package:ana_weather/providers/city_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/city_model.dart';
import '../services/weather_service.dart';
import 'city_card.dart';

class CityList extends StatelessWidget {
  const CityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CityProvider>(context);
    final list = provider.selectedCities.split(';');
    List<Widget> listCityCards = [];

    list.forEach((element) {
      listCityCards.add(returnCityInfo(element)!);
    });

    if (listCityCards.isEmpty)
      return Container(
        width: 200,
        height: 200,
      );

    return ListView.separated(
      itemBuilder: (_, index) {
        return CityCard(
          cityName: list[index],
          temperature: '20',
        );
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: listCityCards.length,
    );
  }

  Widget? returnCityInfo(String cityName) {
    getInfoFromApi(cityName).then((value) {
      return CityCard(
        cityName: cityName,
        temperature: value!.main.temp.toString(),
      );
    });
  }

  Future<CityModel?> getInfoFromApi(String cityName) async {
    WeatherService service = WeatherService();
    return null; //await service.getWeatherByCity(cityName);
  }
}
