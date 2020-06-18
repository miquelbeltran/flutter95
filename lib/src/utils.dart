import 'package:flutter/widgets.dart';

import 'globals.dart';

enum Elevation95Type { up, down }

class Elevation95 extends StatelessWidget {
  const Elevation95({
    @required this.child,
    this.type = Elevation95Type.up,
    Key key,
  }) : super(key: key);

  final Widget child;
  final Elevation95Type type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: type == Elevation95Type.up
          ? Flutter95.elevatedDecorationOutside
          : Flutter95.pressedDecorationOutside,
      child: Container(
        decoration: type == Elevation95Type.up
            ? Flutter95.elevatedDecoration
            : Flutter95.pressedDecoration,
        child: child,
      ),
    );
  }
}
