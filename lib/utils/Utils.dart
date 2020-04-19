
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils{
  static String baseURL = "https://468609.erply.com/";
  static String SESSION_KEY = "session_key";
  static String USERNAME_KEY = "username_key";
  static String PASSWORD_KEY = "password_key";
  static String IS_LOG_IN_KEY = "is_login_key";
  static const double padding_15 = 15.0;

}

addStringToSF(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

addBoolToSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, true);
}

Future<String> getStringValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString(key);
  return stringValue;
}

Future<bool> getBoolValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key);
}

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}
