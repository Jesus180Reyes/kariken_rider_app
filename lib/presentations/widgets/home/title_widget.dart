import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/home/home_provider.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<HomeProvider>(context);
    return Column(
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 15),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Buen dia Luis, ¿A donde quieres ir?",
            style: TextStyle(
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
            "Latitude ${currentPosition.lat} Longitude ${currentPosition.long}",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
