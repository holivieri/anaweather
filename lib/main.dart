import 'package:ana_weather/bloc/location_bloc.dart';
import 'package:ana_weather/pages/home_page.dart';
import 'package:ana_weather/pages/my_cities_page.dart';
import 'package:ana_weather/providers/city_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'userPreferences/user_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initConfiguration() async {
    /*   UserPreferences prefs = UserPreferences();
    prefs.init(); */
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initConfiguration();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(
          create: (context) =>
              LocationBloc(geolocator: Geolocator())..add(LocationStarted()),
        )
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<CityProvider>(
            create: (_) => CityProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Ana weather app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
          routes: {
            'home': (_) => HomePage(),
            'mycities': (_) => MyCitiesPage(),
          },
        ),
      ),
    );
  }
}
