import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/presentationLayer/ui/otherCitiesWeather/otherCitiesWeatherViewModel.dart';

import '../../../DI/dI.dart';
import 'otherCitiesWeatherWidget.dart';

class OtherCitiesWeatherView extends StatefulWidget {
  const OtherCitiesWeatherView({super.key});

  @override
  State<OtherCitiesWeatherView> createState() => _OtherCitiesWeatherViewState();
}

class _OtherCitiesWeatherViewState extends State<OtherCitiesWeatherView> {
  OtherCitiesViewModel otherCitiesViewModel = getIt<OtherCitiesViewModel>();
  List governorate = ["Alex", "Cairo", "Zagazig"];
  @override
  void initState() {
    otherCitiesViewModel.getCitiesWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherCitiesViewModel, OtherCitiesWeatherStates>(
      bloc: otherCitiesViewModel,
      builder: (context, state) {
        if (state is OtherCitiesWeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white,),
          );
        } else if (state is OtherCitiesWeatherErrorState) {
          return Text("Sorry,city not found",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ));
        } else if (state is OtherCitiesWeatherSuccessState) {
          // Assuming state.cityWeatherEntities is a list of weather data for each city
          var cityWeather = state.cityWeatherEntity; // Adjust as needed
          return OtherCitiesWeatherWidget(cityWeather: cityWeather);
        }
        return Text("No data", style: TextStyle(color: Colors.white));
      },
    );
  }
}
