

import 'package:bingolearn/src/login_section/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("Login user", (WidgetTester tester)async{

    //Find all Widget for test
    final addEmail = find.byKey(const ValueKey("AddEmail"));
    final addPassword = find.byKey(const ValueKey("AddPassword"));
    final loginUser = find.byKey(const ValueKey("LoginUser"));


    //Execute the actual test
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.enterText(addEmail, 'johntcxy@gmail.com');
    await tester.enterText(addPassword, 'Ijohn@123');
    await tester.tap(loginUser);
    await tester.pump(const Duration(seconds: 4));

    //check Output
    expect(find.text('all test pass'), findsOneWidget);

  });
}