import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  CustomLoading();

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
