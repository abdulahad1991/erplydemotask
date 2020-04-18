import 'package:erplytest/models/UserModel.dart';
import 'package:erplytest/models/VerificationResponse.dart';
import 'package:erplytest/networking/API.dart';
import 'package:erplytest/widgets/AppTextField.dart';
import 'package:erplytest/widgets/GenericWidgets.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
          builder: (childContext)=>(
              Container(
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
                        hint:"Enter account #",
                        textEditingController:accountController,
                        isNumberOnly:true,
                        validator: (v)=>v.length < 6 ? "Account number cannot be less than 6" : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Utils.padding_15),
                      child: AppTextField(hint: "Enter username",
                        textEditingController: usernameController,
                        isNumberOnly: false,
                        validator: (v)=>v.isEmpty ? "Please enter username" : null,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Utils.padding_15),
                      child: AppTextField(hint:"Enter password",
                        textEditingController: passwordController,
                        isNumberOnly: false,
                        validator: (v)=>v.isEmpty ? "Please enter shit" : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: raisedButton("Login", () {
                        if(Form.of(childContext).validate()){
                          API(context).get<Map<String,dynamic>>(params: {
                            "clientCode": "468609",
                            "username": "test",
                            "password": "Testing101",
                            "request": "verifyUser"
                          }).then((res) {
                            var data = VerificationResponse.fromJson(res.data);
                            ScopedModel.of<UserModel>(context).setSessionKey(data.records[0].sessionKey);
                          }).catchError((e){
                            debugPrint(e.toString());
                          });
                        }

//            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                      }),
                    ),
                  ],
                ),
              )
          )
      ),
    );
  }

}
