import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';

class CityWeatherTab extends StatelessWidget {
  CityWeatherEntity cityWeatherEntity;
  CityWeatherTab({required this.cityWeatherEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 25.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  cityWeatherEntity.name ?? "No name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      decoration: TextDecoration.none),
                ),
               Spacer(),
               Image.asset("assets/images/weather-app (1).png", color: Colors.white, height: 50.h,width: 50.w,),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Today, ${DateFormat().add_yMEd().format(DateTime.now())}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  decoration: TextDecoration.none, ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(cityWeatherEntity.main!.temp! - 273.15).round().toString()}\u2103' ??
                      "no  temp ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 90.sp,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                ),
                Image.network(
                    "http://openweathermap.org/img/w/${cityWeatherEntity.weather![0].icon}.png"),
                Text(
                  cityWeatherEntity.weather![0].description ??
                      "no  description ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            Container(
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_downward , color: Colors.white, size: 20,),
                    SizedBox(width: 5.w,),
                    Text("${(cityWeatherEntity.main!.tempMin! - 273.15).round().toString()}\u2103 " , style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,decoration: TextDecoration.none),),
                    Container(
                      height: 30, // Adjust height for your needs
                      width: 2, // Width of the divider
                      color: Colors.white, // Divider color
                      margin: EdgeInsets.symmetric(horizontal: 5.w), // Spacing
                    ),
                    Icon(Icons.arrow_upward , color: Colors.white, size: 20,),
                    SizedBox(width: 5.w,),
                    Text("${(cityWeatherEntity.main!.tempMax! - 273.15).round().toString()}\u2103" , style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,decoration: TextDecoration.none),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
