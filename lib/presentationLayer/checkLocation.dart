import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weatherapp/getLocation.dart';

class CheckLocation extends StatefulWidget {
  const CheckLocation({super.key});

  @override
  State<CheckLocation> createState() => _CheckLocationState();
}

class _CheckLocationState extends State<CheckLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          GetLocation.getLocation();
        },
        child: Text("get your location"),
      )),
    );
  }
}
