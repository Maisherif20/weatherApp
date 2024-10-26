import 'package:either_dart/either.dart';
import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';
import 'package:weatherapp/domainLayer/Entities/dailyWeather/DailyWeather.dart';

abstract class RepositoryGetCityWeather{
  Future<Either<CityWeatherEntity,String>>getCityWeather(String city);
  Future<Either<CityWeatherEntity,String>>getWeatherByLatAndLon(String lat, String lon);
  Future<Either<DailyWeather,String>>getDailyWeather(String lat, String lon);
}