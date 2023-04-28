import 'package:flutter/material.dart';

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
              const TripHistoryBox(),

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
              const SuggestionBox(),
            ],
          ),
        ),
      ),
    );
  }
}
