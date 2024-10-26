import 'package:weatherapp/domainLayer/Entities/dailyWeather/DailyWeather.dart';
import 'CityDto.dart';
import 'ListDto.dart';

class DailyWeatherDto {
  DailyWeatherDto({
    this.cod,
    this.message,
    this.resMessage,
    this.statusMsg,
    this.cnt,
    this.listDto,
    this.city,
  });

  DailyWeatherDto.fromJson(dynamic json) {
    cod = json['cod'];
    message = json['message'];
    resMessage = json['resMessage'];
    statusMsg = json['statusMsg'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      listDto = [];
      json['list'].forEach((v) {
        listDto?.add(ListDto.fromJson(v));
      });
    }
    city = json['city'] != null ? CityDto.fromJson(json['city']) : null;
  }
  String? cod;
  num? message;
  String? resMessage;
  String? statusMsg;
  num? cnt;
  List<ListDto>? listDto;
  CityDto? city;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cod'] = cod;
    map['resMessage'] = resMessage;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['cnt'] = cnt;
    if (listDto != null) {
      map['list'] = listDto?.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    return map;
  }
  DailyWeather toDailyWeather() {
    return DailyWeather(
        cod: cod,
        listEntity: listDto?.map((e) => e.toListEntity()).toList(),
        message: message,
        cnt: cnt,
        resMessage: resMessage,
        statusMsg: statusMsg,
        city: city?.toCity());
  }


}
