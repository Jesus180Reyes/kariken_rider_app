import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int currentIndex = 0;

  onIndexChange(value) {
    if (value == currentIndex) return;
    currentIndex = value;
    notifyListeners();
  }
}
