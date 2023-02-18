import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_help/presentation/auth/auth_provider.dart';

import 'package:get_help/presentation/auth/signup/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'CUET Get Help',
      home: ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        child: const SigninScreen(),
      ),
    );
  }

  testWidgets('Signin button widget renders', (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('signin')), findsOneWidget);
  });
}

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("Unable to load asset"),
    );
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    // debugPrint('Ignored Error');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}
