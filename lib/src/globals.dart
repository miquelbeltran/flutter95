import 'dart:ui';

import 'package:flutter/widgets.dart';

class Flutter95 {
  static const grays = [
    Color(0xFFe6e6e6),
    Color(0xFFd2d2d2),
    Color(0xFFc3c7cb),
    Color(0xFF868a8e),
  ];
  static const primary = Color(0xFF000e7a);
  static const secondary = Color(0xFF55aaaa);
  static const headerDark = Color(0xFF000080);
  static const headerLight = Color(0xFF1034a6);

  static Color get background => grays[2];

  static final elevatedDecoration = BoxDecoration(
    color: background,
    border: Border(
      top: BorderSide(color: Flutter95.grays[1], width: 2),
      left: BorderSide(color: Flutter95.grays[1], width: 2),
      bottom: BorderSide(color: Flutter95.grays[3], width: 2),
      right: BorderSide(color: Flutter95.grays[3], width: 2),
    ),
  );
}
