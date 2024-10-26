import 'package:weatherapp/domainLayer/Entities/dailyWeather/Clouds.dart';

class CloudsDto {
  CloudsDto({
      this.all,});

  CloudsDto.fromJson(dynamic json) {
    all = json['all'];
  }
  num? all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
  Clouds toClouds(){
    return Clouds(
      all: all
    );
  }

}