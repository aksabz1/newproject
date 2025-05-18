import 'package:flutter/material.dart';

class ServiceChip {
  final String name;
  bool isSelected;
  ServiceChip({required this.name, this.isSelected = false});
}

class SelectiveServiceProvider extends ChangeNotifier {
  List<ServiceChip> _chips = [];
  SelectiveServiceProvider(List<ServiceChip> chips) {
    _chips.addAll(chips);
  }

  List<ServiceChip> get chips => _chips;

  void setChips(List<ServiceChip> chips) {
    _chips = chips;
    notifyListeners();
  }

  void selectChip(int index, bool selected) {
    _chips[index].isSelected = selected;
    notifyListeners();
  }
}
