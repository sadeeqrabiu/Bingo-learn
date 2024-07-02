import 'dart:convert';

SignUpResponseModel signUpResponseJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

class SignUpResponseModel {
  SignUpResponseModel({
    required this.id,
  });
  late final String id;

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
