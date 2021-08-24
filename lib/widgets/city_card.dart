import 'package:ana_weather/utils/font.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String cityName;
  final String temperature;

  const CityCard({
    required this.cityName,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cityName,
              style: titleStyle,
            ),
            Text(
              temperature,
              style: temperatureStyle,
            ),
          ],
        ),
      ),
    );
  }
}
