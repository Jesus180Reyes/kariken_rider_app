import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:rider_app/infrastructure/models/mapbox_places_response.dart';

class SearchPlacesProvider extends ChangeNotifier {
  bool isLoading = true;
  MapboxPlaceResponse? mapboxPlaceResponse;

  Future<void> getPlacesByQuery(
      {required String query,
      required double long,
      required double lat}) async {
    final apiKey = dotenv.env["MAPBOX_API_KEY"];
    final url = Uri.parse(
        "https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?country=hn&proximity=$long%2C$lat&language=es&access_token=$apiKey");
    final resp = await http.get(url);
    final data = mapboxPlaceResponseFromJson(resp.body);
    mapboxPlaceResponse = data;
    isLoading = false;
    notifyListeners();
  }
}
