import 'dart:convert';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../config/data/map_style.dart';

class MapProvider extends ChangeNotifier {
  bool isLoading = true;
  String tripDuration = "Duracion del viaje";
  String tripDistance = "Distancia del viaje en KM O MI";
  Iterable geometry = [];
  GoogleMapController? controller;
  List<Marker> markers = [];

  Future<void> getPolylineStarttoEnd({
    required LatLng start,
    required LatLng end,
  }) async {
    try {
      final apiKey = dotenv.env["API_KEY"];
      final url = Uri.parse(
          "https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=$apiKey&lang=es");
      final resp = await http.get(url);
      final data = await json.decode(resp.body);
      final points = data["routes"][0]["overview_polyline"]["points"];
      geometry = decodePolyline(points);
      tripDuration = data["routes"][0]["legs"][0]["duration"]["text"];
      tripDuration = data["routes"][0]["legs"][0]["duration"]["text"];
      tripDistance = data["routes"][0]["legs"][0]["distance"]["text"];
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return Future.error(e.toString());
    }
  }

  void onMapCreated({
    required GoogleMapController controller,
    required LatLng place,
  }) {
    controller.setMapStyle(json.encode(mapStyle));
    controller.animateCamera(
      CameraUpdate.newLatLngZoom(place, 13.5),
      // CameraUpdate.newCameraPosition(
      //   CameraPosition(target: place, zoom: 13.5),
      // ),
    );
    isLoading = false;
    notifyListeners();
  }

  addMarkers({
    required LatLng latLngDestiny,
    required LatLng latLngPickup,
    required String markerTitle,
  }) {
    markers = [
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        markerId: const MarkerId(
          "Destination",
        ),
        position: latLngDestiny,
        infoWindow: InfoWindow(title: markerTitle),
      ),
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        markerId: const MarkerId(
          "PickUp",
        ),
        position: latLngPickup,
        infoWindow: InfoWindow(title: markerTitle),
      ),
    ];
    notifyListeners();
  }

  clearMarkers() {
    markers.clear();
    geometry.toList().clear();
  }
}
