
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textField(String hint, TextEditingController textEditingController, bool isNumberOnly){
  return TextField(
    controller: textEditingController,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint
    ),
    keyboardType: isNumberOnly?TextInputType.number:TextInputType.text,
  );
}

Widget raisedButton(String buttonText, Function onPressed){
  return Container(
    height: 50.0,
    width: 250.0,
    child: RaisedButton(
      onPressed: onPressed,
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
        side: BorderSide(color: Colors.blue),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
    ),
  );
}