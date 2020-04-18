import 'package:erplytest/widgets/GenericWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ERPLY Products"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _productListing(),
    );
  }
}

Widget _productListing(){
  return Container(
    child: ListView.builder(itemCount: 10,itemBuilder: (BuildContext context, int index){
        return productRowItem("145678", "Test", "£500","This is test description for the demo",[]);
    }),
  );
}