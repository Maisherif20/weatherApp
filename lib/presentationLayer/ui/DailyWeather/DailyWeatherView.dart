import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/presentationLayer/ui/DailyWeather/DailyWeatherViewModel.dart';
import '../../../DI/dI.dart';

class DailyWeatherView extends StatefulWidget {
  String lat;
  String lom;
  DailyWeatherView({required this.lat , required this.lom});

  @override
  State<DailyWeatherView> createState() => _DailyWeatherViewState();
}
class _DailyWeatherViewState extends State<DailyWeatherView> {
  String city = "cairo";
  DailyWeatherViewModel dailyWeatherViewModel = getIt<DailyWeatherViewModel>();
  @override
  void initState() {
    dailyWeatherViewModel.getDailyWeather(lat: widget.lat, lon: widget.lom);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyWeatherViewModel, DailyWeatherStates>(
      bloc: dailyWeatherViewModel,
      builder: (context, state) {
        switch (state) {
          case DailyWeatherLoadingState():
            {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white,),
              );
            }
          case DailyWeatherErrorState():
            {
              return Column(
                children: [
                  Expanded(child: Text(state.errorMessage )),
                ],
              );
            }
          case DailyWeatherSuccessState():
            {
              var daily = state.dailyWeather;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                          border: Border.all(color:Color(0xFF0A0B39),width: 2 )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(daily.listEntity![index].main!.temp! - 273.15).round().toString()}\u2103' ??
                                "no  temp ",
                            style: TextStyle(
                                color:  Color(0xFF0A0B39),
                                fontSize: 20.sp,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500),
                          ),
                          Image.network(
                              "http://openweathermap.org/img/w/${daily.listEntity![index].weather![0].icon}.png"),
                          Text(
                            daily.listEntity![index].weather![0].description ??
                                "no  description ",
                            style: TextStyle(
                                color:  Color(0xFF0A0B39),
                                fontSize: 15.sp,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(width: 10.w,),
                          Icon(Icons.calendar_month,color:  Color(0xFF0A0B39),),
                          Text(daily.listEntity![index].dtTxt.toString() , style: TextStyle(color:  Color(0xFF0A0B39),
                            fontSize: 15.sp,),),
                        ],
                                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.dailyWeather.listEntity?.length?? 0,
                ),
              );
            }
        }
        return Text("No data" ,style: TextStyle(color: Colors.white),);
      },
    );
  }
}