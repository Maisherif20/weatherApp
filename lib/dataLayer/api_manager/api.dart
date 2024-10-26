import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/constants.dart';
import 'package:weatherapp/dataLayer/model/cityWeather/CityWeatherDto.dart';
import 'package:injectable/injectable.dart';

import '../model/DailyWeatherDto/DailyWeatherDto.dart';
@singleton
@injectable
class ApiManager{
  Future<CityWeatherDto> getCityWeather(String city) async {
    var url = Uri.https(Constant.baseUrl, "/data/2.5/weather",
      {
        'q':city,
        'exclude':"hourly,daily",
        'appid':Constant.apiKey
      }
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    CityWeatherDto cityWeatherDto = CityWeatherDto.fromJson(json);
    return cityWeatherDto;
  }
  Future<CityWeatherDto> getWeatherByLatAndLon(String lat, String lon) async {
    var url = Uri.https(Constant.baseUrl, "/data/2.5/weather",
        {
          'lat':lat,
          'lon':lon,
          'exclude':"hourly,daily",
          'appid':Constant.apiKey
        }
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    CityWeatherDto cityWeatherDto = CityWeatherDto.fromJson(json);
    return cityWeatherDto;
  }
  Future<DailyWeatherDto> getDailyWeather(String lat, String lon) async {
    var url = Uri.https(Constant.baseUrl, "/data/2.5/forecast",
        {
          'lat':lat,
          'lon':lon,
          'appid':Constant.apiKey
        }
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    DailyWeatherDto dailyWeatherDto = DailyWeatherDto.fromJson(json);
    return dailyWeatherDto;
  }
}