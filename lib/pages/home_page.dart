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
        title: Text('ANA Weather App'),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationInitial) {
            return Center(child: Text('Fetching Location'));
          }
          if (state is LocationLoadSuccess) {
            return Center(
              child: returnCurrentLocationWeather(state.position),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget returnCurrentLocationWeather(Position position) {
    WeatherService service = WeatherService();

    return FutureBuilder(
      future: service.getWeatherByCity(position),
      builder: (BuildContext context, AsyncSnapshot<CityModel?> snapshot) {
        if (snapshot.hasData) {
          return CityCard(
            cityName: snapshot.data!.name,
            temperature: snapshot.data!.main.temp.toString(),
            isCurrentLocation: true,
            imageUrl: snapshot.data!.icon,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
