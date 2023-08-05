/* -- App Sizing -- */

//App default Sizing
import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  static double tDefaultSize = 30.0;
  static double tSplashContainerSize = 30.0;
  static double tButtonHeight = 15.0;
  static double tFormHeight = 30.0;
  static double small = 15.0;
  static double small_medium = 17.5;
  static double medium = 20.0;
  static double big = 30.0;
  static double very_big = 30.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight!;
  // 896 is the layout height that designer use
  // or you can say iPhone 11
  return (inputHeight / 896.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth!;
  // 414 is the layout width that designer use
  return (inputWidth / 414.0) * screenWidth;
}
