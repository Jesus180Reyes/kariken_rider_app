import 'package:flutter/material.dart';
import 'package:rider_app/domain/entities/models/suggestions.dart';

import '../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* Header
              const TitleWidget(),

              //* Search
              const SearchDestinyWidget(),

              //* Trips History
              // TODO: Fix this to a readable widget
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.location_on),
                    ),
                    title: Text("Seguros La Granja IHSS"),
                    subtitle: Text("Instituto Hondureno de Seguridad"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  );
                },
              ),

              // * Map Widget
              // * TODO: Add a Google Map with customer current location
              Container(
                margin: const EdgeInsets.all(30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 200,
                width: double.infinity,
                child: const Text("MAP WIDGET"),
              ),

              //* Title Suggestions
              const TitleRowHome(
                title: 'Sugerencias',
                subtitle: "Ver Todo",
              ),

              //* Suggestions Items
              // TODO: Fix this to a readable widget
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 100,
                child: ListView.builder(
                  itemCount: suggestionsData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SuggestionBoxItem(
                      index: index,
                      suggestions: suggestionsData[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
