import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'button95.dart';
import 'globals.dart';

class Scaffold95 extends StatelessWidget {
  const Scaffold95({
    @required this.title,
    @required this.body,
    Key key,
  }) : super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Flutter95.elevatedDecorationOutside,
      child: Container(
        decoration: Flutter95.elevatedDecoration,
        child: Column(
          children: <Widget>[
            WindowHeader95(title: title),
            const SizedBox(height: 4),
            body,
          ],
        ),
      ),
    );
  }
}

class WindowHeader95 extends StatelessWidget {
  const WindowHeader95({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          height: 33,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Flutter95.headerDark,
                Flutter95.headerLight,
              ],
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Text(
                title,
                style: Flutter95.headerTextStyle,
              ),
              Spacer(),
              CloseButton95(),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class CloseButton95 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Button95(
      padding: EdgeInsets.zero,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.close,
        size: 20,
      ),
    );
  }
}
