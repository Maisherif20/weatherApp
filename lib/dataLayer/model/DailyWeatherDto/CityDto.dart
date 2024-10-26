import 'package:weatherapp/domainLayer/Entities/dailyWeather/City.dart';

import 'CoordDto.dart';

class CityDto {
  CityDto({
      this.id, 
      this.name, 
      this.coord, 
      this.country, 
      this.population, 
      this.timezone, 
      this.sunrise, 
      this.sunset,});

  CityDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? CoordDto.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  num? id;
  String? name;
  CoordDto? coord;
  String? country;
  num? population;
  num? timezone;
  num? sunrise;
  num? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    map['country'] = country;
    map['population'] = population;
    map['timezone'] = timezone;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
  City toCity(){
    return City(
      id: id,
      name: name,
      coord: coord?.toCoord(),
      country: country,
      population: population,
      timezone: timezone,
      sunset: sunset,
      sunrise: sunrise
    );
  }

}