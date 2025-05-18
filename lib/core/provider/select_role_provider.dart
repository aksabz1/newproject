import 'package:flutter/material.dart';

class SelectRoleProvider extends ChangeNotifier {
  //SelectedIndex shows role of the user:
  //Index 0 ==> the user is beauticiation.
  //index 1 ==> the user is salon owner.

  int? _selectedIndex;
  final roles = {
    0: 'آرایشگر هستم',
    1: 'سالن دار هستم',
  };
  int? get selectedIndex => _selectedIndex;

  set selectedIndex(int? index) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
