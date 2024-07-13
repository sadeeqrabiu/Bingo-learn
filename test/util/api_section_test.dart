import 'dart:convert';

import 'package:bingolearn/core/api_section/api_service.dart';
import 'package:bingolearn/core/api_section/config.dart';
import 'package:bingolearn/core/models/login/login_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import "package:http/http.dart" as https;
//Assuming you use http package

// Mock the http.Client class
class MockClient extends Mock implements https.Client {
  // post(any, {required headers, required body}) async {}
}


void main() {
  group('ApiService', () {
    test('login returns true if the http call completes successfully', () async {
      final client = MockClient();

      // Mock the response of the client
      Map<String, String> loginRequestHeader = {
        'Content-type': 'application/json',
        'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbXFqcnh4ZWdkcmdmaGZ6YnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NjgyMjAsImV4cCI6MjAzNTI0NDIyMH0.2-8VUqjYHxxXThIBmKgsCN1yStSN-XwKiorcpbitUHk'
      };
      when(client.post(
        Uri.parse(Config.apiHttp + Config.apiAuth + Config.loginEndPoint),

        headers: loginRequestHeader,
        // body: jsonEncode(model.toJson()),
      )).thenAnswer((_) async => https.Response('{"token": "123"}', 200));

      // Replace the client in ApiService with the mock client
      ApiService.client = client;

      // Create a sample LoginRequest model
      final model = LoginRequest(password: 'Ijohn@123', email: 'Johntcxy@gmail.com');

      // Call the login method
      final result = await ApiService.login(model);

      // Verify the result
      expect(result, true);
    });

    // test('login returns false if the http call completes with an error', () async {
    //   final client = MockClient();
    //
    //   // Mock the response of the client
    //   when(client.post(
    //     Uri.parse(Config.apiHttp + Config.apiAuth + Config.loginEndPoint),
    //     headers: anyNamed('headers'),
    //     body: anyNamed('body'),
    //   )).thenAnswer((_) async => http.Response('Unauthorized', 401));
    //
    //   // Replace the client in ApiService with the mock client
    //   ApiService.client = client;
    //
    //   // Create a sample LoginRequest model
    //   final model = LoginRequest(username: 'test', password: 'test');
    //
    //   // Call the login method
    //   final result = await ApiService.login(model);
    //
    //   // Verify the result
    //   expect(result, false);
    // });
  });
}
// void main() {
//   group('ApiService login test', () {
//     late MockClient mockClient;
//     late ApiService apiService;
//     var client = https.Client();
//
//     setUp(() {
//       mockClient = MockClient();
//       // apiService = apiService;
//       apiService = ApiService(mockClient);
//     });
//
//     test('login returns true on successful response', () async {
//       // Mock the response
//       final mockResponse = https.Response('{ "message": "Login successful" }', 200);
//       var url = Uri.parse( Config.apiHttp + Config.apiAuth + Config.loginEndPoint);
//       when(mockClient.post(url, headers: any, body: any)).thenAnswer((_) => Future.value(mockResponse));
//
//       final LoginRequest model = LoginRequest(password: 'Ijohn@123', email: 'Johntcxy@gmail.com');
//       final success = await ApiService.login(model);
//
//       expect(success, true);
//     });
//
//     // test('login returns false on unsuccessful response', () async {
//     //   // Mock the error response
//     //   final mockErrorResponse = https.Response('{ "error": "Invalid credentials" }', 401);
//     //   var url = Uri.parse( Config.apiHttp + Config.apiAuth + Config.loginEndPoint);
//     //   when(mockClient.post(url, headers: any, body: any)).thenAnswer((_) => Future.value(mockErrorResponse));
//     //
//     //   final LoginRequest model = LoginRequest( password: 'password', email: '');
//     //   final success = await ApiService.login(model);
//     //
//     //   expect(success, false);
//     // });
//     //
//     // test('login throws exception on network error', () async {
//     //   // Mock the network error
//     //   var url = Uri.parse( Config.apiHttp + Config.apiAuth + Config.loginEndPoint);
//     //   when(mockClient.post(url, headers: any, body: any)).thenThrow(Exception('Network error'));
//     //
//     //   final LoginRequest model = LoginRequest(password: 'password', email: '');
//     //
//     //   expect(() => ApiService.login(model), throwsException);
//     // });
//   });
// }