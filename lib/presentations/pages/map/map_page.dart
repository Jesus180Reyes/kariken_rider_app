import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/infrastructure/models/mapbox_places_response.dart';
import 'package:rider_app/presentations/views/map_view.dart';

import '../../services/services.dart';
import '../../shared/shared.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<MapProvider>(context).isLoading;
    final isLoading2 = Provider.of<SearchPlacesProvider>(context).isLoading;
    final currentPosition = Provider.of<HomeProvider>(context);

    if (isLoading || isLoading2) return const LoadingPage();
    final place = ModalRoute.of(context)!.settings.arguments as Feature;
    final destination = Provider.of<MapProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          MapView(
            currentPosition: currentPosition,
            feature: place,
            mapProvider: destination,
          ),
          Positioned(
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
