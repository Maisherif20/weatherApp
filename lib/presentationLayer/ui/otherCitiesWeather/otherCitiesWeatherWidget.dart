import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/Main.dart';
import '../../../domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';

class OtherCitiesWeatherWidget extends StatelessWidget {
  List<CityWeatherEntity> cityWeather;
  OtherCitiesWeatherWidget({required this.cityWeather});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 10.w),
      child: Container(
        height: 350.h,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cityWeather.length, // The number of cities in the list
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color:Color(0xFF0A0B39),width: 2 )
                    ),
                child: Row(
                  children: [
                    Text(
                      " ${cityWeather[index].name} " ??
                          "No city", // Display the city name
                      style: TextStyle(color: Color(0xFF0A0B39), fontSize: 20.sp,decoration: TextDecoration.none, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      "${(cityWeather[index].main!.temp! - 273.15).round().toString()}\u2103" ??
                          "No city", // Display the city name
                      style: TextStyle(color: Color(0xFF0A0B39), fontSize: 15.sp,decoration: TextDecoration.none),
                    ),
                    Spacer(),
                    Image.network(
                        "http://openweathermap.org/img/w/${cityWeather[index].weather![0].icon}.png"),
                    SizedBox(width: 10.w,)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
