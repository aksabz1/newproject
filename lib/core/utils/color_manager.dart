import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryOpacity70 = const Color.fromARGB(154, 23, 43, 230);
  static const primary = Color.fromRGBO(217,217,217,0.5);
  // static const primary = Color.fromARGB(204, 23, 43, 230);
  static const red = Color.fromRGBO(237, 33, 36, .8);
  static const blue = Color.fromRGBO(9, 92, 174, .8);
  static const green = Color.fromRGBO(71, 182, 97, 1);
  static const highLightGrey = Color.fromARGB(255, 198, 199, 198);
  static const lightGrey = Color.fromARGB(255, 171, 173, 171);
  static const lightGreyOpacity70 = Color.fromARGB(155, 171, 173, 171);
  static const grey = Color.fromARGB(255, 119, 119, 119);
  static const darkGrey = Color.fromARGB(255, 84, 85, 84);
  static const darkerGrey = Color.fromARGB(255, 63, 63, 63);
  static const darkPrimary = Color.fromARGB(255, 9, 2, 71);
  static const pairColor = Color.fromARGB(220, 248, 191, 3);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const black = Color.fromARGB(255, 0, 0, 0);
  static const error = Color.fromARGB(255, 155, 1, 1);
  static const transparent = Colors.transparent;
  static const perpel = Color.fromRGBO(151, 71, 255, 0.73);
  

  //dark theme
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; //opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
