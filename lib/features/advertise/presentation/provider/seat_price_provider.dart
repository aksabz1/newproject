import 'package:flutter/material.dart';

class SeatPriceProvider extends ChangeNotifier {
  String? _price;
  String? get price => _price;
  TextEditingController priceController = TextEditingController();
 void changePriceValue(String price) {
    _price = price;
    notifyListeners();
  }
}
