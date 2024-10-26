import 'package:either_dart/either.dart';
import 'package:weatherapp/dataLayer/model/cityWeather/CityWeatherDto.dart';
import '../model/DailyWeatherDto/DailyWeatherDto.dart';

abstract class DataSourceGetCityWeather{
  Future<Either<CityWeatherDto,String>>getCityWeather(String city);
  Future<Either<CityWeatherDto,String>>getWeatherByLatAndLon(String lat, String lon);
  Future<Either<DailyWeatherDto,String>>getDailyWeather(String lat, String lon);
}