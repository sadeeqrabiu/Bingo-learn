
import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
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
      'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbXFqcnh4ZWdkcmdmaGZ6YnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NjgyMjAsImV4cCI6MjAzNTI0NDIyMH0.2-8VUqjYHxxXThIBmKgsCN1yStSN-XwKiorcpbitUHk'
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

}