
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../local_store/shared_service.dart';
import '../models/login_response.dart';
import 'config.dart';
import '../models/login_request.dart';
import 'package:http/http.dart' as https;

class ApiService{
  static var client = https.Client();

  //login RequestModel
  static Future<bool> login(LoginRequest model) async {
    Map<String, String> loginRequestHeader = {
      'Content-type': 'application/json',
      'ACCESS-KEY': 'BlQeWZ_Kf14SRUUJS92kk'
    };

    var url = Uri.https(Config.apiAuth, Config.loginEndPoint);
    var response = await client.post(url,
        headers: loginRequestHeader, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      debugPrint(response.body);
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      debugPrint(response.body);
      return false;
    }
  }

}