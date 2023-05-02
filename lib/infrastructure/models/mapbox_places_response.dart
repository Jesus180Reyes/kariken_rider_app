// To parse this JSON data, do
//
//     final mapboxPlaceResponse = mapboxPlaceResponseFromJson(jsonString);

// ignore_for_file: unused_import

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'dart:convert';

MapboxPlaceResponse mapboxPlaceResponseFromJson(String str) =>
    MapboxPlaceResponse.fromJson(json.decode(str));

String mapboxPlaceResponseToJson(MapboxPlaceResponse data) =>
    json.encode(data.toJson());

class MapboxPlaceResponse {
  final String type;
  final List<String> query;
  final List<Feature> features;
  final String attribution;

  MapboxPlaceResponse({
    required this.type,
    required this.query,
    required this.features,
    required this.attribution,
  });

  factory MapboxPlaceResponse.fromJson(Map<String, dynamic> json) =>
      MapboxPlaceResponse(
        type: json["type"],
        query: List<String>.from(json["query"].map((x) => x)),
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
      };
}

class Feature {
  final String id;
  final String type;
  final List<String> placeType;
  final int relevance;
  final Properties properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String placeName;
  final List<double> center;
  final Geometry geometry;
  final List<Context> context;
  final dynamic matchingText;
  final dynamic matchingPlaceName;

  Feature({
    required this.id,
    required this.type,
    required this.placeType,
    required this.relevance,
    required this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    required this.placeName,
    required this.center,
    required this.geometry,
    required this.context,
    required this.matchingText,
    required this.matchingPlaceName,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        relevance: json["relevance"],
        properties: Properties.fromJson(json["properties"]),
        textEs: json["text_es"],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x?.toDouble())),
        geometry: Geometry.fromJson(json["geometry"]),
        context:
            List<Context>.from(json["context"].map((x) => Context.fromJson(x))),
        matchingText: json["matching_text"],
        matchingPlaceName: json["matching_place_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance,
        "properties": properties.toJson(),
        "text_es": textEs,
        "place_name_es": placeNameEs,
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toJson(),
        "context": List<dynamic>.from(context.map((x) => x.toJson())),
        "matching_text": matchingText,
        "matching_place_name": matchingPlaceName,
      };
}

class Context {
  final String id;
  final dynamic wikidata;
  final String mapboxId;
  final String textEs;
  final dynamic languageEs;
  final String text;
  final dynamic language;
  final dynamic shortCode;

  Context({
    required this.id,
    required this.wikidata,
    required this.mapboxId,
    required this.textEs,
    required this.languageEs,
    required this.text,
    required this.language,
    required this.shortCode,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: json["id"],
        wikidata: json["wikidata"],
        mapboxId: json["mapbox_id"],
        textEs: json["text_es"],
        languageEs: json["language_es"],
        text: json["text"],
        language: json["language"],
        shortCode: json["short_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wikidata": wikidata,
        "mapbox_id": mapboxId,
        "text_es": textEs,
        "language_es": languageEs,
        "text": text,
        "language": language,
        "short_code": shortCode,
      };
}

class Geometry {
  final List<double> coordinates;
  final String type;

  Geometry({
    required this.coordinates,
    required this.type,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}

class Properties {
  final dynamic foursquare;
  final dynamic landmark;
  final dynamic address;
  final dynamic category;
  final dynamic maki;

  Properties({
    required this.foursquare,
    required this.landmark,
    required this.address,
    required this.category,
    required this.maki,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        foursquare: json["foursquare"],
        landmark: json["landmark"],
        address: json["address"],
        category: json["category"],
        maki: json["maki"],
      );

  Map<String, dynamic> toJson() => {
        "foursquare": foursquare,
        "landmark": landmark,
        "address": address,
        "category": category,
        "maki": maki,
      };
}
