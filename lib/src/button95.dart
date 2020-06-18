import 'package:flutter/widgets.dart';

import 'globals.dart';

class Button95 extends StatefulWidget {
  const Button95({
    this.onTap,
    this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
    Key key,
  }) : super(key: key);

  final Function() onTap;
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  _Button95State createState() => _Button95State();
}

class _Button95State extends State<Button95> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) => setState(() {
        _tapped = true;
      }),
      onTapUp: (details) => setState(() {
        _tapped = false;
      }),
      onTapCancel: () => setState(() => _tapped = false),
      child: Container(
        decoration: _tapped
            ? Flutter95.pressedDecorationOutside
            : Flutter95.elevatedDecorationOutside,
        child: Container(
          padding: widget.padding,
          decoration: _tapped
              ? Flutter95.pressedDecoration
              : Flutter95.elevatedDecoration,
          child: DefaultTextStyle(
            style: Flutter95.buttonTextStyle,
            child: Padding(
              padding: _tapped
                  ? const EdgeInsets.only(top: 1.0, left: 1.0)
                  : const EdgeInsets.all(0.0),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
