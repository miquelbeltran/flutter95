import 'package:flutter/material.dart';

import '../flutter95.dart';
import 'globals.dart';

class Menu95<T> {
  Menu95({
    required this.items,
    required this.onItemSelected,
  });

  final List<MenuEntry95<T>> items;

  final Function(T? item) onItemSelected;

  Widget anchor({
    required MenuController controller,
    required Widget child,
  }) {
    return MenuAnchor(
      controller: controller,
      style: _menuStyle,
      menuChildren: _buildMenuChildren(items, onItemSelected),
      child: child,
    );
  }
}

sealed class MenuEntry95<T> {
  const MenuEntry95();
}

class MenuItem95<T> extends MenuEntry95<T> {
  MenuItem95({
    required this.value,
    required this.label,
    this.enabled = true,
  }) : assert(value != null);

  final T value;
  final String label;
  final bool enabled;
}

class Submenu95<T> extends MenuEntry95<T> {
  const Submenu95({
    required this.label,
    required this.items,
  });

  final String label;
  final List<MenuEntry95<T>> items;
}

class MenuDivider95<T> extends MenuEntry95<T> {
  const MenuDivider95();
}

const _menuStyle = MenuStyle(
  padding: WidgetStatePropertyAll(EdgeInsets.zero),
  elevation: WidgetStatePropertyAll(0),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
  visualDensity: VisualDensity.standard,
);

List<Widget> _buildMenuChildren<T>(
  List<MenuEntry95<T>> items,
  Function(T? item) onItemSelected,
) {
  final entries = items.map((item) {
    return switch (item) {
      MenuItem95() => MenuItemButton(
          onPressed: item.enabled ? () => onItemSelected(item.value) : null,
          style: _itemStyle(),
          child: Text(item.label),
        ),
      Submenu95() => _Submenu95<T>(
          submenu: item,
          onItemSelected: onItemSelected,
        ),
      MenuDivider95() => const Divider95(
          height: 8,
        ),
    };
  }).toList();

  return [
    Elevation95(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: entries,
      ),
    ),
  ];
}

ButtonStyle _itemStyle({bool open = false}) {
  bool highlighted(Set<WidgetState> states) =>
      open ||
      states.contains(WidgetState.hovered) ||
      states.contains(WidgetState.focused) ||
      states.contains(WidgetState.pressed);

  Color foreground(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return Flutter95.grays[3];
    }
    return highlighted(states) ? Flutter95.white : Flutter95.black;
  }

  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) =>
        highlighted(states) && !states.contains(WidgetState.disabled)
            ? Flutter95.headerDark
            : Flutter95.background),
    foregroundColor: WidgetStateProperty.resolveWith(foreground),
    iconColor: WidgetStateProperty.resolveWith(foreground),
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    textStyle: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.disabled)
            ? Flutter95.disabledTextStyle
            : Flutter95.textStyle),
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 16),
    ),
    minimumSize: const WidgetStatePropertyAll(Size(0, 24)),
    maximumSize: const WidgetStatePropertyAll(Size(double.infinity, 24)),
    shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
    visualDensity: VisualDensity.standard,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

class _Submenu95<T> extends StatefulWidget {
  const _Submenu95({
    required this.submenu,
    required this.onItemSelected,
  });

  final Submenu95<T> submenu;
  final Function(T? item) onItemSelected;

  @override
  State<_Submenu95<T>> createState() => _Submenu95State<T>();
}

class _Submenu95State<T> extends State<_Submenu95<T>> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return SubmenuButton(
      onOpen: () => setState(() => _open = true),
      onClose: () => setState(() => _open = false),
      style: _itemStyle(open: _open),
      menuStyle: _menuStyle,
      alignmentOffset: const Offset(0, -3),
      menuChildren: _buildMenuChildren(
        widget.submenu.items,
        widget.onItemSelected,
      ),
      child: Text(widget.submenu.label),
    );
  }
}
