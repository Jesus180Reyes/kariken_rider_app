import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  final String svgPath;
  const SvgWidget({
    super.key,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: SvgPicture.asset(
        svgPath,
      ),
    );
  }
}
