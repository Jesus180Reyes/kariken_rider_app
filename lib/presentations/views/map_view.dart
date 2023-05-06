import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../config/data/map_style.dart';
import '../services/services.dart';

class MapView extends StatelessWidget {
  final HomeProvider currentPosition;
  const MapView({super.key, required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    final points = Provider.of<MapProvider>(context).geometry;

    Set<Polyline> polylines = {};

    final myRoute = Polyline(
      polylineId: const PolylineId("myroute"),
      points: points.map((e) => LatLng(e[0], e[1])).toList(),
      color: Colors.black,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      width: 6,
    );
    polylines.add(myRoute);
    return GoogleMap(
      polylines: polylines,
      onMapCreated: (GoogleMapController controller) {
        controller.setMapStyle(json.encode(mapStyle));
      },
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      compassEnabled: true,
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(currentPosition.lat!, currentPosition.long!),
        zoom: 14.4746,
      ),
    );
  }
}
