import 'package:erplytest/models/ProductsResponse.dart';
import 'package:flutter/material.dart';

Widget productRowItem(String code, String name, String price,
    String description, List<Images> images) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: productContent(code, name, price, description, images),
      ),
    ),
  );
}

Widget productContent(
    String code, String name, String price, String description, List<Images> images) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "Code: " + code,
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "Price: " + price,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontStyle: FontStyle.italic),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
        images != null?Container(
          height: 50.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.fitWidth,
                      placeholder: 'assets/images/image_placeholder.jpg',
                      image: images[index].fullURL,
                    ),
                  ),
                );
              },
            ),
          ):Container(),
      ],
    ),
  );
}

Widget productCode(String code) {
  return Container(
    child: Text(
      code,
      style: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
}
