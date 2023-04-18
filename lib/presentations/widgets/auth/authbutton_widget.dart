import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  final String title;
  final Function? onTap;
  const AuthButtonWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: size.width - 100,
      height: 50,
      child: FilledButton.tonal(
        onPressed: () {
          if (onTap == null) return;
          onTap!();
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
