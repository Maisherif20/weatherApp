import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/Wind.dart';

class WindDto {
  WindDto({
      this.speed, 
      this.deg,});

  WindDto.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
  }
  num? speed;
  num? deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }
  Wind toWind(){
    return Wind(
      speed: speed,
      deg: deg
    );
  }

}