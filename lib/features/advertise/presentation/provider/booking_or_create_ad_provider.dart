import 'package:flutter/material.dart';

class BookingOrCreateAdProvider extends ChangeNotifier {
  int? _selectedIndex;
  final labels = {
    0: 'ایجاد آگهی',
    1: 'رزرو صندلی',
  };

  int? get selectedIndex => _selectedIndex;

  set selectedIndex(int? index) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
