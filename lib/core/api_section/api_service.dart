
import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:bingolearn/core/models/languages/languages_model.dart';
import 'package:bingolearn/core/models/sign_up/sign_up_response.dart';
import 'package:bingolearn/core/models/sign_up/sign_up_user.dart';
import 'package:bingolearn/core/models/user/usesr_data.dart';
import 'package:flutter/cupertino.dart';

import '../local_store/shared_service.dart';
import '../models/game/words_model.dart';
import '../models/login/login_response.dart';
import '../models/sign_up/sign_up_resquest.dart';
import 'config.dart';
import '../models/login/login_request.dart';
import 'package:http/http.dart' as https;

class ApiService{

  static var client = https.Client();
  var apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbXFqcnh4ZWdkcmdmaGZ6YnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NjgyMjAsImV4cCI6MjAzNTI0NDIyMH0.2-8VUqjYHxxXThIBmKgsCN1yStSN-XwKiorcpbitUHk';

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
      // debugPrint(response.body);
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
      'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbXFqcnh4ZWdkcmdmaGZ6YnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NjgyMjAsImV4cCI6MjAzNTI0NDIyMH0.2-8VUqjYHxxXThIBmKgsCN1yStSN-XwKiorcpbitUHk'
    };
    var url = Uri.parse( Config.apiHttp + Config.apiAuth + Config.signUpEndPoint);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      await SharedService.signUpID(signUpResponseJson(response.body));
      return true;
    } else {
      debugPrint(response.body);
      debugPrint('fail');
      return false;
    }
  }

  // SignUpUser Data Future function
  static Future<bool> signUpData(SignUpUserModel model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbXFqcnh4ZWdkcmdmaGZ6YnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NjgyMjAsImV4cCI6MjAzNTI0NDIyMH0.2-8VUqjYHxxXThIBmKgsCN1yStSN-XwKiorcpbitUHk'
    };
    var url = Uri.parse( Config.apiHttp + Config.apiAuth + Config.userDateEndPoint);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 201) {
      debugPrint('success');
      return true;
    } else {
      debugPrint(response.body);
      debugPrint('fail');
      return false;
    }
  }

  static Future<List<LanguagesModel>> getLanguages() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbXFqcnh4ZWdkcmdmaGZ6YnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NjgyMjAsImV4cCI6MjAzNTI0NDIyMH0.2-8VUqjYHxxXThIBmKgsCN1yStSN-XwKiorcpbitUHk'
    };
    var url = Uri.parse(Config.apiHttp + Config.apiAuth + Config.allLanguageEndPoint);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    List<LanguagesModel> temp = [];
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      debugPrint('success Language endPoint hit');
      for (Map itemData in data) {
        temp.add(LanguagesModel.fromJson(itemData));
      }
      return temp;
    } else {
      debugPrint('getting Languages failed');
      debugPrint(response.body);
      return temp;
    }
  }


  // static Future<List<UserDataModel>> getUserData() async {
  //
  //   var userToken =  await SharedService.loginDetails();
  //
  //   Map<String, String> requestHeaders = {
  //     'Content-type': 'application/json',
  //     'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbXFqcnh4ZWdkcmdmaGZ6YnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NjgyMjAsImV4cCI6MjAzNTI0NDIyMH0.2-8VUqjYHxxXThIBmKgsCN1yStSN-XwKiorcpbitUHk',
  //     'Authorization': 'Bearer ${userToken?.token}',
  //   };
  //
  //   debugPrint(userToken!.user?.id);
  //   var url = Uri.parse(
  //       '${Config.apiHttp}${Config.apiAuth}${Config.getUerDataEndPoint}${userToken.user?.id}');
  //   debugPrint(url.toString());
  //
  //   var response = await client.get(
  //     url,
  //     headers: requestHeaders,
  //   );
  //   if (response.statusCode == 200) {
  //     debugPrint(response.body);
  //     APICacheDBModel cacheDBModel = new APICacheDBModel(
  //         key: 'user_Data', syncData: response.body);
  //     await APICacheManager().addCacheData(cacheDBModel);
  //
  //     return userDataResponseJson(json.decode(response.body));
  //     // await SharedService.setUserData(userDataResponseJson(response.body) );
  //     return true;
  //   } else {
  //     debugPrint(response.body);
  //     debugPrint('fail');
  //     return false;
  //   }
  // }

  static Future<List<UserDataListModel>> getUserData() async {

    var userToken =  await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbXFqcnh4ZWdkcmdmaGZ6YnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NjgyMjAsImV4cCI6MjAzNTI0NDIyMH0.2-8VUqjYHxxXThIBmKgsCN1yStSN-XwKiorcpbitUHk',
      'Authorization': 'Bearer ${userToken?.token}',
    };

    debugPrint(userToken!.user?.id);
    var url = Uri.parse(
        '${Config.apiHttp}${Config.apiAuth}${Config.getUerDataEndPoint}${userToken.user?.id}');
    debugPrint(url.toString());

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    List<UserDataListModel> temp = [];
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      debugPrint(response.body);
      for (Map itemData in data) {
        temp.add(UserDataListModel.fromJson(itemData));
      }
      // await SharedService.setUserData(userDataResponseJson(response.body) );
      return temp;

      // return true;
    } else {
      debugPrint(response.body);
      debugPrint('fail');
      return temp;
    }
  }


  static Future<List<WordsModel>> getWords() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'apiKey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlwbXFqcnh4ZWdkcmdmaGZ6YnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NjgyMjAsImV4cCI6MjAzNTI0NDIyMH0.2-8VUqjYHxxXThIBmKgsCN1yStSN-XwKiorcpbitUHk'
    };
    var url = Uri.parse(Config.apiHttp + Config.apiAuth + Config.getWordsEndPoint);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    List<WordsModel> temp = [];
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      debugPrint('success words endPoint hit');
      for (Map itemData in data) {
        temp.add(WordsModel.fromJson(itemData));
      }
      return temp;
    } else {
      debugPrint('getting Languages failed');
      debugPrint(response.body);
      return temp;
    }
  }
}