import 'dart:ffi';

import 'package:erplytest/utils/Utils.dart';
import 'package:erplytest/models/ProductsResponse.dart';
import 'package:erplytest/models/UserModel.dart';
import 'package:erplytest/networking/API.dart';
import 'package:erplytest/widgets/GenericWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

List<Records> records;

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ERPLY Products"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: _fetchProducts(context),
        builder: (context, result) {
          if (result.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _productListing(records, context);
          }
        },
      ),
    );
  }
}

Future<Void> _fetchProducts(BuildContext context) {
  return API(context)
      .get<Map<String, dynamic>>(params: {
    "clientCode": "468609",
    "sessionKey": /*"643456d966bb72bd03ae7bf0a8d9a08fba0d0f7b5cc5"*/ "693fce851be29bd53a9d706ae48b04023ce541a8fc88",
    "request": "getProducts"
  })
      .then((res) {
        if(res.data['status']['responseStatus'] == 'error'){

        }else {
          records = ProductsResponse.fromJson(res.data).records;
        }
  })
      .catchError((e) {
    debugPrint("ADI "+e.toString());
  });
}

Widget _productListing(List<Records> records, BuildContext context) {
  return Container(
    child: RefreshIndicator(
      onRefresh: ()=>_fetchProducts(context),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: records.length,
          itemBuilder: (BuildContext context, int index) {
            return productRowItem(records[index].code,
                records[index].name,
                "£"+records[index].price.toString(),
                records[index].description, records[index].images);
          }),
    ),
  );
}
