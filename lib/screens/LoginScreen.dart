import 'package:erplytest/utils/Utils.dart';
import 'package:erplytest/models/UserModel.dart';
import 'package:erplytest/models/VerificationResponse.dart';
import 'package:erplytest/networking/API.dart';
import 'package:erplytest/widgets/AppRaisedButton.dart';
import 'package:erplytest/widgets/AppTextField.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProductScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ERPLY"),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: _loginContent(context)),
    );
  }

  Widget _loginContent(BuildContext context) {
    return _loginFields(context);
  }

  Widget _loginFields(BuildContext context) {
    final TextEditingController accountController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Form(
      child: Builder(
          builder: (childContext) => (Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(Utils.padding_15),
                        child: Text(
                          "Client Login",
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Utils.padding_15),
                        child: AppTextField(
                          hint: "Enter account #",
                          textEditingController: accountController,
                          isNumberOnly: true,
                          isPassword: false,
                          validator: (v) => v.length < 6
                              ? "Account number cannot be less than 6"
                              : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Utils.padding_15),
                        child: AppTextField(
                          hint: "Enter username",
                          textEditingController: usernameController,
                          isNumberOnly: false,
                          isPassword: false,
                          validator: (v) =>
                              v.isEmpty ? "Please enter username" : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Utils.padding_15),
                        child: AppTextField(
                          hint: "Enter password",
                          textEditingController: passwordController,
                          isNumberOnly: false,
                          isPassword: true,
                          validator: (v) =>
                              v.isEmpty ? "Please enter password" : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: AppRaisedButton(
                            text: "Login",
                            onPressed: () {
                              if (Form.of(childContext).validate()) {
                                API(context).get<Map<String, dynamic>>(params: {
                                  "clientCode": accountController.text,
                                  "username": usernameController.text,
                                  "password": passwordController.text,
                                  "request": "verifyUser"
                                }).then((res) {
                                  var data =
                                      VerificationResponse.fromJson(res.data);
                                  ScopedModel.of<UserModel>(context)
                                      .setSessionKey(data.records[0].sessionKey);
                                  addStringToSF(Utils.SESSION_KEY, data.records[0].sessionKey);
                                  addStringToSF(Utils.USERNAME_KEY, usernameController.text);
                                  addStringToSF(Utils.PASSWORD_KEY, passwordController.text);
                                  addBoolToSF(Utils.IS_LOG_IN_KEY);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductScreen()));
                                }).catchError((e) {
                                  debugPrint(e.toString());
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}