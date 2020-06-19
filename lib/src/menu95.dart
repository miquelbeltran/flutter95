import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'globals.dart';

Future<T> showMenu95<T>(
  BuildContext context,
  RelativeRect position,
  List<MenuItem95> items,
) async {
  final List<PopupMenuEntry<T>> entries = items.map((item) {
    return PopupMenuItem<T>(
      value: item.value,
      textStyle: Flutter95.textStyle,
      child: Text(
        item.label,
      ),
    );
  }).toList();

  return showMenu(
    context: context,
    position: position,
    shape: ContinuousRectangleBorder(),
    color: Flutter95.background,
    items: entries,
  );
}

class MenuItem95<T> {
  MenuItem95({
    @required this.value,
    @required this.label,
  });

  final T value;
  final T label;
}
