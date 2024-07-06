


import 'dart:convert';


class WordsModel{
  final String word;

  WordsModel({required this.word,});


  factory WordsModel.fromJson(dynamic json) {
    return WordsModel(
      word: json['word'] as String,
    );
  }
  static List<WordsModel> languagesFromSnapshot(List snapshot){
    return snapshot.map((data){
      return WordsModel.fromJson(data);
    }).toList();
  }
  @override
  String toString(){
    return 'words {words: $word}';
  }
}

