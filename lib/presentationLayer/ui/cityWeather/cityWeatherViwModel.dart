import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weatherapp/domainLayer/useCase/getCityWeatherUseCase.dart';
import '../../../domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';
import '../../../domainLayer/useCase/getWeatherByLatAndLonUseCase.dart';

@injectable
class CityWeatherViewModel extends Cubit<CityWeatherStates> {
  @factoryMethod
  CityWeatherViewModel({required this.getCityWeatherUseCase, required this.getWeatherByLatAndLonUseCase})
      : super(CityWeatherInitialState());
  GetCityWeatherUseCase getCityWeatherUseCase;
  GetWeatherByLatAndLonUseCase getWeatherByLatAndLonUseCase;

  getCityWeather({required String city}) async {
    emit(CityWeatherLoadingState());
    try {
      var result = await getCityWeatherUseCase.invoke(city);
      result.fold((response) {
        emit(CityWeatherSuccessState(cityWeatherEntity: response));
      }, (error) {
        emit(CityWeatherErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(CityWeatherErrorState(errorMessage: e.toString()));
    }
  }
  getCityWeatherByLanAndLon({required String lat , required String lon}) async {
    emit(CityWeatherLoadingState());
    try {
      var result = await getWeatherByLatAndLonUseCase.invoke(lat, lon);
      result.fold((response) {
        emit(CityWeatherSuccessState(cityWeatherEntity: response));
      }, (error) {
        emit(CityWeatherErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(CityWeatherErrorState(errorMessage: e.toString()));
    }
  }
}

class CityWeatherStates{}

class CityWeatherInitialState extends CityWeatherStates {}

class CityWeatherLoadingState extends CityWeatherStates {}

class CityWeatherSuccessState extends CityWeatherStates {
  CityWeatherEntity cityWeatherEntity;
  CityWeatherSuccessState({required this.cityWeatherEntity});
}

class CityWeatherErrorState extends CityWeatherStates {
  String errorMessage;
  CityWeatherErrorState({required this.errorMessage});
}
