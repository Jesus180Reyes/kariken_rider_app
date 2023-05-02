import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/presentations/services/home/home_provider.dart';
import 'package:rider_app/presentations/services/search/search_place_provider.dart';
import 'package:rider_app/presentations/shared/shared.dart';
import 'package:rider_app/presentations/widgets/widgets.dart';

class SearchDestinationDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => "Buscar Destino";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.close_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(
        context,
        null,
      ),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final currentPosition = Provider.of<HomeProvider>(context, listen: false);
    final places = Provider.of<SearchPlacesProvider>(context, listen: true);
    final getPlaces = Provider.of<SearchPlacesProvider>(context, listen: false);
    return FutureBuilder(
      future: getPlaces.getPlacesByQuery(
          query: query, lat: currentPosition.lat!, long: currentPosition.long!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (places.isLoading) return const LoadingPage();
        if (places.mapboxPlaceResponse!.features.isEmpty) {
          return Text("No hay datos con el la ubicacion $query");
        }
        return ListView.builder(
          itemCount: places.mapboxPlaceResponse!.features.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(3),
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(
                    Icons.location_on_rounded,
                    color: Colors.blueGrey,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                title: Text(places.mapboxPlaceResponse!.features[index].text),
                subtitle: Text(
                    places.mapboxPlaceResponse!.features[index].placeNameEs),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) return const CircularProgressIndicator.adaptive();
    return Column(
      children: [
        ListTile(
          onTap: () {},
          leading: const CircleAvatar(
            child: Icon(Icons.location_on_rounded),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          title: const Text("Agrega tu destino manualmente"),
          subtitle: const Text("Podras agregar tu destino manualmente"),
        ),
        const TripHistoryBox(icon: Icons.history_rounded),
      ],
    );
  }
}
