import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/config/data/map_style.dart';
import 'package:rider_app/presentations/services/home/home_provider.dart';

class MapGoogleWidget extends StatelessWidget {
  final double? height;
  final double? margin;
  const MapGoogleWidget({
    super.key,
    this.height = 200,
    this.margin = 30,
  });
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<HomeProvider>(context);
    if (currentPosition.isLoading) return const CircularProgressIndicator();
    return Container(
      margin: EdgeInsets.all(margin!),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(20),
      ),
      height: height,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(json.encode(mapStyle));
          },
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          compassEnabled: true,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(currentPosition.lat!, currentPosition.long!),
            zoom: 14.4746,
          ),
        ),
      ),
    );
  }
}
