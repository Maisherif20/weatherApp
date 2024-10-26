import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';
import 'package:weatherapp/domainLayer/Entities/dailyWeather/DailyWeather.dart';
import '../../domainLayer/repositoryContract/RepositoryGetCityWeather.dart';
import '../dataSourceContract/dataSourceGetCityWeather.dart';
@Injectable(as:RepositoryGetCityWeather)
class RepositoryGetCityWeatherImpl extends RepositoryGetCityWeather{
  DataSourceGetCityWeather dataSourceGetCityWeather;
  RepositoryGetCityWeatherImpl({required this.dataSourceGetCityWeather});
  @override
  Future<Either<CityWeatherEntity, String>> getCityWeather(String city) async{
    var result = await dataSourceGetCityWeather.getCityWeather(city);
    return result.fold((response) {
      return Left(response.toCityWeatherEntity());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<CityWeatherEntity, String>> getWeatherByLatAndLon(String lat, String lon) async{
    var result = await dataSourceGetCityWeather.getWeatherByLatAndLon(lat, lon);
    return result.fold((response) {
      return Left(response.toCityWeatherEntity());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<DailyWeather, String>> getDailyWeather(String lat, String lon) async{
    var result = await dataSourceGetCityWeather.getDailyWeather(lat, lon);
    return result.fold((response) {
      return Left(response.toDailyWeather());
    }, (error) {
      return Right(error);
    });
  }
}