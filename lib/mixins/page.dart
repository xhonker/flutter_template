import 'package:flutter/material.dart';
import 'package:flutter_template/components/index.dart';

abstract class SinglePage {
  /// 初始化
  Future init();

  /// 获取页面所需数据
  Future fetchData();

  /// 渲染
  Widget render();
}

mixin MixinPage<T extends StatefulWidget> on State<T> implements SinglePage {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    init();
  }

  Widget content() => loading ? ComponentLoading() : render();
}
