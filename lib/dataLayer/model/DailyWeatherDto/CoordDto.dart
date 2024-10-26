import 'package:weatherapp/domainLayer/Entities/dailyWeather/Coord.dart';

class CoordDto {
  CoordDto({
      this.lat, 
      this.lon,});

  CoordDto.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
  }
  num? lat;
  num? lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }
  Coord toCoord(){
    return Coord(
      lat: lat,
      lon: lon
    );
  }

}