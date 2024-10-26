import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
class GetLocation{
  static Future<Position> getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    Position location = await Geolocator.getCurrentPosition();
    print(location.longitude);
    print(location.latitude);
    // List<Placemark> placemarks =
    // await placemarkFromCoordinates(location.latitude, location.longitude);
    // print(placemarks);
    // Placemark place = placemarks[0];
    // var Address =
    //     '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    // print(Address);
    return Geolocator.getCurrentPosition();
  }
}


