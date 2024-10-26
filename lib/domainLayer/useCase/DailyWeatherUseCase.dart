import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:weatherapp/domainLayer/Entities/dailyWeather/DailyWeather.dart';
import '../repositoryContract/RepositoryGetCityWeather.dart';

@injectable
class DailyWeatherUseCase {
  RepositoryGetCityWeather repositoryGetCityWeather;
  DailyWeatherUseCase({required this.repositoryGetCityWeather});
  Future<Either<DailyWeather, String>> invoke(String lat , String lon) {
    return repositoryGetCityWeather.getDailyWeather(lat, lon);
  }
}