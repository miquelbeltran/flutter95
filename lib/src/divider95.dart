import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

class Divider95 extends StatelessWidget {
  final double height;
  final double indent;
  final double endIndent;

  const Divider95({
    super.key,
    this.height = 16.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Container(
          height: 3,
          margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
          decoration: Flutter95.pressedDecorationOutside,
        ),
      ),
    );
  }
}
