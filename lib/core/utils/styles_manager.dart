import 'package:flutter/material.dart';
import 'package:salons/core/utils/color_manager.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}
// light text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}
// bold text style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

TextStyle getBoldStyle14(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

TextStyle getBoldStyle16(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}

BoxDecoration borderedBox() {
  return BoxDecoration(
      color: ColorManager.darkGrey,
      border: Border.all(
        color: ColorManager.transparent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(4)));
}

BoxDecoration borderedBlueBox() {
  return BoxDecoration(
      color: ColorManager.blue,
      border: Border.all(
        color: ColorManager.transparent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(4)));
}

BoxDecoration borderedGreyBox() {
  return BoxDecoration(
      color: ColorManager.grey,
      border: Border.all(
        color: ColorManager.transparent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(4)));
}

BoxDecoration borderedLightGreyBox() {
  return BoxDecoration(
      color: ColorManager.highLightGrey,
      border: Border.all(
        color: ColorManager.transparent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(4)));
}

BoxDecoration borderedperpelBox() {
  return BoxDecoration(
      color: ColorManager.perpel,
      border: Border.all(
        color: ColorManager.transparent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(4)));
}

BoxDecoration transparentGreyInputBox() {
  return BoxDecoration(
      color: ColorManager.transparent,
      border: Border.all(
        color: ColorManager.transparent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}

BoxDecoration borderBottomBox() {
  return const BoxDecoration(
      color: ColorManager.transparent,
      border: Border(
        top: BorderSide(width: 1.0, color: Colors.transparent),
        bottom: BorderSide(width: 1.0, color: Colors.grey),
        left: BorderSide(width: 1.0, color: Colors.transparent),
        right: BorderSide(width: 1.0, color: Colors.transparent),
      ));
      // ,borderRadius: const BorderRadius.all(Radius.circular(0)));
}

BoxDecoration darkBorderBox() {
  return BoxDecoration(
      color: ColorManager.darkerGrey,
      border: Border.all(
        color: ColorManager.darkerGrey.withOpacity(.5),
        // width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}

BoxDecoration greenBorderBox() {
  return BoxDecoration(
      color: ColorManager.green,
      border: Border.all(
        color: ColorManager.green,
        // width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}

BoxDecoration deepBlueBox() {
  return BoxDecoration(
      color: ColorManager.grey,
      border: Border.all(
        color: ColorManager.grey,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}

BoxDecoration redBox() {
  return BoxDecoration(
      color: ColorManager.grey,
      border: Border.all(
        color: ColorManager.grey,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}

BoxDecoration greyBox() {
  return BoxDecoration(
      color: ColorManager.grey,
      border: Border.all(
        color: ColorManager.grey,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}

BoxDecoration perpelBox() {
  return BoxDecoration(
      color: ColorManager.perpel,
      border: Border.all(
        color: ColorManager.perpel,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}

BoxDecoration greyBorderedBox() {
  return BoxDecoration(
      color: ColorManager.grey,
      border: Border.all(
        color: ColorManager.grey,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}
BoxDecoration highLightGreyBorderedBox() {
  return BoxDecoration(
      color: ColorManager.highLightGrey,
      border: Border.all(
        color: ColorManager.highLightGrey,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(20)));
}

BoxDecoration yellowBorderedBox() {
  return BoxDecoration(
      color: ColorManager.darkGrey,
      border: Border.all(
        color: ColorManager.transparent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}

BoxDecoration transparentBorderedBox() {
  return BoxDecoration(
      color: Colors.transparent,
      border: Border.all(
        color: ColorManager.grey.withOpacity(0.84),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(3)));
}

BoxDecoration transparentBox() {
  return BoxDecoration(
      color: Colors.transparent,
      border: Border.all(
        color: ColorManager.transparent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(3)));
}

BoxDecoration yellowdBox() {
  return const BoxDecoration(
      color: ColorManager.pairColor,
      borderRadius: BorderRadius.all(Radius.circular(3)));
}

BoxDecoration blueBox() {
  return const BoxDecoration(
      color: ColorManager.grey,
      borderRadius: BorderRadius.all(Radius.circular(3)));
}

BoxDecoration circleBox() {
  return BoxDecoration(
      color: ColorManager.grey,
      border: Border.all(
        color: ColorManager.grey,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(450)));
}

BoxDecoration yellowCircleBox() {
  return BoxDecoration(
      color: ColorManager.pairColor,
      border: Border.all(
        color: ColorManager.pairColor,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(450)));
}

BoxDecoration darkYellowCircleBox() {
  return BoxDecoration(
      color: ColorManager.grey,
      border: Border.all(
        color: ColorManager.grey,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(450)));
}

BoxDecoration darkCircleBox() {
  return BoxDecoration(
      color: ColorManager.grey,
      border: Border.all(
        color: ColorManager.grey,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(450)));
}

BoxDecoration blurCircleBox() {
  return BoxDecoration(
      color: ColorManager.grey.withOpacity(0.1),
      border: Border.all(
        color: ColorManager.grey.withOpacity(0.1),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(450)));
}

BoxDecoration filledCircleBox() {
  return BoxDecoration(
      color: ColorManager.grey.withOpacity(0.7),
      border: Border.all(
        color: ColorManager.grey.withOpacity(0.7),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(450)));
}

BoxDecoration lightBorderedBox() {
  return BoxDecoration(
      color: ColorManager.grey.withOpacity(.3),
      borderRadius: const BorderRadius.all(Radius.circular(5)));
}

BoxDecoration blueBorderedBox() {
  return const BoxDecoration(
      color: ColorManager.grey,
      // border: Border.all(
      //   color: greyInput,
      // ),
      borderRadius: BorderRadius.all(Radius.circular(5)));
}
