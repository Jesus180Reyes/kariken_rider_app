import 'package:flutter/material.dart';

import '../../../infrastructure/models/suggestions.dart';

class SuggestionBox extends StatelessWidget {
  const SuggestionBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: 100,
      child: ListView.builder(
        itemCount: suggestionsData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return SuggestionBoxItem(
            index: index,
            suggestions: suggestionsData[index],
          );
        },
      ),
    );
  }
}

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
