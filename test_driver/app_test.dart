// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Bingo Learn', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    final emailField = find.byValueKey('AddEmail');
    final passwordField = find.byValueKey('AddPassword');
    final loginInButton = find.byValueKey('LoginUser');
    final createAccountButton = find.byValueKey('createAccount');

    //home screen
    FlutterDriver? driver;

    Future<bool> isPresent(SerializableFinder byValueKey,
        {Duration timeout = const Duration(seconds: 1)}) async {
      try {
        await driver!.waitFor(byValueKey, timeout: timeout);
        return true;
      } catch (exception) {
        return false;
      }
    }

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.
      connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });
    // test('login user', () async {
    //   if (await isPresent(loginInButton)) {
    //     await driver!.tap(loginInButton);
    //   }
    //
    //   await driver!.tap(usernameField);
    //   await driver!.enterText("tadas1@gmail.com");
    //
    //   await driver!.tap(passwordField);
    //   await driver!.enterText("123456");
    //
    //   await driver!.tap(createAccountButton);
    //   await driver!.waitFor(find.text("Your Todos"));
    // });

    test('login', () async {
      if (await isPresent(loginInButton)) {
        await driver!.tap(loginInButton);
      }

      await driver!.tap(emailField);
      await driver!.enterText("johntcxy@gmail.com");

      await driver!.tap(passwordField);
      await driver!.enterText("Ijohn@123");

      await driver!.tap(loginInButton);
      // await driver!.waitFor(find.text("Your Todos"));
    });

    // test('add a todo', () async {
    //   if (await isPresent(signOutButton)) {
    //     await driver.tap(addField);
    //     await driver.enterText("make an integration test video");
    //     await driver.tap(addButton);
    //
    //     await driver.waitFor(find.text("make an integration test video"),
    //         timeout: const Duration(seconds: 3));
    //   }
    // });
  });
}