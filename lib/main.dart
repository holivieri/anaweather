import 'package:ana_weather/bloc/location_bloc.dart';
import 'package:ana_weather/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

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
    UserPreferences prefs = UserPreferences();
    prefs.init();
  }

  @override
  Widget build(BuildContext context) {
    initConfiguration();

    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationBloc>(
          create: (context) =>
              LocationBloc(geolocator: Geolocator())..add(LocationStarted()),
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
        },
      ),
    );
  }
}
