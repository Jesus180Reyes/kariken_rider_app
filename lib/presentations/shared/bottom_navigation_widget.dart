import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/home/bottomnavigation_provider.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<BottomNavigationProvider>(context);
    return BottomNavigationBar(
      currentIndex: currentIndex.currentIndex,
      onTap: (value) => currentIndex.onIndexChange(value),
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: "Actividad",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_sharp),
          label: "Cuenta",
        ),
      ],
    );
  }
}
