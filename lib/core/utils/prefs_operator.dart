import 'package:salons/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsOperator {
  late SharedPreferences sharedPreferences;
  PrefsOperator() {
    sharedPreferences = locator<SharedPreferences>();
  }
  static const _keyIsUserLoggedIn = 'isUserLoggedIn';
  static const _keyOnboardingSeen = 'onboardingSeen';
  static const _keyShowCaseSeen = 'onboardingSeen';

  Future<void> setLoggedIn(bool value) async {
    await sharedPreferences.setBool(_keyIsUserLoggedIn, value);
  }

  bool isUserLoggedIn() {
    return sharedPreferences.getBool(_keyIsUserLoggedIn) ?? false;
  }

  Future<void> setOnboardingSeen(bool value) async {
    await sharedPreferences.setBool(_keyOnboardingSeen, value);
  }

  bool isOnboardingSeen() {
    return sharedPreferences.getBool(_keyOnboardingSeen) ?? false;
  }

  Future<void> setShowCaseSeen(bool value) async {
    await sharedPreferences.setBool(_keyShowCaseSeen, value);
  }

  bool isShowCaseWasShown() {
    return sharedPreferences.getBool(_keyShowCaseSeen) ?? false;
  }
}
