import 'package:flutter/material.dart';

import '../../../domain/entities/models/suggestions.dart';

class SuggestionBoxItem extends StatelessWidget {
  final Suggestions suggestions;
  final int index;
  const SuggestionBoxItem({
    super.key,
    required this.suggestions,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      margin: const EdgeInsets.all(6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width * 0.45,
      child: Text(
        suggestionsData[index].title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
