import 'package:flutter/material.dart';

class ComponentLoading extends StatelessWidget {
  const ComponentLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
      ),
    );
  }
}
