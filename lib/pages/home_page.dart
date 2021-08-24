import 'package:ana_weather/bloc/location_bloc.dart';
import 'package:ana_weather/models/city_model.dart';
import 'package:ana_weather/services/weather_service.dart';
import 'package:ana_weather/widgets/city_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationInitial) {
            return Center(child: Text('Fetching Location'));
          }
          if (state is LocationLoadSuccess) {
            return Center(
              child: Text(
                'Location: (${state.position.latitude}, ${state.position.longitude})',
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget returnCurrentLocationWeather(Position position) {
    WeatherService service = WeatherService();
    String cityName = 'Vancouver';

    return FutureBuilder(
      future: service.getWeatherByCity(cityName),
      builder: (BuildContext context, AsyncSnapshot<CityModel?> snapshot) {
        if (snapshot.hasData) {
          return CityCard(
            cityName: cityName,
            temperature: snapshot.data!.main.temp.toString(),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
