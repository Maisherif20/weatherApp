import 'package:weatherapp/domainLayer/Entities/dailyWeather/ListEntity.dart';

import 'MainDto.dart';
import 'WeatherDto.dart';
import 'CloudsDto.dart';
import 'WindDto.dart';
import 'SysDto.dart';

class ListDto {
  ListDto({
      this.dt, 
      this.main, 
      this.weather, 
      this.clouds, 
      this.wind, 
      this.visibility, 
      this.pop, 
      this.sys, 
      this.dtTxt,});

  ListDto.fromJson(dynamic json) {
    dt = json['dt'];
    main = json['main'] != null ? MainDto.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(WeatherDto.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? CloudsDto.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? WindDto.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? SysDto.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }
  num? dt;
  MainDto? main;
  List<WeatherDto>? weather;
  CloudsDto? clouds;
  WindDto? wind;
  num? visibility;
  num? pop;
  SysDto? sys;
  String? dtTxt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    map['visibility'] = visibility;
    map['pop'] = pop;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['dt_txt'] = dtTxt;
    return map;
  }
  ListEntity toListEntity(){
    return ListEntity(
      dt: dt,
      main: main?.toMain(),
      weather: weather?.map((e) => e.toWeather()).toList(),
      clouds: clouds?.toClouds(),
      wind: wind?.toWind(),
      visibility: visibility,
      pop: pop,
      sys: sys?.toSys(),
      dtTxt: dtTxt
    );
  }
}