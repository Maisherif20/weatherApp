import 'package:weatherapp/domainLayer/Entities/dailyWeather/Weather.dart';

class WeatherDto {
  WeatherDto({
      this.id, 
      this.main, 
      this.description, 
      this.icon,});

  WeatherDto.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  num? id;
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
  Weather toWeather(){
    return Weather(
      id: id,
      main: main,
      description: description,
      icon: icon
    );
  }

}