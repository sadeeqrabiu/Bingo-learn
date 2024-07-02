


import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:bingolearn/src/landing/landing_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/login/login_response.dart';
import '../models/sign_up/sign_up_response.dart';

class SharedService{

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(key: "access_token", syncData: jsonEncode(model.toJson()));
    await APICacheManager().addCacheData(cacheDBModel);
    debugPrint(cacheDBModel.toString());
  }

  static Future<bool> isLoggedIn() async {
    var isKeyExit = await APICacheManager().isAPICacheKeyExist("access_token");
    return isKeyExit;
  }

  //Login response
  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExit = await APICacheManager().isAPICacheKeyExist("access_token");
    if (isKeyExit) {
      var cacheData = await APICacheManager().getCacheData("access_token");
      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

//save SignUp Id for user verification
  static Future<void> signUpID(SignUpResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(key: "signUp_Id", syncData: jsonEncode(model.toJson()));
    await APICacheManager().addCacheData(cacheDBModel);
    debugPrint(cacheDBModel.toString());
  }

  //logic to get the data
  static Future<LoginResponseModel?> getSignUpID() async {
    var isKeyExit = await APICacheManager().isAPICacheKeyExist("signUp_Id");
    if (isKeyExit) {
      var cacheData = await APICacheManager().getCacheData("signUp_Id");
      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }




  //Logout the user
  static Future<void> logout(BuildContext context) async {
    await APICacheManager().emptyCache();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LandingScreen()),
            (route) => false,
      );
    }
  }
}