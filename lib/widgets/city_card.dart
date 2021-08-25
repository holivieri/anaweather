import 'package:ana_weather/utils/font.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String cityName;
  final String temperature;
  final bool isCurrentLocation;
  final String imageUrl;
  final String country;

  const CityCard({
    required this.cityName,
    required this.temperature,
    this.isCurrentLocation = false,
    this.imageUrl = '',
    this.country = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: imageUrl.isNotEmpty
                ? Image.network(imageUrl)
                : Icon(Icons.cloud),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cityName,
                  style: cityStyle,
                ),
                Text(
                  temperature,
                  style: temperatureStyle,
                ),
              ],
            ),
            subtitle:
                isCurrentLocation ? Text('current location') : Text(country),
            trailing: Icon(Icons.chevron_right_outlined),
          )),
    );
  }
}
