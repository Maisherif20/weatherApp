import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/presentationLayer/ui/DailyWeather/DailyWeatherView.dart';
import 'package:weatherapp/presentationLayer/ui/cityWeather/cityWeatherView.dart';
import 'package:weatherapp/presentationLayer/ui/search/searchTab.dart';
import 'package:weatherapp/routesManager.dart';

import '../otherCitiesWeather/otherCitiesView.dart';

class HomeScreen extends StatelessWidget {
  String lat;
  String lon;
  HomeScreen({required this.lat, required this.lon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFF0A0B39),
              Color(0xFF1D85E4),
              Color(0xFF23224A),
            ],
          )
              // image: DecorationImage(
              //   fit: BoxFit.fitHeight,
              //   image: AssetImage("assets/images/cloud-in-blue-sky.jpg")
              // )
              ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(top: 50.r, left: 10.r, right: 10.r),
                //   child: SearchWidget(),
                // ),
                CityWeatherView(lat: lat, lom: lon),
                SizedBox(height: 20.h,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Weather Expected for coming days:",style: TextStyle(color: Color(0xFF0A0B39) , fontSize: 20.sp),),
                ),
                Expanded(child: DailyWeatherView(lat: lat, lom: lon)),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.only(left: 12.w, top: 10.h),
                //       child: Text(
                //         "Other cities in egypt",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 18.sp,
                //             decoration: TextDecoration.none),
                //       ),
                //     ),
                //     SizedBox(
                //       height: 5.h,
                //     ),
                //     Container(height: 200.h, child: OtherCitiesWeatherView())
                //   ],
                // ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, RoutesManager.searchTab);
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.white,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.zero, // No rounded corners
                //       ), // Border color and width
                //     ),
                //     child: Text(
                //       "Search for specific city",
                //       style: TextStyle(
                //         fontSize: 22.sp,
                //         color: Color(0xFF0A0B39),
                //       ),
                //     )),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color:Color(0xFF0A0B39),width: 2 ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RoutesManager.searchTab);
          },
          child: Icon(
            Icons.search,
            size: 30.sp,
            color: Color(0xFF0A0B39),
          ),
        ),
      ),
    );
  }
}
