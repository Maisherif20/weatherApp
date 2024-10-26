import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';
import '../repositoryContract/RepositoryGetCityWeather.dart';

@injectable
class GetCityWeatherUseCase {
  RepositoryGetCityWeather repositoryGetCityWeather;
  GetCityWeatherUseCase({required this.repositoryGetCityWeather});
  Future<Either<CityWeatherEntity, String>> invoke(String city) {
    return repositoryGetCityWeather.getCityWeather(city);
  }
}