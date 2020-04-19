import 'dart:io';

import 'package:erplytest/utils/ErrorCodes.dart';
import 'package:erplytest/utils/Utils.dart';
import 'package:erplytest/widgets/AppRaisedButton.dart';
import 'package:erplytest/widgets/AppTextField.dart';
import 'package:flutter/material.dart';

import 'ProductScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;


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
                            isLoading: isLoading,
                            onPressed: () async {
                              FocusScope.of(childContext).requestFocus(FocusNode());
                              if (Form.of(childContext).validate()) {
                                final result = await InternetAddress.lookup('www.google.com');
                                if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  var res = await loginUser(
                                      context,
                                      accountController.text,
                                      usernameController.text,
                                      passwordController.text);
                                  if (res.errorCode == 0) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductScreen()));
                                  } else {
                                    Scaffold.of(childContext).showSnackBar(SnackBar(content: Text(ErrorCodes().errorMessage[res.errorCode]),));
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
                                }else {
                                  Scaffold.of(childContext).showSnackBar(SnackBar(content: Text("Please connect to the internet"),));
                                }
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
