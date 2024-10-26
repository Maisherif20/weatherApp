import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weatherapp/domainLayer/Entities/dailyWeather/DailyWeather.dart';
import 'package:weatherapp/domainLayer/useCase/DailyWeatherUseCase.dart';
@injectable
class DailyWeatherViewModel extends Cubit<DailyWeatherStates> {
  @factoryMethod
  DailyWeatherViewModel({required this.dailyWeatherUseCase})
      : super(DailyWeatherInitialState());
  DailyWeatherUseCase dailyWeatherUseCase;
  getDailyWeather({required String lat , required String lon}) async {
    emit(DailyWeatherLoadingState());
    try {
      var result = await dailyWeatherUseCase.invoke(lat, lon);
      result.fold((response) {
        emit(DailyWeatherSuccessState(dailyWeather: response));
      }, (error) {
        emit(DailyWeatherErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(DailyWeatherErrorState(errorMessage: e.toString()));
    }
  }
}

class DailyWeatherStates{}

class DailyWeatherInitialState extends DailyWeatherStates {}

class DailyWeatherLoadingState extends DailyWeatherStates {}

class DailyWeatherSuccessState extends DailyWeatherStates {
  DailyWeather dailyWeather;
  DailyWeatherSuccessState({required this.dailyWeather});
}

class DailyWeatherErrorState extends DailyWeatherStates {
  String errorMessage;
  DailyWeatherErrorState({required this.errorMessage});
}