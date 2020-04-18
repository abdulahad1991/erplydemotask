import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

Widget productRowItem(String code, String name, String price, String description, List<String> images){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue,width: 1.0,style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Row(
            children: <Widget>[
              productContent(code,name, price, description),
//              productCode(code),
            ],
        ),
      ),
    ),
  );
}

Widget productContent(String code,String name, String price, String description){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(name,style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text("Code: "+code,style: TextStyle(fontSize: 18.0, color: Colors.black),),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text("Price: "+price,style: TextStyle(fontSize: 18.0, color: Colors.black, fontStyle: FontStyle.italic),),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(description,style: TextStyle(fontSize: 16.0, color: Colors.black),),
        ),
      ],
    ),
  );
}

Widget productCode(String code){
  return Container(
      child: Text(
        code,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
  );
}