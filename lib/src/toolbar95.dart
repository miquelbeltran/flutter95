import 'package:flutter/material.dart';

import '../flutter95.dart';

class Toolbar95 extends StatelessWidget {
  const Toolbar95({
    super.key,
    required this.actions,
  });

  final List<Item95> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: Row(
        children: actions,
      ),
    );
  }
}

class Item95 extends StatefulWidget {
  const Item95({
    super.key,
    required this.label,
    this.onTap,
    this.menu,
  }) : assert(!(menu != null && onTap != null));

  final String label;

  final Menu95? menu;

  final Function(BuildContext context)? onTap;

  @override
  State<Item95> createState() => _Item95State();
}

class _Item95State extends State<Item95> {
  bool _tapped = false;
  final _menuController = MenuController();

  @override
  Widget build(BuildContext context) {
    final item = ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 24,
      ),
      child: GestureDetector(
        onTap: () => _onTap(context),
        onTapDown: (details) => setState(() {
          if (_enabled() || widget.menu != null) {
            _tapped = true;
          }
        }),
        onTapUp: (details) => setState(() {
          _tapped = false;
        }),
        onTapCancel: () => setState(() => _tapped = false),
        child: Container(
          decoration: _tapped
              ? Flutter95.pressedDecorationOutside
              : Flutter95.invisibleBorder,
          child: Container(
            decoration: _tapped
                ? Flutter95.pressedDecoration
                : Flutter95.invisibleBorder,
            padding: const EdgeInsets.symmetric(horizontal: 2) +
                (_tapped
                    ? const EdgeInsets.only(top: 1.0, left: 1.0)
                    : const EdgeInsets.all(0.0)),
            child: Center(
              child: Text(
                widget.label,
                style: _enabled()
                    ? Flutter95.textStyle
                    : Flutter95.disabledTextStyle,
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.menu == null) {
      return item;
    }
    return widget.menu!.anchor(
      controller: _menuController,
      child: item,
    );
  }

  bool _enabled() {
    return widget.onTap != null || widget.menu != null;
  }

  void _onTap(BuildContext context) {
    if (widget.menu != null) {
      _menuController.isOpen ? _menuController.close() : _menuController.open();
    } else if (_enabled()) {
      widget.onTap!(context);
    }
  }
}
