import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';
import 'CoordDto.dart';
import 'WeatherDto.dart';
import 'MainDto.dart';
import 'WindDto.dart';
import 'CloudsDto.dart';
import 'SysDto.dart';

class CityWeatherDto {
  CityWeatherDto({
      this.coordDto,
      this.statusMsg,
      this.message,
      this.weatherDto,
      this.base, 
      this.mainDto,
      this.visibility, 
      this.windDto,
      this.cloudsDto,
      this.dt, 
      this.sysDto,
      this.timezone, 
      this.id, 
      this.name, 
      this.cod,});

  CityWeatherDto.fromJson(dynamic json) {
    coordDto = json['coord'] != null ? CoordDto.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weatherDto = [];
      json['weather'].forEach((v) {
        weatherDto?.add(WeatherDto.fromJson(v));
      });
    }
    statusMsg = json['statusMsg'];
    message = json['message'];
    base = json['base'];
    mainDto = json['main'] != null ? MainDto.fromJson(json['main']) : null;
    visibility = json['visibility'];
    windDto = json['wind'] != null ? WindDto.fromJson(json['wind']) : null;
    cloudsDto = json['clouds'] != null ? CloudsDto.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sysDto = json['sys'] != null ? SysDto.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
  String? statusMsg;
  String? message;
  CoordDto? coordDto;
  List<WeatherDto>? weatherDto;
  String? base;
  MainDto? mainDto;
  num? visibility;
  WindDto? windDto;
  CloudsDto? cloudsDto;
  num? dt;
  SysDto? sysDto;
  num? timezone;
  num? id;
  String? name;
  num? cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coordDto != null) {
      map['coord'] = coordDto?.toJson();
    }
    if (weatherDto != null) {
      map['weather'] = weatherDto?.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (mainDto != null) {
      map['main'] = mainDto?.toJson();
    }
    map['visibility'] = visibility;
    if (windDto != null) {
      map['wind'] = windDto?.toJson();
    }
    if (cloudsDto != null) {
      map['clouds'] = cloudsDto?.toJson();
    }
    map['dt'] = dt;
    if (sysDto != null) {
      map['sys'] = sysDto?.toJson();
    }
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }
  CityWeatherEntity toCityWeatherEntity(){
    return CityWeatherEntity(
      wind: windDto?.toWind(),
      coord: coordDto?.toCoord(),
      weather: weatherDto?.map((e) => e.toWeather()).toList(),
      base: base,
      main: mainDto?.toMain(),
      visibility: visibility,
      clouds: cloudsDto?.toClouds(),
      sys: sysDto?.toSys(),
      dt: dt,
      timezone: timezone,
      id: id,
      name: name,
      cod:cod,
      statusMsg: statusMsg,
      message: message
    );
  }

}