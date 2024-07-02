
import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/cupertino.dart';

import '../local_store/shared_service.dart';
import '../models/login/login_response.dart';
import '../models/sign_up/sign_up_resquest.dart';
import 'config.dart';
import '../models/login/login_request.dart';
import 'package:http/http.dart' as https;

class ApiService{
  static var client = https.Client();

  //login RequestModel
  static Future<bool> login(LoginRequest model) async {
    Map<String, String> loginRequestHeader = {
      'Content-type': 'application/json',
      'apikey': ApiKey.apiKey
    };

    var url = Uri.parse( Config.apiHttp + Config.apiAuth + Config.loginEndPoint);
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


  // SignUp Future function
  static Future<bool> signUp(SignUpRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'ACCESS-KEY': ApiKey.apiKey
    };
    var url = Uri.parse( Config.apiHttp + Config.apiAuth + Config.signUpEndPoint);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      debugPrint('200 gotten');
      return true;
    } else {
      debugPrint(response.body);
      debugPrint('fail');
      return false;
    }
  }

}