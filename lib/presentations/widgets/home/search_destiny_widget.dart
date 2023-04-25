import 'package:flutter/material.dart';

class SearchDestinyWidget extends StatelessWidget {
  const SearchDestinyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.all(15),
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0XFFE3E3E3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Icon(Icons.search_rounded, size: 32),
          SizedBox(width: 10),
          Text(
            "¿A donde vamos Jesus?",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
