import 'package:flutter/material.dart';

class TripHistoryBox extends StatelessWidget {
  final IconData? icon;
  const TripHistoryBox({
    super.key,
    this.icon = Icons.location_on_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return TripHistoryItem(icon: icon);
      },
    );
  }
}

class TripHistoryItem extends StatelessWidget {
  final IconData? icon;
  const TripHistoryItem({
    super.key,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: const Text("Seguros La Granja IHSS"),
      subtitle: const Text("Instituto Hondureno de Seguridad"),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
