import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/infrastructure/models/mapbox_places_response.dart';
import 'package:rider_app/presentations/views/map_view.dart';

import '../../services/services.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<HomeProvider>(context);

    if (currentPosition.isLoading) return const CircularProgressIndicator();
    final place = ModalRoute.of(context)!.settings.arguments as Feature;
    return Scaffold(
      body: Stack(
        children: [
          MapView(currentPosition: currentPosition),
          Center(child: Text(place.geometry.coordinates.toString())),
        ],
      ),
    );
  }
}
