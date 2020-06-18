import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter95/flutter95.dart';

class Toolbar95 extends StatelessWidget {
  Toolbar95({
    this.actions,
    Key key,
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
    @required this.label,
    this.onTap,
    Key key,
  }) : super(key: key);

  final String label;

  final Function() onTap;

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
        minWidth: 48,
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (details) => setState(() {
          if (widget.onTap != null) {
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
            padding: _tapped
                ? const EdgeInsets.only(top: 1.0, left: 1.0)
                : const EdgeInsets.all(0.0),
            child: Center(
              child: Text(
                widget.label,
                style: widget.onTap != null
                    ? Flutter95.textStyle
                    : Flutter95.disabledTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
