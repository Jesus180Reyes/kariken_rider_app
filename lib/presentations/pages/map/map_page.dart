import 'package:flutter/material.dart';
import 'package:rider_app/presentations/widgets/widgets.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: MapGoogleWidget(height: size.height, margin: 0),
    );
  }
}
