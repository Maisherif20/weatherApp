import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/Main.dart';

class MainDto {
  MainDto({
      this.temp, 
      this.feelsLike, 
      this.tempMin, 
      this.tempMax, 
      this.pressure, 
      this.humidity, 
      this.seaLevel, 
      this.grndLevel,});

  MainDto.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;
  num? seaLevel;
  num? grndLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['sea_level'] = seaLevel;
    map['grnd_level'] = grndLevel;
    return map;
  }
  Main toMain(){
    return Main(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
    tempMax: tempMax,
      pressure: pressure,
      humidity: humidity,
      seaLevel: seaLevel,
      grndLevel: grndLevel
    );
  }

}