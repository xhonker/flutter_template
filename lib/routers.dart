import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/pages/home/router.dart';

import 'interface/router.dart';

class Routers {
  static FluroRouter route = FluroRouter();
  static List<IRouter> _routers = [];

  static void initRouter() {
    _routers.add(HomeRouter());
    _routers.forEach((r) => r.initRouter(route));
  }

  static jump(BuildContext _, path, {bool clearStack = false, TransitionType transition = TransitionType.inFromRight}) {
    Routers.route.navigateTo(_, path, clearStack: clearStack, transition: transition);
  }
}
