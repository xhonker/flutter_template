import 'package:fluro/fluro.dart';
import 'package:flutter_template/interface/router.dart';
import 'package:flutter_template/pages/home/page.dart';

class HomeRouter extends IRouter {
  static const String root = 'lyitp//win/home';

  @override
  void initRouter(FluroRouter router) {
    router.define(root, handler: Handler(handlerFunc: (_, __) => HomePage()));
  }
}
