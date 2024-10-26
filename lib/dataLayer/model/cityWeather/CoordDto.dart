import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/Coord.dart';

class CoordDto {
  CoordDto({
      this.lon, 
      this.lat,});

  CoordDto.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }
  num? lon;
  num? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
  Coord toCoord(){
    return Coord(
      lat: lat,
      lon: lon
    );
  }

}