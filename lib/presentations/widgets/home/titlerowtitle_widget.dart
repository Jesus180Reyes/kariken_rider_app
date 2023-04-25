import 'package:flutter/material.dart';

class TitleRowHome extends StatelessWidget {
  final String title;
  final String? subtitle;
  const TitleRowHome({
    super.key,
    required this.title,
    this.subtitle = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Text(subtitle!),
        ],
      ),
    );
  }
}
