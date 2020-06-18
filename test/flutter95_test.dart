import 'package:flutter_test/flutter_test.dart';

import 'package:flutter95/flutter95.dart';

void main() {
  group('Scaffold95', () {
    testWidgets('canary', (tester) async {
      await tester.pumpWidget(Scaffold95());
    });
  });
}
