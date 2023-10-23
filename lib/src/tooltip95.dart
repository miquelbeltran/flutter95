import 'package:flutter/material.dart';
import 'package:flutter95/src/globals.dart';

class Tooltip95 extends StatelessWidget {
  const Tooltip95({
    Key? key,
    required this.child,
    required this.message,
    this.triggerMode,
    this.preferBelow,
    this.showDuration,
    this.onTriggered,
  });

  final Widget child;
  final String message;
  final TooltipTriggerMode? triggerMode;
  final bool? preferBelow;
  final Duration? showDuration;
  final void Function()? onTriggered;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      key: key,
      child: child,
      message: message,
      margin: const EdgeInsets.all(8.0),
      textAlign: TextAlign.center,
      preferBelow: preferBelow,
      showDuration: showDuration,
      onTriggered: onTriggered,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.zero,
        color: Flutter95.tooltipBackground,
        boxShadow: [
          BoxShadow(
            color: Flutter95.black,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
      triggerMode: triggerMode,
      textStyle: Flutter95.textStyle,
    );
  }
}
