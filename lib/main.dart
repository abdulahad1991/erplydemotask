import 'dart:async';

import 'package:erplytest/utils/Utils.dart';
import 'package:erplytest/models/UserModel.dart';
import 'package:erplytest/screens/LoginScreen.dart';
import 'package:erplytest/screens/ProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String sessionKey = "";
  UserModel userModel;

  @override
  void initState() {
    super.initState();
    userModel = UserModel();
    Timer timer;
    timer = Timer(Duration(milliseconds: 100),(){
      timer.cancel();
      setState(() {
        (() async{
          sessionKey = await getStringValuesSF(Utils.SESSION_KEY);
          userModel.setSessionKey(sessionKey,shouldUpdate: false);
        })();
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: userModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ERPLY',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: sessionKey.isNotEmpty ? ProductScreen() : LoginScreen(),
      ),
    );
  }
}