import 'package:flutter/material.dart';

import 'globals.dart';
import 'utils.dart';

class TextField95 extends StatefulWidget {
  const TextField95({
    Key? key,
    this.controller,
    this.backgroundColor = Flutter95.white,
    this.height = 32,
    this.multiline = false,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController? controller;
  final double height;
  final Color backgroundColor;
  final bool multiline;
  final int maxLines;

  @override
  _TextField95State createState() => _TextField95State();
}

class _TextField95State extends State<TextField95> {
  @override
  Widget build(BuildContext context) {
    return Elevation95(
      type: Elevation95Type.down,
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: Flutter95.white,
        height: widget.height,
        child: Material(
          color: widget.backgroundColor,
          child: TextField(
            controller: widget.controller,
            maxLines: widget.maxLines,
            keyboardType:
                widget.multiline ? TextInputType.multiline : TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
            ),
            cursorColor: Flutter95.black,
            style: Flutter95.textStyle,
          ),
        ),
      ),
    );
  }
}
