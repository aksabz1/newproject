import 'package:flutter/material.dart';
import 'package:salons/core/utils/prefs_operator.dart';
import 'package:salons/locator.dart';

class LoginProvider extends ChangeNotifier {
  final PrefsOperator _prefsOperator = locator.get<PrefsOperator>(); bool _isUserLoggedIn = false;
  bool get isUserLoggedIn => _isUserLoggedIn;
  String _phoneNumber = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isAccept = false;

  String get phoneNumber => _phoneNumber;
  GlobalKey<FormState> get formKey => _formKey;
  void setPhoneNumber(String phoneNumber) {
    if (phoneNumber.length <= 11) {
      _phoneNumber = phoneNumber;
      notifyListeners();
    }
  }

  void setisAccept() {
    isAccept = !isAccept;
    notifyListeners();
  }
   Future<void> login() async {
    _isUserLoggedIn = true;
    await _prefsOperator.setLoggedIn(true);
    notifyListeners();
  }
}
