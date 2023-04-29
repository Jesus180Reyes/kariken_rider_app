import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  double? lat;
  double? long;
  HomeProvider() {
    getCurrentPosition();
  }
  Future getCurrentPosition() async {
    isLoading = true;
    notifyListeners();
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) Geolocator.openLocationSettings();
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
      return;
    }
    final myPosition = await Geolocator.getCurrentPosition();
    lat = myPosition.latitude;
    long = myPosition.longitude;
    isLoading = false;
    notifyListeners();
    return myPosition;
  }
}
