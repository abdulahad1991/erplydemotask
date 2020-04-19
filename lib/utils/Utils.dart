
import 'dart:convert';

import 'package:erplytest/models/UserModel.dart';
import 'package:erplytest/models/VerificationResponse.dart';
import 'package:erplytest/networking/API.dart';
import 'package:erplytest/screens/LoginScreen.dart';
import 'package:erplytest/utils/ErrorCodes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils{
  static String baseURL = "https://468609.erply.com/";
  static String SESSION_KEY = "session_key";
  static String ACCOUNT_KEY = "account_key";
  static String USERNAME_KEY = "username_key";
  static String PASSWORD_KEY = "password_key";
  static const double padding_15 = 15.0;

}

addStringToSF(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<String> getStringValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString(key);
  return stringValue ?? "";
}

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

Future<Status> loginUser(BuildContext context,[String account,String username,String password]) async{
 try{
   if(account == null){
     account = await getStringValuesSF(Utils.ACCOUNT_KEY);
     username = await getStringValuesSF(Utils.USERNAME_KEY);
     password = await getStringValuesSF(Utils.PASSWORD_KEY);
   }
   var res = await API().get<Map<String, dynamic>>(params: {
     "clientCode": account,
     "username": username,
     "password": password,
     "request": "verifyUser"
   });
   if(res.data['status']['errorCode']==0){
     var data =
     VerificationResponse.fromJson(res.data);
     ScopedModel.of<UserModel>(context)
         .setSessionKey(data.records[0].sessionKey);
     addStringToSF(Utils.SESSION_KEY, data.records[0].sessionKey);
     addStringToSF(Utils.ACCOUNT_KEY, account);
     addStringToSF(Utils.USERNAME_KEY, username);
     addStringToSF(Utils.PASSWORD_KEY, password);
   }
   return Status.fromJson(res.data['status']);
 }catch(e){
   return null;
 }
}

gotoHome(BuildContext context){
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginScreen()));
}