import 'package:flutter/material.dart';

class AppRaisedButton extends StatelessWidget{
  final String text;
  final Function onPressed;

  const AppRaisedButton({Key key,
    this.text,
    this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          text,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }

}