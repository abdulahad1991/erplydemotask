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
  
}