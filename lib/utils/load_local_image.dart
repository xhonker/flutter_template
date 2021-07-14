import 'package:flutter/material.dart';

Image loadLocalImage(String name, {String ext = '.png', Color? color, double? width, double? height}) {
  return Image.asset(
    'lib/assets/image/$name$ext',
    width: width ?? double.infinity,
    height: height ?? double.infinity,
    excludeFromSemantics: true,
    gaplessPlayback: true,
    color: color,
  );
}
