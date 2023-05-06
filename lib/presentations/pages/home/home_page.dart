import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/presentations/shared/shared.dart';

import '../../services/services.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<HomeProvider>(context).isLoading;
    if (isLoading) return const LoadingPage();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              //* Header
              TitleWidget(),

              //* Search
              SearchDestinyWidget(),

              //* Trips History
              TripHistoryBox(),

              // * Map Widget
              MapGoogleWidget(),

              //* Title Suggestions
              TitleRowHome(
                title: 'Sugerencias',
                subtitle: "Ver Todo",
              ),

              //* Suggestions Items
              SuggestionBox(),
            ],
          ),
        ),
      ),
    );
  }
}
