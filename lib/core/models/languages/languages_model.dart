

import 'dart:convert';


class LanguagesModel{
  final String? language;
  final String? flag;

  LanguagesModel({required this.language, required this.flag,});


  factory LanguagesModel.fromJson(dynamic json) {
    return LanguagesModel(
        language: json['Language'] as String,
        flag: json['flag'] as String,
      );
  }
  static List<LanguagesModel> labsFromSnapshot(List snapshot){
    return snapshot.map((data){
      return LanguagesModel.fromJson(data);
    }).toList();
  }
  @override
  String toString(){
    return 'Languages {languages: $language, image: $flag,}';
  }
}

