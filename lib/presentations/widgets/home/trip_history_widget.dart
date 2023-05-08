import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../services/services.dart';

class TripHistoryBox extends StatelessWidget {
  final IconData? icon;
  const TripHistoryBox({
    super.key,
    this.icon = Icons.location_on_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return TripHistoryItem(icon: icon, index: index);
      },
    );
  }
}

class TripHistoryItem extends StatelessWidget {
  final IconData? icon;
  final int index;
  const TripHistoryItem({
    super.key,
    this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final searchPlace = Provider.of<SearchPlacesProvider>(context);
    final currentPosition = Provider.of<HomeProvider>(context, listen: false);
    final destination = Provider.of<MapProvider>(context, listen: false);
    return ListTile(
      onTap: () async {
        final navigator = Navigator.of(context);
        await getPolylineByQuery(
          currentPosition: currentPosition,
          destination: destination,
          searchPlace: searchPlace,
        );

        navigator.pushNamed(
          "map",
          arguments: searchPlace.mapboxPlaceResponse!.features[0],
        );
      },
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: const Text("Seguros La Granja IHSS"),
      subtitle: const Text("Instituto Hondureno de Seguridad"),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  Future<void> getPolylineByQuery({
    required SearchPlacesProvider searchPlace,
    required HomeProvider currentPosition,
    required MapProvider destination,
  }) async {
    await searchPlace.getPlacesByQuery(
      query: "Hotel Gualiqueme",
      long: currentPosition.lat!,
      lat: currentPosition.long!,
    );
    await destination.getPolylineStarttoEnd(
      start: LatLng(currentPosition.lat!, currentPosition.long!),
      end: LatLng(
        searchPlace.mapboxPlaceResponse!.features[0].geometry.coordinates[1],
        searchPlace.mapboxPlaceResponse!.features[0].geometry.coordinates[0],
      ),
    );
  }
}
