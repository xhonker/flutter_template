import 'package:flutter/material.dart';
import 'package:flutter_template/components/index.dart';
import 'package:flutter_template/mixins/page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MixinPage {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSafeScaffold(title: "Home", child: content());
  }

  @override
  Future fetchData() {
    // TODO: api fetch data
  }

  @override
  Future init() async {
    await fetchData();
    await Future.delayed(Duration(seconds: 2));
    loading = false;
    setState(() {});
  }

  @override
  Widget render() {
    return Center(
      child: Text("Home"),
    );
  }
}
