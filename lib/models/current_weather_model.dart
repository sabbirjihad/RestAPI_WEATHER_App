class CurrentWeatherModel {
  CurrentWeatherModel({
      this.coord, 
      this.weather, 
      this.base, 
      this.main, 
      this.visibility, 
      this.wind, 
      this.clouds, 
      this.dt, 
      this.sys, 
      this.timezone, 
      this.id, 
      this.name, 
      this.cod,});

  CurrentWeatherModel.fromJson(dynamic json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['visibility'] = visibility;
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }

}

class Sys {
  Sys({
      this.type, 
      this.id, 
      this.country, 
      this.sunrise, 
      this.sunset,});

  Sys.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }

}

class Clouds {
  Clouds({
      this.all,});

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }
  int? all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }

}

class Wind {
  Wind({
      this.speed, 
      this.deg,});

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
  }
  double? speed;
  int? deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }

}

class Main {
  Main({
      this.temp, 
      this.feelsLike, 
      this.tempMin, 
      this.tempMax, 
      this.pressure, 
      this.humidity,});

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    return map;
  }

}

class Weather {
  Weather({
      this.id, 
      this.main, 
      this.description, 
      this.icon,});

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  int? id;
  String? main;
  String? description;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }

}

class Coord {
  Coord({
      this.lon, 
      this.lat,});

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }
  double? lon;
  double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

}