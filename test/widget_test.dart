import 'package:flutter_test/flutter_test.dart';
import 'package:kovo_mobile/main.dart';

void main() {
  testWidgets('Kovo app renders correctly', (tester) async {
    await tester.pumpWidget(const KovoApp());

    expect(find.text('Kovo'), findsOneWidget);
  });
}