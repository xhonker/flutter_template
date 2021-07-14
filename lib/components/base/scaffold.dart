import 'package:flutter/material.dart';

class BaseSafeScaffold extends StatelessWidget {
  const BaseSafeScaffold({
    Key? key,
    required this.child,
    this.title,
    this.backgroundColor,
    this.iconTheme,
    this.brightness = Brightness.light,
    this.flexibleSpace,
    this.actions,
    this.bottom,
    this.appBarBgColor,
  }) : super(key: key);

  final dynamic title;
  final Widget child;
  final Color? backgroundColor;
  final Color? iconTheme;
  final Color? appBarBgColor;
  final Brightness brightness;
  final Widget? flexibleSpace;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: Visibility(
          visible: Navigator.of(context).canPop(),
          child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.of(context).pop()),
        ),
        title: title != null
            ? title is Widget
                ? title
                : Text(title)
            : null,
        centerTitle: true,
        iconTheme: IconThemeData(color: iconTheme),
        elevation: 0,
        actions: actions,
        bottom: bottom,
        brightness: brightness,
        flexibleSpace: flexibleSpace,
        backgroundColor: appBarBgColor,
      ),
      body: SafeArea(child: child),
    );
  }
}
