// ignore: file_names
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      var location = position;
      latitude = location.latitude;
      longitude = location.longitude;
      print(latitude);
      print(longitude);
    } catch (e) {
      print(e);
    }
  }
}