import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/presentationLayer/checkLocation.dart';
import 'package:weatherapp/presentationLayer/ui/cityWeather/cityWeatherView.dart';
import 'package:weatherapp/presentationLayer/ui/homeScreen/homeScreen.dart';
import 'package:weatherapp/presentationLayer/ui/search/searchTab.dart';
import 'package:weatherapp/presentationLayer/ui/splashScreen/splashScreen.dart';
import 'package:weatherapp/routesManager.dart';
import 'DI/dI.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          RoutesManager.splashScreen:(context)=>SplashScreen(),
          RoutesManager.searchTab:(context)=>SearchTab(),
        },
        initialRoute: RoutesManager.splashScreen,
      ),
    );
  }
}

