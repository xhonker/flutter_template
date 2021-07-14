import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/pages/home/router.dart';
import 'components/index.dart';
import 'event/event_bus.dart';
import 'globalConfig.dart';
import 'utils/index.dart';
import 'package:oktoast/oktoast.dart';

import 'routers.dart';
import 'api/index.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  _AppState() {
    Routers.initRouter();
    ApplicationEvent.event = EventBus();
  }
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    initDio();
  }

  initDio() {
    List<Interceptor> _interceptors = [];
    _interceptors.add(AuthInterceptor());
    const baseUrl = ''; // TODO: api base URL
    configDio(interceptors: _interceptors, baseUrl: baseUrl);
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      radius: 8,
      position: ToastPosition.bottom,
      textStyle: TextStyle(fontSize: 14, color: Colors.white),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: GlobalConfig.theme,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        localeListResolutionCallback: (locales, support) {
          return Locale("zh");
        },
        localeResolutionCallback: (locale, support) {
          return Locale("zh");
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [const Locale("zh", 'CH')],
        onGenerateRoute: Routers.route.generator,
        home: AppHome(),
      ),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      Routers.jump(context, HomeRouter.root, clearStack: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    Adapt.init(context);
    return Scaffold(
      body: ComponentLoading(),
    );
  }
}
