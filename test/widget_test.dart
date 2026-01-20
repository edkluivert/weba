import 'package:flutter_test/flutter_test.dart';
import 'package:weba/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WebaApp());

    // Verify that the app title or main text is present
    expect(find.text('Weba'), findsOneWidget);
  });
}
