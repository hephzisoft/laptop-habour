import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../utils/constant.dart';

class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();

    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future<bool> removeString(String key) async {
    return await _pref.remove(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  String getString(String key) {
    return _pref.getString(key) ?? '';
  }

  String getUserToken() {
    return _pref.getString(AppConstants.userToken) ?? "";
  }

  UserModel getUserProfile() {
    var getProfile = _pref.getString(AppConstants.userToken);
    print(getProfile);
    var profileJson = jsonDecode(getProfile!);

    var userProfile = UserModel.fromJson(profileJson);
    print(userProfile);
    return userProfile;
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.userToken) != null ? true : false;
  }
}
