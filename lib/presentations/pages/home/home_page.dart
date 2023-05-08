import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/presentations/pages/pages.dart';
import 'package:rider_app/presentations/pages/profile/trips_history_page.dart';
import 'package:rider_app/presentations/services/home/bottomnavigation_provider.dart';
import 'package:rider_app/presentations/shared/shared.dart';

import '../../services/services.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pages = [_HomeWidget(), TripHistoryPage(), ProfilePage()];
    final isLoading = Provider.of<HomeProvider>(context).isLoading;
    final currentIndex =
        Provider.of<BottomNavigationProvider>(context).currentIndex;
    if (isLoading) return const LoadingPage();
    return Scaffold(
      bottomNavigationBar: const CustomButtomNavigationBar(),
      body: pages[currentIndex],
    );
  }
}

class _HomeWidget extends StatelessWidget {
  const _HomeWidget();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
