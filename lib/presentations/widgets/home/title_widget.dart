import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/config/helpers/custom_greetings.dart';

import '../../services/home/home_provider.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<HomeProvider>(context);
    final greetings = customGreetings();
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            "$greetings Luis, ¿A donde quieres ir?",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            currentPosition.addressResults["plus_code"]["compound_code"],
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
