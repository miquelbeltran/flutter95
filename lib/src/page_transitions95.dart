import 'package:flutter/material.dart';

final pageTransitions95 = PageTransitionsTheme(builders: {
  for (var platform in TargetPlatform.values)
    platform: const _PageTransitionsBuilder(),
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
  const _PageTransition({
    required Animation<double> routeAnimation,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
