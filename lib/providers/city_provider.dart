import 'package:flutter/cupertino.dart';

class CityProvider extends ChangeNotifier {
  String _selectedCities = '';

  String get selectedCities {
    //return UserPreferences().selectedCities;
    if (_selectedCities.isEmpty) _selectedCities = 'Vancouver';

    return _selectedCities;
  }

  set selectedCities(String value) {
    //UserPreferences().selectedCities = value!;
    if (_selectedCities.isNotEmpty) {
      _selectedCities += ';$value';
    } else {
      _selectedCities = value;
    }
    notifyListeners();
  }
}
