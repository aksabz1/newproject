import 'package:flutter/material.dart';

class ButtomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeSelectedIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
