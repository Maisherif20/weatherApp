import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../domainLayer/Entities/cityWeatherEnitity/CityWeatherEntity.dart';

class CityWeatherWidget extends StatelessWidget {
  CityWeatherEntity cityWeatherEntity;
  CityWeatherWidget({required this.cityWeatherEntity});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        width: 370.w,
        height: 200.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cityWeatherEntity.name ?? "no cityName",
              style: TextStyle(color: Colors.black, fontSize: 25.sp,decoration: TextDecoration.none),
            ),
            SizedBox(height: 10.h,),
            Text(
              DateFormat().add_MMMMEEEEd().format(DateTime.now()),
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 10.sp,
                  decoration: TextDecoration.none
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        cityWeatherEntity.weather![0].description ??
                            "no  description ",
                        style:
                            TextStyle(color: Colors.black, fontSize: 18.sp,decoration: TextDecoration.none),
                      ),
                      Text(
                        '${(cityWeatherEntity.main!.temp! - 273.15).round().toString()}\u2103' ??
                            "no  temp ",
                        style:
                            TextStyle(color: Colors.black, fontSize: 25.sp,decoration: TextDecoration.none),
                      ),
                      Text(
                        'min: ${(cityWeatherEntity.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(cityWeatherEntity.main!.tempMax! - 273.15).round().toString()}\u2103' ??
                            "no  temp ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Column(
                    children: [
                      Image.network(
                          "http://openweathermap.org/img/w/${cityWeatherEntity.weather![0].icon}.png"),
                      // Image.network(
                      //   fit: BoxFit.cover,
                      //     "http://openweathermap.org/img/wn/${cityWeatherEntity.weather![0].icon}@2x.png"),
                      Text(
                        "Wind ${cityWeatherEntity.wind?.speed} m/s" ??
                            "no  temp ",
                        style: TextStyle(color: Colors.black , fontSize: 15.sp,decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
