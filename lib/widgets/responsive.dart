import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({Key key, this.mobile, this.desktop}) : super(key: key);
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth > 1024 ? desktop : mobile;
      },
    );
  }
}
