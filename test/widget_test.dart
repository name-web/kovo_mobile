import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kovo_mobile/main.dart';

void main() {
  testWidgets('Kovo app renders correctly', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: KovoApp(),
      ),
    );

    expect(find.text('Mon profil'), findsOneWidget);
  });
}