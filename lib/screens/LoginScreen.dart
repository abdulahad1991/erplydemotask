import 'package:erplytest/bloc/VerificationBloc.dart';
import 'package:erplytest/widgets/GenericWidgets.dart';
import 'package:flutter/material.dart';

import '../Utils.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ERPLY"),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: _loginContent()),
    );
  }
}

Widget _loginContent() {
  return _loginFields();
}

Widget _loginFields() {
  VerificationBloc _bloc = VerificationBloc();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  return Container(
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
          child: textField("Enter account #", accountController, true),
        ),
        Padding(
          padding: const EdgeInsets.all(Utils.padding_15),
          child: textField("Enter username", usernameController, false),
        ),
        Padding(
          padding: const EdgeInsets.all(Utils.padding_15),
          child: textField("Enter password", passwordController, false),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: raisedButton("Login", () {
            validateFields(
                accountController, usernameController, passwordController);
          }),
        ),
      ],
    ),
  );
}

void validateFields(
    TextEditingController accountController,
    TextEditingController usernameController,
    TextEditingController passwordController) {
  if (accountController.text.isEmpty) {
  } else if (accountController.text.length < 6) {
  } else if (usernameController.text.isEmpty) {
  } else if (passwordController.text.isEmpty) {}
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}
