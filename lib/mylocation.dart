import 'package:geolocator/geolocator.dart';

class Mylocation {
  double lat=0;
  double lon=0;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;

    } catch (e) {
      print('internet connect');
    }
  }
}
