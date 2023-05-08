import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int currentIndex = 0;

  onIndexChange(value) {
    currentIndex = value;
    notifyListeners();
  }
}
