import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Scaffold95', () {
    testWidgets('can build widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
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
            body: const Text('other'),
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
            child: const Text('button'),
          ),
        ),
      );

      expect(find.text('button'), findsOneWidget);
    });
  });

  group('TextField95', () {
    testWidgets('Can build widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TextField95(
            key: Key('TextField95Key'),
          ),
        ),
      );
      expect(find.byKey(const Key('TextField95Key')), findsOneWidget);
    });
  });

  group('Toolbar95', () {
    testWidgets('Can build widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
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
      expect(find.byKey(const Key('Toolbar95Key')), findsOneWidget);
      expect(find.byType(Item95), findsNWidgets(3));
    });
  });

  group('Tooltip95', () {
    testWidgets('Can show tooltip', (tester) async {
      String message = 'Hello world';

      await tester.pumpWidget(
        MaterialApp(
          home: Tooltip95(
            message: message,
            triggerMode: TooltipTriggerMode.longPress,
            child: const Text(
              'long press to show tooltip',
              style: Flutter95.textStyle,
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(Text));
      await tester.pump();
      expect(find.byTooltip(message), findsOneWidget);
    });
  });

  group('Checkbox95', () {
    testWidgets('Can build enabled widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Checkbox95(
            key: const Key('checkbox95Key'),
            value: true,
            onChanged: (value) {},
          ),
        ),
      );
      expect(find.byKey(const Key('checkbox95Key')), findsOneWidget);
    });

    testWidgets('Can build disabled widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Checkbox95(
            key: const Key('checkbox95Key'),
            value: true,
          ),
        ),
      );
      expect(find.byKey(const Key('checkbox95Key')), findsOneWidget);
    });
  });
}
