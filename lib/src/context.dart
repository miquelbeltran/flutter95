import 'package:flutter/widgets.dart';

extension ContextExt on BuildContext {
  RelativeRect get rect {
    final RenderBox button = findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(this).context.findRenderObject() as RenderBox;
    return RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(
          Offset.zero,
          ancestor: overlay,
        ),
        button.localToGlobal(
          button.size.bottomRight(Offset.zero),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );
  }
}
