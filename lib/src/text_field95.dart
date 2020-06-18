import 'package:flutter/material.dart';
import 'package:flutter95/src/utils.dart';

import 'globals.dart';

class TextField95 extends StatefulWidget {
  // TODO: Expose more properties from TextField
  const TextField95({
    Key key,
    this.controller,
  }) : super(key: key);

  final TextEditingController controller;

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
        height: 32,
        child: Material(
          color: Flutter95.white,
          child: TextField(
            controller: widget.controller,
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
