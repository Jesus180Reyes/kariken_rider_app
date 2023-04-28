import 'package:flutter/material.dart';

class TripHistoryBox extends StatelessWidget {
  const TripHistoryBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return const TripHistoryItem();
      },
    );
  }
}

class TripHistoryItem extends StatelessWidget {
  const TripHistoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.location_on),
      ),
      title: Text("Seguros La Granja IHSS"),
      subtitle: Text("Instituto Hondureno de Seguridad"),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
