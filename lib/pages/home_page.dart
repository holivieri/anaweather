import 'package:ana_weather/bloc/location_bloc.dart';
import 'package:ana_weather/models/city_model.dart';
import 'package:ana_weather/providers/city_provider.dart';
import 'package:ana_weather/services/weather_service.dart';
import 'package:ana_weather/userPreferences/user_preferences.dart';
import 'package:ana_weather/widgets/city_card.dart';
import 'package:ana_weather/widgets/search_input_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CityModel>> citiesInfo;

  @override
  void initState() {
    super.initState();
    WeatherService service = WeatherService();

    String cities = 'Miami';

    citiesInfo = service.getWeatherForCities(cities);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('ANA Weather App'), leading: Icon(Icons.cloud)),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationInitial) {
            return Center(child: Text('Fetching Location'));
          }
          if (state is LocationLoadSuccess) {
            return Column(
              children: [
                SearchInputBox(),
                returnCurrentLocationWeather(state.position),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: returnMyCities(),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget returnMyCities() {
    final citiesProvider = Provider.of<CityProvider>(context);
    WeatherService service = WeatherService();
/*     if (citiesProvider.selectedCities.isEmpty) {
      citiesProvider.selectedCities = 'Miami;Vancouver';
    } */
    citiesInfo = service.getWeatherForCities(citiesProvider.selectedCities);

    return FutureBuilder(
      future: citiesInfo,
      builder:
          (BuildContext context, AsyncSnapshot<List<CityModel?>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return CityCard(
                cityName: snapshot.data![index]!.name,
                temperature: snapshot.data![index]!.main.temp.toString(),
                isCurrentLocation: false,
                imageUrl: snapshot.data![index]!.icon,
                country: snapshot.data![index]!.sys.country,
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
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
