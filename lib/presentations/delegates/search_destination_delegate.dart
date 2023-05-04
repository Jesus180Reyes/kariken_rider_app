import 'package:easy_debounce/easy_debounce.dart';
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
    return FutureBuilder(
      future: _getPlacesByQuery(
        lat: currentPosition.lat!,
        long: currentPosition.long!,
        context: context,
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (places.isLoading) return const LoadingPage();
        if (places.mapboxPlaceResponse!.features.isEmpty) {
          return NoDataWidget(title: "No hay lugar con $query");
        }
        return ListView.builder(
          itemCount: places.mapboxPlaceResponse!.features.length,
          itemBuilder: (BuildContext context, int index) {
            return _PlacesWidget(places: places, index: index);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final currentPosition = Provider.of<HomeProvider>(context, listen: false);
    final places = Provider.of<SearchPlacesProvider>(context, listen: true);

    if (query.isEmpty) return addLocationManually();

    return FutureBuilder(
      future: _getPlacesByQuery(
        lat: currentPosition.lat!,
        long: currentPosition.long!,
        context: context,
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (places.isLoading) return const LoadingPage();

        return ListView.builder(
          itemCount: places.mapboxPlaceResponse!.features.length,
          itemBuilder: (BuildContext context, int index) {
            return _PlacesWidget(places: places, index: index);
          },
        );
      },
    );
  }

  Future _getPlacesByQuery(
      {required double lat, required double long, required context}) async {
    final getPlaces = Provider.of<SearchPlacesProvider>(context, listen: false);

    EasyDebounce.debounce(
      'search_places_debounce',
      const Duration(milliseconds: 1500),
      () async {
        await getPlaces.getPlacesByQuery(
          query: query,
          lat: lat,
          long: long,
        );
      },
    );
  }

  Widget addLocationManually() {
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

class _PlacesWidget extends StatelessWidget {
  final int index;
  const _PlacesWidget({
    required this.places,
    required this.index,
  });

  final SearchPlacesProvider places;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            "map",
            arguments: places.mapboxPlaceResponse!.features[index],
          );
        },
        leading: const CircleAvatar(
          child: Icon(
            Icons.location_on_rounded,
            color: Colors.blueGrey,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        title: Text(places.mapboxPlaceResponse!.features[index].text),
        subtitle: Text(places.mapboxPlaceResponse!.features[index].placeNameEs),
      ),
    );
  }
}
