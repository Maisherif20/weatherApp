import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/getLocation.dart';
import 'package:weatherapp/presentationLayer/ui/homeScreen/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = false;

  Future<void> _checkWeather() async {
    setState(() {
      _isLoading = true; // Set loading state
    });

    try {
      Position location = await GetLocation.getLocation();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(
          lat: location.latitude.toString(),
          lon: location.longitude.toString(),
        ),
      ));
    } catch (e) {
      // Handle location fetching error (optional)
      setState(() {
        _isLoading = false; // Reset loading state on error
      });
      // You might want to show an error dialog or a Snackbar here
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFF0A0B39),
              Color(0xFF1D85E4),
              Color(0xFF23224A),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              fit: BoxFit.fill,
              "assets/images/Animation - 1727455356910.gif",
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: GestureDetector(
                onTap: _isLoading ? null : _checkWeather, // Disable tap if loading
                child: Container(
                  width: 250.w,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.yellow, width: 2),
                  ),
                  child: Center(
                    child: _isLoading
                        ? CircularProgressIndicator(color: Color(0xFF0A0B39),) // Show loading indicator
                        : Text(
                      "Check Weather",
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Color(0xFF0A0B39),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}