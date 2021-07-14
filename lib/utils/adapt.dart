import 'package:flutter/material.dart';

class Adapt {
  static late int _designWidth;
  static late MediaQueryData mediaQuery;
  static late double _width;
  static late double _height;
  static late double _rpx;
  static late double _pixelRatio;
  static late EdgeInsets _padding;

  static init(BuildContext _, {int designWidth = 375}) {
    _designWidth = designWidth;
    mediaQuery = MediaQuery.of(_);
    _width = mediaQuery.size.width;
    _height = mediaQuery.size.height;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _padding = mediaQuery.padding;
    initRpx();
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
    return 1 / _pixelRatio;
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
