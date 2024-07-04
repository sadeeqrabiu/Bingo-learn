class SignUpUserModel {
  SignUpUserModel({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.email,
    required this.language,
    required this.lLanguage,
    required this.learningFlag,
    required this.learningGoal,
    required this.userId,
  });
  late final String firstName;
  late final String lastName;
  late final String middleName;
  late final String email;
  late final String language;
  late final String lLanguage;
  late final String learningFlag;
  late final String learningGoal;
  late final String userId;



  SignUpUserModel.fromJson(Map<String, dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    email = json['email'];
    language = json['language'];
    lLanguage = json['lLanguage'];
    learningFlag = json['learningFlag'];
    learningGoal = json['learningGoal'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['middleName'] = middleName;
    data['email'] = email;
    data['language'] = language;
    data['lLanguage'] = lLanguage;
    data['learningFlag'] = learningFlag;
    data['learningGoal'] = learningGoal;
    data['userId'] = userId;
    return data;
  }
}

