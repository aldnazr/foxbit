import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foxbit/app/app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App renders login page when unauthenticated', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: FoxbitApp()));

    await tester.pumpAndSettle();

    expect(find.text('Foxbit'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
