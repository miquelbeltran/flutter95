import 'package:flutter/material.dart';

final pageTransitions95 = PageTransitionsTheme(builders: {
  for (var platform in TargetPlatform.values)
    platform: _PageTransitionsBuilder(),
});

class _PageTransitionsBuilder extends PageTransitionsBuilder {
  /// Constructs a page transition that is instantaneous.
  const _PageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double>? secondaryAnimation,
    Widget child,
  ) {
    return _PageTransition(routeAnimation: animation, child: child);
  }
}

class _PageTransition extends StatelessWidget {
  _PageTransition({
    Key? key,
    required Animation<double> routeAnimation,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
