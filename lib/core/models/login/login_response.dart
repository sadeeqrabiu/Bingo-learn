import 'dart:convert';

import 'package:flutter/cupertino.dart';
LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));


class LoginResponseModel {

  String? token;
  User? user;

  LoginResponseModel({this.token, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['access_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;


  User({this.id, });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}