import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing_demo/UI/login_page.dart';

void main() {
  testWidgets("User Id test",  (WidgetTester tester) async {

    final addUserId = find.byKey(const ValueKey("addUserId"));

    await tester.pumpWidget(const MaterialApp(home:  MyHomePage(title: '',)));
    await tester.enterText(addUserId, "Make widget test 1");
    await tester.pump();

    expect(find.text("Make widget test 1"), findsOneWidget);
  });

  testWidgets("Password test",  (WidgetTester tester) async {

    final addPassword = find.byKey(const ValueKey("addPassword"));

    await tester.pumpWidget(const MaterialApp(home:  MyHomePage(title: '',)));
    await tester.enterText(addPassword, "Make widget test 2");
    await tester.pump();

    expect(find.text("Make widget test 2"), findsOneWidget);
  });

  testWidgets("Login button test",  (WidgetTester tester) async {

    final signInButton = find.byKey(const ValueKey("signInButton"));

    await tester.pumpWidget(const MaterialApp(home: MyHomePage(title: '',)));
    await tester.tap(signInButton);
    await tester.pump(const Duration(seconds: 2));

    expect(find.text("Make button widget test"), findsNothing);
  });
}