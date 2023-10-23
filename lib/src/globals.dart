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
  static const white = Color(0xFFFFFFFF);
  static const black = Color.fromRGBO(5, 6, 8, 1);
  static const tooltipBackground = Color(0xFFFFFFE3);

  static Color get background => grays[1];

  static const _elevationWidth = 1.5;

  static final elevatedDecoration = BoxDecoration(
    color: background,
    border: Border(
      top: BorderSide(color: Flutter95.grays[0], width: _elevationWidth),
      left: BorderSide(color: Flutter95.grays[0], width: _elevationWidth),
      bottom: BorderSide(color: Flutter95.grays[2], width: _elevationWidth),
      right: BorderSide(color: Flutter95.grays[2], width: _elevationWidth),
    ),
  );

  static final elevatedDecorationOutside = BoxDecoration(
    color: background,
    border: Border(
      top: const BorderSide(color: Flutter95.white, width: _elevationWidth),
      left: const BorderSide(color: Flutter95.white, width: _elevationWidth),
      bottom: BorderSide(color: Flutter95.grays[3], width: _elevationWidth),
      right: BorderSide(color: Flutter95.grays[3], width: _elevationWidth),
    ),
  );

  static final pressedDecoration = BoxDecoration(
    color: background,
    border: Border(
      top: BorderSide(color: Flutter95.grays[2], width: _elevationWidth),
      left: BorderSide(color: Flutter95.grays[2], width: _elevationWidth),
      bottom: BorderSide(color: Flutter95.grays[0], width: _elevationWidth),
      right: BorderSide(color: Flutter95.grays[0], width: _elevationWidth),
    ),
  );

  static final pressedDecorationOutside = BoxDecoration(
    color: background,
    border: Border(
      top: BorderSide(color: Flutter95.grays[3], width: _elevationWidth),
      left: BorderSide(color: Flutter95.grays[3], width: _elevationWidth),
      bottom: const BorderSide(color: Flutter95.white, width: _elevationWidth),
      right: const BorderSide(color: Flutter95.white, width: _elevationWidth),
    ),
  );

  static final invisibleBorder = BoxDecoration(
    color: background,
    border: Border.all(color: background),
  );

  static const headerTextStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.bold,
  );

  static const textStyle = TextStyle(
    color: Flutter95.black,
    fontSize: 14,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
  );

  static final disabledTextStyle = TextStyle(
    color: Flutter95.grays[3],
    fontSize: 14,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal,
    shadows: [
      Shadow(
        color: Flutter95.grays[0],
        offset: const Offset(1, 1),
      ),
    ],
  );
}
