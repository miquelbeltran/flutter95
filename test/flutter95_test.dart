import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:flutter_test/flutter_test.dart';

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

    testWidgets('shows close button when callback provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold95(
            title: 'test',
            body: Text('other'),
            onClosePressed: (context) {
              // Pass.
            },
          ),
        ),
      );

      expect(find.byType(CloseButton95), findsOneWidget);
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

  group('TextField95', () {
    testWidgets('Can build widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TextField95(
            key: Key('TextField95Key'),
          ),
        ),
      );
      expect(find.byKey(Key('TextField95Key')), findsOneWidget);
    });
  });

  group('Toolbar95', () {
    testWidgets('Can build widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Toolbar95(
            key: Key('Toolbar95Key'),
            actions: [
              Item95(label: 'Test 1'),
              Item95(label: 'Test 2'),
              Item95(label: 'Test 3'),
            ],
          ),
        ),
      );
      expect(find.byKey(Key('Toolbar95Key')), findsOneWidget);
      expect(find.byType(Item95), findsNWidgets(3));
    });
  });
}
