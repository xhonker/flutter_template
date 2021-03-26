import 'package:flutter/material.dart';

class ComponentKeepAlive extends StatefulWidget {
  ComponentKeepAlive({Key key, @required this.child}) : super(key: key);
  final Widget child;
  @override
  _ComponentKeepAliveState createState() => _ComponentKeepAliveState();
}

class _ComponentKeepAliveState extends State<ComponentKeepAlive> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
