import 'package:flutter/material.dart';
import 'package:rider_app/infrastructure/models/mapbox_places_response.dart';
import 'package:rider_app/presentations/widgets/widgets.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final place = ModalRoute.of(context)!.settings.arguments as Feature;
    return Scaffold(
      body: Stack(
        children: [
          MapGoogleWidget(height: size.height, margin: 0),
          Center(child: Text(place.geometry.coordinates.toString())),
        ],
      ),
    );
  }
}
