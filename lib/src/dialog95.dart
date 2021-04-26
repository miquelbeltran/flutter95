import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../flutter95.dart';

const _goldenRatio = 1.618;

Future<T?> showDialog95<T>({
  required BuildContext context,
  required String title,
  required String message,
  List<Action95>? actions,
}) {
  if (actions == null || actions.isEmpty) {
    actions = [Action95.OK];
  }
  return showDialog(
    context: context,
    builder: (context) {
      var maxWidth = MediaQuery.of(context).size.width / _goldenRatio;
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Scaffold95(
            title: title,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Column(
                children: <Widget>[
                  _iconMessageRow(message),
                  const SizedBox(height: 8),
                  Button95(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget _iconMessageRow(String message) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      _icon(),
      _message(message),
    ],
  );
}

Padding _icon() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset(
      'icons/icon_error.png',
      package: 'flutter95',
      width: 32,
      height: 32,
    ),
  );
}

Flexible _message(String message) {
  return Flexible(
    child: Text(
      message,
      style: Flutter95.textStyle,
    ),
  );
}

class Action95<T> {
  const Action95({
    required this.value,
    required this.label,
  });

  final T value;
  final String label;

  static const OK = Action95<bool>(value: true, label: 'OK');
  static const cancel = Action95<bool>(value: false, label: 'Cancel');
}
