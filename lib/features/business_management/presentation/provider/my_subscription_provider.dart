import 'package:flutter/material.dart';

class MySubscriptionProvider extends ChangeNotifier {
  bool _isSubscriptionActive = false;
  int? _selectedIndex;

  bool get isSubscriptionActive => _isSubscriptionActive;

  int? get selectedIndex => _selectedIndex;

  void setIsSubscriptionActive() {
    _isSubscriptionActive = true;
    notifyListeners();
  }

  void setSelectedIndex(int? index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
