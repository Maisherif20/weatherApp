import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/presentationLayer/ui/cityWeather/cityWeatherTab.dart';
import 'package:weatherapp/presentationLayer/ui/cityWeather/cityWeatherView.dart';
import 'package:weatherapp/presentationLayer/ui/otherCitiesWeather/otherCitiesView.dart';
import 'package:weatherapp/presentationLayer/ui/otherCitiesWeather/otherCitiesWeatherWidget.dart';

import '../../../DI/dI.dart';
import '../cityWeather/cityWeatherViwModel.dart';
import 'cityWeatherWidget.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late final TextEditingController cityController;
  CityWeatherViewModel cityWeatherViewModel = getIt<CityWeatherViewModel>();
  @override
  void initState() {
    cityController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // InkWell(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //     child: Icon(Icons.keyboard_backspace_sharp, size: 20.sp,color: Colors.white,)),
          Container(
            color: Colors.transparent,
            child: TextField(
              controller: cityController,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    size: 25.sp,
                    color: Colors.white,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    cityWeatherViewModel.getCityWeather(
                        city: cityController.text);
                  },
                  icon: Icon(
                    Icons.search,
                    size: 28.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder(
            bloc: cityWeatherViewModel,
            builder: (BuildContext context, state) {
              if (state is CityWeatherLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (state is CityWeatherSuccessState) {
                var cityWeather = state.cityWeatherEntity;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CityWeatherTab(cityWeatherEntity: cityWeather),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, top: 10.h),
                      child: Text(
                        "Other cities",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: Color(0xFF0A0B39),
                            fontSize: 22.sp,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    OtherCitiesWeatherView()
                    // OtherCitiesWeatherView()
                  ],
                );
              } else if (state is CityWeatherErrorState) {
                return Text("Sorry, city not found",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ));
              } else {
                return Visibility(visible: false, child: Text(""));
              }
            },
          ),
        ],
      ),
    );
  }
}
