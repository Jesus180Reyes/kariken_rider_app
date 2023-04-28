import 'package:flutter/material.dart';
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
    return const Text("BuildResutls");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) return const CircularProgressIndicator.adaptive();
    return Column(
      children: [
        ListTile(
          onTap: () => Navigator.pushNamed(context, "map"),
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
