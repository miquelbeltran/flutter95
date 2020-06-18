import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter95/flutter95.dart';

void main() {
  group('Scaffold95', () {
    testWidgets('can build widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold95(
            title: 'test',
            body: Text('other'),
          ),
        ),
      );

      expect(find.text('test'), findsOneWidget);
      expect(find.text('other'), findsOneWidget);
    });
  });

  group('Button95', () {
    testWidgets('can build widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Button95(
            onTap: () {},
            child: Text('button'),
          ),
        ),
      );

      expect(find.text('button'), findsOneWidget);
    });
  });
}
