import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  UserPreferences._internal() {
    _selectedCities = '';
  }

  factory UserPreferences() {
    return _instance;
  }

  static final UserPreferences _instance = UserPreferences._internal();

  late SharedPreferences _userPreferences;

  Future<void> init() async {
    _userPreferences = await SharedPreferences.getInstance();
  }

  Future<void> clear() async {
    selectedCities = '';
    await _userPreferences.clear();
  }

  late String _selectedCities;

  String get selectedCities =>
      _selectedCities = _userPreferences.getString('selectedCities') ?? '';

  set selectedCities(String value) {
    if (_selectedCities.isNotEmpty) {
      _selectedCities += ';$value';
      _userPreferences.setString('selectedCities', _selectedCities);
    } else {
      _userPreferences.setString('selectedCities', value);
    }
  }
}
