import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  double? lat;
  double? long;
  dynamic addressResults;
  HomeProvider() {
    onInitContructor();
  }
  Future<void> onInitContructor() async {
    await getCurrentPosition();
    await getPlaceNameByLatLng(latitude: lat, longitude: long);
  }

  Future getCurrentPosition() async {
    isLoading = true;
    notifyListeners();
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) await Geolocator.openLocationSettings();
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

  Future getPlaceNameByLatLng(
      {required double? latitude, required double? longitude}) async {
    final apiKey = dotenv.env["API_KEY"];
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey");
    isLoading = true;
    notifyListeners();
    final resp = await http.get(url);
    addressResults = json.decode(resp.body);
    isLoading = false;
    notifyListeners();
  }
}
