import 'package:flutter/material.dart';

import 'button95.dart';
import 'globals.dart';
import 'toolbar95.dart';
import 'utils.dart';

class Scaffold95 extends StatelessWidget {
  const Scaffold95({
    super.key,
    this.title,
    required this.body,
    this.toolbar,
    this.onClosePressed,
    this.customHeader,
  });

  /// Scaffold title
  final String? title;

  /// Scaffold body
  final Widget body;

  /// Scaffold toolbar
  final Toolbar95? toolbar;

  /// Custom behavior of the [CloseButton95]. When [onClosePressed] isn't null,
  /// then the scaffold will include a close button, and clicking it
  /// will call this callback.
  ///
  /// Otherwise, the close button is only shown when the navigator
  /// can be popped, and will automatically call [Navigator.pop] when clicked.
  final void Function(BuildContext context)? onClosePressed;

  /// Custom Scaffold header, overrides provided title
  /// and onClosePressed functionality
  final WindowHeader95? customHeader;

  @override
  Widget build(BuildContext context) {
    return Elevation95(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          customHeader ??
              WindowHeader95(
                title: title,
                onClosePressed: onClosePressed,
              ),
          const SizedBox(height: 4),
          if (toolbar != null) toolbar!,
          if (toolbar != null) const SizedBox(height: 4),
          Expanded(child: body),
        ],
      ),
    );
  }
}

class WindowHeader95 extends StatefulWidget {
  const WindowHeader95({
    super.key,
    this.title,
    this.forceCloseButton,
    this.onClosePressed,
    this.child,
  });

  /// Header title in the default [Flutter95.headerTextStyle] style
  final String? title;

  /// If set, will force showing or hidding the close button
  /// If null, the close button will be displayed if canPop is true
  final bool? forceCloseButton;

  /// Custom action on close tap
  final void Function(BuildContext context)? onClosePressed;

  /// Optional child, if set, it will be displayed instead of the [title]
  /// and the close button
  final Widget? child;

  @override
  State<WindowHeader95> createState() => _WindowHeader95State();
}

class _WindowHeader95State extends State<WindowHeader95> {
  late bool _canPop;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _canPop = Navigator.of(context).canPop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0, left: 2.0, right: 2.0),
        child: Container(
          height: 33,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Flutter95.headerDark,
                Flutter95.headerLight,
              ],
            ),
          ),
          child: widget.child ??
              Row(
                children: [
                  const SizedBox(width: 8),
                  if (widget.title != null)
                    Text(
                      widget.title!,
                      style: Flutter95.headerTextStyle,
                    ),
                  const Spacer(),
                  if (widget.forceCloseButton == true ||
                      (_canPop && widget.forceCloseButton != false))
                    CloseButton95(onPressed: widget.onClosePressed),
                  const SizedBox(width: 4),
                ],
              ),
        ),
      ),
    );
  }
}

class CloseButton95 extends StatelessWidget {
  final void Function(BuildContext context)? onPressed;

  const CloseButton95({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Button95(
      height: 24,
      padding: EdgeInsets.zero,
      onTap: onPressed != null
          ? () => onPressed!(context)
          : () => _defaultOnPressed(context),
      child: const Icon(
        Icons.close,
        size: 20,
      ),
    );
  }

  void _defaultOnPressed(BuildContext context) {
    Navigator.of(context).pop();
  }
}
