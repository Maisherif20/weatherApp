import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/Sys.dart';

class SysDto {
  SysDto({
      this.type, 
      this.id, 
      this.country, 
      this.sunrise, 
      this.sunset,});

  SysDto.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  num? type;
  num? id;
  String? country;
  num? sunrise;
  num? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
  Sys toSys(){
    return Sys(
      type: type,
      id: id,
      country: country,
      sunrise: sunrise,
      sunset: sunset
    );
  }

}