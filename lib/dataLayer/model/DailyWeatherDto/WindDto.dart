import 'package:weatherapp/domainLayer/Entities/dailyWeather/Wind.dart';

class WindDto {
  WindDto({
      this.speed, 
      this.deg, 
      this.gust,});

  WindDto.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
  num? speed;
  num? deg;
  num? gust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    map['gust'] = gust;
    return map;
  }
  Wind toWind(){
    return Wind(
      speed: speed,
      deg: deg,
      gust: gust
    );
  }

}