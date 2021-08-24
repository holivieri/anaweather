import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind? wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        coord: Coord.fromJson(json['coord']),
        weather:
            List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
        base: json['base'],
        main: Main.fromJson(json['main']),
        visibility: json['visibility'] == null ? null : json['visibility'],
        wind: Wind.fromJson(json['wind']),
        clouds: Clouds.fromJson(json['clouds']),
        dt: json['dt'] == null ? null : json['dt'],
        sys: Sys.fromJson(json['sys']),
        timezone: json['timezone'] == null ? null : json['timezone'],
        id: json['id'] == null ? null : json['id'],
        name: json['name'] == null ? null : json['name'],
        cod: json['cod'] == null ? null : json['cod'],
      );

  Map<String, dynamic> toJson() => {
        'coord': coord.toJson(),
        'weather': List<dynamic>.from(weather.map((x) => x.toJson())),
        'base': base,
        'main': main.toJson(),
        'visibility': visibility,
        'wind': wind == null ? null : wind!.toJson(),
        'clouds': clouds.toJson(),
        'dt': dt,
        'sys': sys.toJson(),
        'timezone': timezone,
        'id': id,
        'name': name,
        'cod': cod,
      };
}

class Clouds {
  Clouds({
    required this.all,
  });

  final int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json['all'] == null ? null : json['all'],
      );

  Map<String, dynamic> toJson() => {
        'all': all,
      };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  final double lon;
  final double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json['lon'] == null ? null : json['lon'].toDouble(),
        lat: json['lat'] == null ? null : json['lat'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lon': lon,
        'lat': lat,
      };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp'] == null ? null : json['temp'].toDouble(),
        feelsLike:
            json['feels_like'] == null ? null : json['feels_like'].toDouble(),
        tempMin: json['temp_min'] == null ? null : json['temp_min'].toDouble(),
        tempMax: json['temp_max'] == null ? null : json['temp_max'].toDouble(),
        pressure: json['pressure'] == null ? null : json['pressure'],
        humidity: json['humidity'] == null ? null : json['humidity'],
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
      };
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json['type'] == null ? null : json['type'],
        id: json['id'] == null ? null : json['id'],
        country: json['country'] == null ? null : json['country'],
        sunrise: json['sunrise'] == null ? null : json['sunrise'],
        sunset: json['sunset'] == null ? null : json['sunset'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      };
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] == null ? null : json['id'],
        main: json['main'] == null ? null : json['main'],
        description: json['description'] == null ? null : json['description'],
        icon: json['icon'] == null ? null : json['icon'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final double speed;
  final int deg;
  final double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json['speed'] == null ? null : json['speed'].toDouble(),
        deg: json['deg'] == null ? null : json['deg'],
        gust: json['gust'] == null ? null : json['gust'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'speed': speed,
        'deg': deg,
        'gust': gust,
      };
}
