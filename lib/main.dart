import 'package:flutter/material.dart' show runApp, Colors;
import 'package:flutter/services.dart';
import 'app.dart';

void main() {
  runApp(App());
  SystemUiOverlayStyle style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(style);
}
