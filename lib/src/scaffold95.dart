import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
      decoration: Flutter95.elevatedDecoration,
      child: Column(
        children: <Widget>[
          _windowHeader(),
          body,
        ],
      ),
    );
  }

  SafeArea _windowHeader() {
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
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CloseButton(),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Flutter95.elevatedDecoration,
      child: Icon(
        Icons.close,
        size: 20,
      ),
    );
  }
}
