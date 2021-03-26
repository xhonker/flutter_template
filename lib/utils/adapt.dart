import 'package:flutter/material.dart';

import '../globalConfig.dart';

class Adapt {
  static int _designWidth = GlobalConfig.designWidth;
  static MediaQueryData mediaQuery;
  static double _width;
  static double _height;
  static double _rpx;
  static double _pixeRatio;
  static EdgeInsets _padding;

  static init(BuildContext _) {
    if (mediaQuery == null) {
      mediaQuery = MediaQuery.of(_);
      _width = mediaQuery.size.width;
      _height = mediaQuery.size.height;
      _pixeRatio = mediaQuery.devicePixelRatio;
      _padding = mediaQuery.padding;
      initRpx();
    }
  }

  static initRpx() {
    _rpx = _width / _designWidth;
  }

  static double px(num) {
    if (_rpx == null) {
      initRpx();
    }
    return num * _rpx;
  }

  static double onepx() {
    return 1 / _pixeRatio;
  }

  static double screenW() {
    return _width;
  }

  static double screenH() {
    return _height;
  }

  static EdgeInsets padding() {
    return _padding;
  }
}
