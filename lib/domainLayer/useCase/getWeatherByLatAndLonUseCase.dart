import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';
import '../repositoryContract/RepositoryGetCityWeather.dart';

@injectable
class GetWeatherByLatAndLonUseCase {
  RepositoryGetCityWeather repositoryGetCityWeather;
  GetWeatherByLatAndLonUseCase({required this.repositoryGetCityWeather});
  Future<Either<CityWeatherEntity, String>> invoke(String lat , String lon) {
    return repositoryGetCityWeather.getWeatherByLatAndLon(lat, lon);
  }
}