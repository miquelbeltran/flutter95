import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../flutter95.dart';

class Toolbar95 extends StatelessWidget {
  Toolbar95({
    required this.actions,
    Key? key,
  }) : super(key: key);

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
    required this.label,
    this.onTap,
    this.menu,
    Key? key,
  })  : assert(!(menu != null && onTap != null)),
        super(key: key);

  final String label;

  final Menu95? menu;

  final Function(BuildContext)? onTap;

  @override
  _Item95State createState() => _Item95State();
}

class _Item95State extends State<Item95> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
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
  }

  bool _enabled() {
    return widget.onTap != null || widget.menu != null;
  }

  _onTap(BuildContext context) {
    if (widget.menu != null) {
      widget.menu!.show(
        context,
        context.rect.shift(Offset(0, 24)),
      );
    } else if (_enabled()) {
      return widget.onTap!(context);
    }
  }
}
