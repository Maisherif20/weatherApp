import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weatherapp/constants.dart';
import 'package:weatherapp/domainLayer/useCase/getCityWeatherUseCase.dart';
import '../../../domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';

@injectable
class OtherCitiesViewModel extends Cubit<OtherCitiesWeatherStates> {
  @factoryMethod
  OtherCitiesViewModel({required this.getCityWeatherUseCase})
      : super(OtherCitiesWeatherInitialState());
  GetCityWeatherUseCase getCityWeatherUseCase;

 getCitiesWeather() async {
    // Emit loading state at the start
    emit(OtherCitiesWeatherLoadingState());
    List<CityWeatherEntity> citiesWeatherData = [];
    try {
      // Loop through each city in the list
      for (var city in Constant.egyptGovernorates) {
        var result = await getCityWeatherUseCase.invoke(city);

        result.fold(
                (response) {
              // Accumulate the data for each city
              citiesWeatherData.add(response);
            },
                (error) {
              // Emit error state if any city fails
              emit(OtherCitiesWeatherErrorState(errorMessage: error));
              return; // Exit if there's an error for one city
            }
        );
      }

      // After all cities are processed, emit success state with all data
      emit(OtherCitiesWeatherSuccessState(cityWeatherEntity: citiesWeatherData));

    } catch (e) {
      // Catch any other errors and emit the error state
      emit(OtherCitiesWeatherErrorState(errorMessage: e.toString()));
    }
  }

}

class OtherCitiesWeatherStates{}

class OtherCitiesWeatherInitialState extends OtherCitiesWeatherStates {}

class OtherCitiesWeatherLoadingState extends OtherCitiesWeatherStates {}

class OtherCitiesWeatherSuccessState extends OtherCitiesWeatherStates {
  List<CityWeatherEntity> cityWeatherEntity;
  OtherCitiesWeatherSuccessState({required this.cityWeatherEntity});
}

class OtherCitiesWeatherErrorState extends OtherCitiesWeatherStates {
  String errorMessage;
  OtherCitiesWeatherErrorState({required this.errorMessage});
}
