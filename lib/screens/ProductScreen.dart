import 'package:erplytest/models/ProductsResponse.dart';
import 'package:erplytest/models/UserModel.dart';
import 'package:erplytest/networking/API.dart';
import 'package:erplytest/utils/ErrorCodes.dart';
import 'package:erplytest/utils/Utils.dart';
import 'package:erplytest/widgets/GenericWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ERPLY Products"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<ProductsResponse>(
        future: _fetchProducts(context),
        builder: (context, result) {
          if (result.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (result.data.status.errorCode != 0) {
            return Center(
              child: Text(ErrorCodes().errorMessage[result.data.status.errorCode]),
            );
          } else {
            return _productListing(result.data.records, context);
          }
        },
      ),
    );
  }

  Future<ProductsResponse> _fetchProducts(BuildContext context) async {
    var res = await API().get<Map<String, dynamic>>(params: {
      "clientCode": "468609",
      "sessionKey": ScopedModel.of<UserModel>(context).sessionKey,
      "request": "getProducts"
    });
    if (res.data['status']['responseStatus'] == 'error') {
      if([1054,1055,1056].contains(res.data['status']['errorCode'])){
        var gotLogin = await loginUser(context);
        if (gotLogin.errorCode == 0) {
          return _fetchProducts(context);
        }
      }
      return ProductsResponse(status: Status.fromJson(res.data['status']));
    } else {
      return ProductsResponse.fromJson(res.data);
    }
  }

  Widget _productListing(List<Records> records, BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: () => _fetchProducts(context),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: records.length,
            itemBuilder: (BuildContext context, int index) {
              return productRowItem(
                  records[index].code,
                  records[index].name,
                  "£" + records[index].price.toString(),
                  records[index].description,
                  records[index].images);
            }),
      ),
    );
  }
}
