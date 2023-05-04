import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  const NoDataWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
