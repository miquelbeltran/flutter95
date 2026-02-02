import 'package:flutter/material.dart';

import 'button95.dart';
import 'globals.dart';
import 'toolbar95.dart';
import 'utils.dart';

class Scaffold95 extends StatelessWidget {
  const Scaffold95({
    super.key,
    this.title,
    this.customWidget,
    this.showCloseButton,
    required this.body,
    this.toolbar,
    this.onClosePressed,
  });

  final String? title;

  /// Add your own widget to header. For any [Text] widgets, it is recommended
  /// to use [Flutter95.headerTextStyle] style
  ///
  /// Overrides [title], [showCloseButton], and [onClosePressed]
  final Widget? customWidget;

  final bool? showCloseButton;
  final Widget body;
  final Toolbar95? toolbar;

  /// Custom behavior of the [CloseButton95]. When [onClosePressed] isn't null,
  /// then the scaffold will include a close button, and clicking it
  /// will call this callback.
  ///
  /// Otherwise, the close button is only shown when the navigator
  /// can be popped, and will automatically call [Navigator.pop] when clicked.
  final void Function(BuildContext context)? onClosePressed;

  @override
  Widget build(BuildContext context) {
    return Elevation95(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WindowHeader95(
            title: title,
            customWidget: customWidget,
            showCloseButton: showCloseButton,
            onClosePressed: onClosePressed),
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
    this.customWidget,
    this.showCloseButton,
    this.onClosePressed,
  });

  final String? title;

  final Widget? customWidget;

  final bool? showCloseButton;

  final void Function(BuildContext context)? onClosePressed;

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
          child: widget.customWidget ??
              Row(
                children: [
                  const SizedBox(width: 8),
                  if (widget.title != null)
                    Text(
                      widget.title!,
                      style: Flutter95.headerTextStyle,
                    ),
                  const Spacer(),
                  if (widget.onClosePressed != null &&
                      widget.showCloseButton != false)
                    CloseButton95(onPressed: widget.onClosePressed!)
                  else if (_canPop && widget.showCloseButton != false)
                    const CloseButton95(),
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
