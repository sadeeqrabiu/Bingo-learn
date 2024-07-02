class SignUpRequestModel {
  SignUpRequestModel({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.email,
    required this.password,
  });
  late final String firstName;
  late final String lastName;
  late final String middleName;
  late final String email;
  late final String password;

  SignUpRequestModel.fromJson(Map<String, dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['middleName'] = middleName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}