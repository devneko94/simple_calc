import 'package:flutter/widgets.dart';

enum CalcMode {
  None,
  Add,
  Sub,
  Times,
  Divide,
}

class SizeConfig {
  static MediaQueryData _mediaQueryData = MediaQueryData();
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockSizeHorizontal = 0.0;
  static double blockSizeVertical = 0.0;
  static double safeAreaLeft = 0.0;
  static double safeAreaTop = 0.0;
  static double safeAreaRight = 0.0;
  static double safeAreaBottom = 0.0;
  static double safeAreaHorizontal = 0.0;
  static double safeAreaVertical = 0.0;
  static double safeBlockHorizontal = 0.0;
  static double safeBlockVertical = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    safeAreaLeft = _mediaQueryData.padding.left;
    safeAreaTop = _mediaQueryData.padding.top;
    safeAreaRight = _mediaQueryData.padding.right;
    safeAreaBottom = _mediaQueryData.padding.bottom;
    safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical) / 100;
  }
}
