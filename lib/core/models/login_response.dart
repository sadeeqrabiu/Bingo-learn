import 'dart:convert';

import 'package:flutter/cupertino.dart';
LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.token,
  });
  late final String token;

  LoginResponseModel.fromJson(Map<String, dynamic> json){
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = token;
    return data;
  }
}