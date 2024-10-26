import 'package:weatherapp/domainLayer/Entities/dailyWeather/ListEntity.dart';

import 'City.dart';

class DailyWeather {
  DailyWeather({
    this.cod,
    this.message,
    this.cnt,
    this.resMessage,
    this.statusMsg,
    this.listEntity,
    this.city,
  });

  DailyWeather.fromJson(dynamic json) {
    cod = json['cod'];
    message = json['message'];
    resMessage = json['resMessage'];
    statusMsg = json['statusMsg'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      listEntity = [];
      json['list'].forEach((v) {
        listEntity?.add(ListEntity.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
  String? cod;
  num? message;
  String? resMessage;
  String? statusMsg;
  num? cnt;
  List<ListEntity>? listEntity;
  City? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cod'] = cod;
    map['resMessage'] = resMessage;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['cnt'] = cnt;
    if (listEntity != null) {
      map['list'] = listEntity?.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    return map;
  }
}
