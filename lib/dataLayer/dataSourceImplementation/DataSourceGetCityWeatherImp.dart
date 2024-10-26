import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:weatherapp/dataLayer/api_manager/api.dart';
import 'package:weatherapp/dataLayer/dataSourceContract/dataSourceGetCityWeather.dart';
import 'package:weatherapp/dataLayer/model/cityWeather/CityWeatherDto.dart';

import '../model/DailyWeatherDto/DailyWeatherDto.dart';


@Injectable(as: DataSourceGetCityWeather)
class DataSourceGetCityWeatherImpl extends DataSourceGetCityWeather {
  @factoryMethod
  ApiManager apiManager;
  DataSourceGetCityWeatherImpl({required this.apiManager});
  @override
  Future<Either<CityWeatherDto, String>> getCityWeather(String city) async {
    try {
      var response = await apiManager.getCityWeather(city);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<CityWeatherDto, String>> getWeatherByLatAndLon(String lat, String lon) async{
    try {
      var response = await apiManager.getWeatherByLatAndLon(lat, lon);
      if (response.statusMsg != null) {
        return Right(response.message!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }

  @override
  Future<Either<DailyWeatherDto, String>> getDailyWeather(String lat, String lon) async{
    try {
      var response = await apiManager.getDailyWeather(lat, lon);
      if (response.statusMsg != null) {
        return Right(response.resMessage!);
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString()); // error from server
    }
  }
}
