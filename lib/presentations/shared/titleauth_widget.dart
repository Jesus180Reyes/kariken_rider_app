import 'package:flutter/material.dart';

class TitleAuthWidget extends StatelessWidget {
  final String title;
  const TitleAuthWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
