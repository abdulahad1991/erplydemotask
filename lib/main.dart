import 'package:erplytest/utils/Utils.dart';
import 'package:erplytest/models/UserModel.dart';
import 'package:erplytest/screens/LoginScreen.dart';
import 'package:erplytest/screens/ProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ERPLY',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen()/*FutureBuilder<bool>(
          future: getBoolValuesSF(Utils.IS_LOG_IN_KEY),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
            if(snapshot.data){
              return ProductScreen();
            }else {
              return LoginScreen();
            }
          },
        )*/,
      ),
    );
  }
}
