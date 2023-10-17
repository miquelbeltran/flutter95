import 'package:flutter/material.dart';

import '../flutter95.dart';
import 'globals.dart';

Future<T?> showMenu95<T>(
  BuildContext context,
  RelativeRect position,
  List<MenuItem95> items,
) async {
  final List<PopupMenuEntry<T>> entries = items.map((item) {
    return PopupMenuItem<T>(
      value: item.value,
      textStyle: Flutter95.textStyle,
      height: 32,
      child: Text(
        item.label,
      ),
    );
  }).toList();

  return showMenu(
    context: context,
    position: position,
    shape: Border(
      top: BorderSide(color: Flutter95.white, width: 1),
      left: BorderSide(color: Flutter95.white, width: 1),
      bottom: BorderSide(color: Flutter95.grays[3], width: 1),
      right: BorderSide(color: Flutter95.grays[3], width: 1),
    ),
    color: Flutter95.background,
    items: entries,
  );
}

class Menu95<T> {
  Menu95({
    required this.items,
    required this.onItemSelected,
  });

  final List<MenuItem95<T>> items;

  final Function(T?) onItemSelected;

  void show(
    BuildContext context,
    RelativeRect position,
  ) {
    showMenu95(
      context,
      position,
      items,
    ).then((value) => onItemSelected(value));
  }
}

class MenuItem95<T> {
  MenuItem95({
    required this.value,
    required this.label,
  }) : assert(value != null);

  final T value;
  final String label;
}
