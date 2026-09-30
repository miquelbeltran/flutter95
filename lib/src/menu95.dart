import 'package:flutter/material.dart';

import '../flutter95.dart';
import 'globals.dart';

Future<T?> showMenu95<T>(
  BuildContext context,
  RelativeRect position,
  List<MenuEntry95> items,
) async {
  final List<PopupMenuEntry<T>> entries = items.map((item) {
    if (item is MenuItem95) {
      return PopupMenuItem<T>(
        value: item.value,
        height: 24,
        padding: EdgeInsets.zero,
        child: _MenuItemLabel95(
          label: item.label,
        ),
      );
    }
    return _MenuSeparator95<T>();
  }).toList();

  return showMenu(
    context: context,
    position: position,
    shape: Border(
      top: const BorderSide(color: Flutter95.white, width: 1),
      left: const BorderSide(color: Flutter95.white, width: 1),
      bottom: BorderSide(color: Flutter95.grays[3], width: 1),
      right: BorderSide(color: Flutter95.grays[3], width: 1),
    ),
    color: Flutter95.background,
    elevation: 0,
    items: entries,
  );
}

class Menu95<T> {
  Menu95({
    required this.items,
    required this.onItemSelected,
  });

  final List<MenuEntry95<T>> items;

  final Function(T? item) onItemSelected;

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

abstract class MenuEntry95<T> {
  const MenuEntry95();
}

class MenuItem95<T> extends MenuEntry95<T> {
  MenuItem95({
    required this.value,
    required this.label,
  }) : assert(value != null);

  final T value;
  final String label;
}

class MenuDivider95<T> extends MenuEntry95<T> {
  const MenuDivider95();
}

class _MenuItemLabel95 extends StatefulWidget {
  const _MenuItemLabel95({
    required this.label,
  });

  final String label;

  @override
  State<_MenuItemLabel95> createState() => _MenuItemLabel95State();
}

class _MenuItemLabel95State extends State<_MenuItemLabel95> {
  bool _highlighted = false;

  @override
  Widget build(BuildContext context) {
    final bool highlighted =
        _highlighted || (Focus.maybeOf(context)?.hasPrimaryFocus ?? false);
    return MouseRegion(
      onEnter: (event) => setState(() => _highlighted = true),
      onExit: (event) => setState(() => _highlighted = false),
      child: Listener(
        onPointerDown: (event) => setState(() => _highlighted = true),
        onPointerUp: (event) => setState(() => _highlighted = false),
        onPointerCancel: (event) => setState(() => _highlighted = false),
        child: Container(
          width: double.infinity,
          height: 24,
          color: highlighted ? Flutter95.headerDark : Flutter95.background,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label,
            style: highlighted
                ? Flutter95.textStyle.copyWith(color: Flutter95.white)
                : Flutter95.textStyle,
          ),
        ),
      ),
    );
  }
}

class _MenuSeparator95<T> extends PopupMenuEntry<T> {
  const _MenuSeparator95();

  @override
  double get height => 8;

  @override
  bool represents(T? value) => false;

  @override
  State<_MenuSeparator95<T>> createState() => _MenuSeparator95State<T>();
}

class _MenuSeparator95State<T> extends State<_MenuSeparator95<T>> {
  @override
  Widget build(BuildContext context) {
    return const Divider95(
      height: 8,
    );
  }
}
