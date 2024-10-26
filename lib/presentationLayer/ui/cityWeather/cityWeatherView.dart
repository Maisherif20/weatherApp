import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/presentationLayer/ui/cityWeather/cityWeatherTab.dart';
import 'package:weatherapp/presentationLayer/ui/cityWeather/cityWeatherViwModel.dart';

import '../../../DI/dI.dart';

class CityWeatherView extends StatefulWidget {
  String lat;
  String lom;
  CityWeatherView({required this.lat , required this.lom});

  @override
  State<CityWeatherView> createState() => _CityWeatherViewState();
}
class _CityWeatherViewState extends State<CityWeatherView> {
  String city = "cairo";
  CityWeatherViewModel cityWeatherViewModel = getIt<CityWeatherViewModel>();
  @override
  void initState() {
    cityWeatherViewModel.getCityWeatherByLanAndLon(lat: widget.lat, lon: widget.lom);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityWeatherViewModel, CityWeatherStates>(
      bloc: cityWeatherViewModel,
      builder: (context, state) {
        switch (state) {
          case CityWeatherLoadingState():
            {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white,),
              );
            }
          case CityWeatherErrorState():
            {
              return Column(
                children: [
                  Expanded(child: Text(state.errorMessage)),
                ],
              );
            }
          case CityWeatherSuccessState():
            {
              var cityWeather = state.cityWeatherEntity;
              return Center(child: CityWeatherTab(cityWeatherEntity: cityWeather,));
            }
        }
        return Text("No data" ,style: TextStyle(color: Colors.white),);
      },
    );
  }
}