import 'package:flutter/gestures.dart';
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

  group('Divider95', () {
    testWidgets('Can build widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Divider95(
            key: Key('Divider95Key'),
          ),
        ),
      );
      expect(find.byKey(const Key('Divider95Key')), findsOneWidget);
    });
  });

  group('Menu95', () {
    testWidgets('Can open menu', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Toolbar95(
            actions: [
              Item95(
                label: 'File',
                menu: Menu95(
                  items: [
                    MenuItem95(value: 1, label: 'New'),
                    const MenuDivider95(),
                    MenuItem95(value: 2, label: 'Exit'),
                  ],
                  onItemSelected: (item) {},
                ),
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.text('File'));
      await tester.pumpAndSettle();

      expect(find.text('New'), findsOneWidget);
      expect(find.text('Exit'), findsOneWidget);
      expect(find.byType(Divider95), findsOneWidget);
    });

    testWidgets('Can select item', (tester) async {
      int? selected;
      await tester.pumpWidget(
        MaterialApp(
          home: Toolbar95(
            actions: [
              Item95(
                label: 'File',
                menu: Menu95(
                  items: [
                    MenuItem95(value: 1, label: 'New'),
                    MenuItem95(value: 2, label: 'Exit'),
                  ],
                  onItemSelected: (item) => selected = item,
                ),
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.text('File'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Exit'));
      await tester.pumpAndSettle();

      expect(selected, 2);
      expect(find.text('New'), findsNothing);
    });

    testWidgets('Highlights item on hover', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Toolbar95(
            actions: [
              Item95(
                label: 'File',
                menu: Menu95(
                  items: [
                    MenuItem95(value: 1, label: 'New'),
                  ],
                  onItemSelected: (item) {},
                ),
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.text('File'));
      await tester.pumpAndSettle();

      Color? background() => tester
          .widget<Container>(find
              .ancestor(of: find.text('New'), matching: find.byType(Container))
              .first)
          .color;

      expect(background(), Flutter95.background);

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await gesture.moveTo(tester.getCenter(find.text('New')));
      await tester.pump();

      expect(background(), Flutter95.headerDark);
      expect(
          tester.widget<Text>(find.text('New')).style?.color, Flutter95.white);
    });
  });
}
