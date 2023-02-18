import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_help/presentation/auth/auth_provider.dart';

import 'package:get_help/presentation/auth/signup/signup_role_screen.dart';
import 'package:provider/provider.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'CUET Get Help',
      home: ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        child: const SignupRole(),
      ),
    );
  }

  testWidgets('Role choose widget renders', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('teacher')), findsOneWidget);
  });
}
