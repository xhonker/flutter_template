import 'package:flutter/material.dart';
import 'package:flutter_template/components/index.dart';

abstract class BaseListPage {
  /// 初始化数据
  Future init();

  /// 获取列表
  Future fetchList();

  /// 渲染
  Widget render();
}

mixin ListPage<T extends StatefulWidget> on State<T> implements BaseListPage {
  int page = 1;
  int pageSize = 20;
  bool loading = true;
  bool loadingData = false;
  bool isMore = true;
  ScrollController scrollController;
  List list = [];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      bool isBottom = scrollController.offset == scrollController.position.maxScrollExtent;
      if (isBottom && isMore && !loadingData) {
        loadingData = true;
        ++page;
        setState(() {});
        fetchList();
      }
    });
    init();
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }

  Future handlerRefresh() async {
    resetData();
    await fetchList();
  }

  void resetData() {
    list = [];
    page = 1;
    loadingData = false;
    isMore = true;
    setState(() {});
  }

  Widget handlerItem({int index, Type type}) {
    switch (T) {
      case String: // 根据泛型 渲染list
        return Container();
        break;
      default:
        return Container();
    }
  }

  Widget renderList<T>() {
    var child = ListView.separated(
      itemCount: list.isEmpty ? 0 : list.length + 1,
      physics: AlwaysScrollableScrollPhysics(),
      controller: scrollController,
      padding: const EdgeInsets.all(12),
      separatorBuilder: (_, index) => const SizedBox(height: 10),
      itemBuilder: (_, index) => handlerItem(index: index, type: T),
    );
    return RefreshIndicator(
      onRefresh: handlerRefresh,
      child: child,
    );
  }

  Widget content() => loading ? ComponentLoading() : render();
}
