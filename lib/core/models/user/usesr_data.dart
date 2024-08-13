
import 'dart:convert';

UserDataModel userDataResponseJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

class UserDataModel {
  String? firstName;
  String? lastName;
  String? email;
  String? language;
  String? lLanguage;
  String? userId;
  String? middleName;
  String? learningGoal;
  String? learningFlag;

  UserDataModel(
      {
        this.firstName,
        this.lastName,
        this.email,
        this.language,
        this.lLanguage,
        this.userId,
        this.middleName,
        this.learningGoal,
        this.learningFlag});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    language = json['language'];
    lLanguage = json['lLanguage'];
    userId = json['userId'];
    middleName = json['middleName'];
    learningGoal = json['learningGoal'];
    learningFlag = json['learningFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['language'] = language;
    data['lLanguage'] = lLanguage;
    data['userId'] = userId;
    data['middleName'] = middleName;
    data['learningGoal'] = learningGoal;
    data['learningFlag'] = learningFlag;
    return data;
  }
}

class UserResponse {
  final List<UserDataModel> data;

  UserResponse({required this.data});

  factory UserResponse.fromJson(List<dynamic> json) {
    return UserResponse(data: json.map((item) => UserDataModel.fromJson(item)).toList());
  }
}

class UserDataListModel{
  int? id;
  String? createdAt;
  String? firstName;
  String? lastName;
  String? email;
  String? language;
  String? lLanguage;
  String? userId;
  String? middleName;
  String? learningGoal;
  String? learningFlag;

  UserDataListModel(
      {this.id,
        this.createdAt,
        this.firstName,
        this.lastName,
        this.email,
        this.language,
        this.lLanguage,
        this.userId,
        this.middleName,
        this.learningGoal,
        this.learningFlag});


  factory UserDataListModel.fromJson(dynamic json) {
    return UserDataListModel(
      id: json['id'],
      createdAt: json['created_at'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      language: json['language'] as String,
      lLanguage: json['lLanguage'] as String,
      userId: json['userId'] as String,
      middleName: json['middleName'] as String,
      learningGoal: json['learningGoal'] as String,
      learningFlag: json['learningFlag'] as String,
    );
  }
  static List<UserDataListModel> languagesFromSnapshot(List snapshot){
    return snapshot.map((data){
      return UserDataListModel.fromJson(data);
    }).toList();
  }
  @override
  String toString(){
    return 'Empty';
  }
}