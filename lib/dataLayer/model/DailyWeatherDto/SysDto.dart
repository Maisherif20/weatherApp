import 'package:weatherapp/domainLayer/Entities/dailyWeather/Sys.dart';

class SysDto {
  SysDto({
      this.pod,});

  SysDto.fromJson(dynamic json) {
    pod = json['pod'];
  }
  String? pod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pod'] = pod;
    return map;
  }
  Sys toSys(){
    return Sys(
      pod: pod
    );
  }

}