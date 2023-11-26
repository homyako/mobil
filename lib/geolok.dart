import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:pro1/kod.dart';
import 'package:pro1/pozit.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}
Future<LocationMod> getLocation() async{
  var poz = await determinePosition();
  var data = {"lat": poz.latitude, "lon": poz.longitude};
  Map<String, dynamic> adres = json.decode(await getAddress(data));
  return LocationMod(poz.latitude, poz.longitude, adres['suggestions'][0]["value"]);
}