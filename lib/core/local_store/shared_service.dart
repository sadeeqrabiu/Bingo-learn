


import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';

import '../models/login_response.dart';

class SharedService{

  static Future<bool> isLoggedIn() async {
    var isKeyExit = await APICacheManager().isAPICacheKeyExist("token");
    return isKeyExit;
  }

  //Login response
  static Future<LoginResponse?> loginDetails() async {
    var isKeyExit = await APICacheManager().isAPICacheKeyExist("token");
    if (isKeyExit) {
      var cacheData = await APICacheManager().getCacheData("token");
      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

  //setLoginDetail after login
  static Future<void> setLoginDetails(LoginResponse model) async {
    APICacheDBModel cacheDBModel =
    APICacheDBModel(key: "token", syncData: jsonEncode(model.toJson()));
    await APICacheManager().addCacheData(cacheDBModel);
  }
}