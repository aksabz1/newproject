import 'package:flutter/material.dart';

class SalonFormValidationProvider extends ChangeNotifier {
  final GlobalKey<FormState> _salonNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _salonPhoneKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _seatPriceKey = GlobalKey<FormState>();
  GlobalKey<FormState> get salonNameKey => _salonNameKey;
  GlobalKey<FormState> get salonPhoneKey => _salonPhoneKey;
  GlobalKey<FormState> get seatPriceKey => _seatPriceKey;
}
