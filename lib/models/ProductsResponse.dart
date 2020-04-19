import 'VerificationResponse.dart';

class ProductsResponse {
  Status status;
  List<ProductRecords> records;

  ProductsResponse({this.status, this.records});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['records'] != null) {
      records = new List<ProductRecords>();
      json['records'].forEach((v) {
        records.add(new ProductRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.records != null) {
      data['records'] = this.records.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductRecords {
  int productID;
  String name;
  String code;
  int price;
  String description;
  List<Images> images;

  ProductRecords(
      {this.productID,
        this.name,
        this.code,
        this.price,
        this.description,
        this.images});

  ProductRecords.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    name = json['name'];
    code = json['code'];
    price = json['price'];
    description = json['description'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['name'] = this.name;
    data['code'] = this.code;
    data['price'] = this.price;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String pictureID;
  String name;
  String thumbURL;
  String smallURL;
  String largeURL;
  String fullURL;
  int external;
  String hostingProvider;
  Null hash;
  Null tenant;

  Images(
      {this.pictureID,
        this.name,
        this.thumbURL,
        this.smallURL,
        this.largeURL,
        this.fullURL,
        this.external,
        this.hostingProvider,
        this.hash,
        this.tenant});

  Images.fromJson(Map<String, dynamic> json) {
    pictureID = json['pictureID'];
    name = json['name'];
    thumbURL = json['thumbURL'];
    smallURL = json['smallURL'];
    largeURL = json['largeURL'];
    fullURL = json['fullURL'];
    external = json['external'];
    hostingProvider = json['hostingProvider'];
    hash = json['hash'];
    tenant = json['tenant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pictureID'] = this.pictureID;
    data['name'] = this.name;
    data['thumbURL'] = this.thumbURL;
    data['smallURL'] = this.smallURL;
    data['largeURL'] = this.largeURL;
    data['fullURL'] = this.fullURL;
    data['external'] = this.external;
    data['hostingProvider'] = this.hostingProvider;
    data['hash'] = this.hash;
    data['tenant'] = this.tenant;
    return data;
  }
}

class VariationDescription {
  String name;
  String value;
  int order;
  int dimensionID;
  int variationID;

  VariationDescription(
      {this.name, this.value, this.order, this.dimensionID, this.variationID});

  VariationDescription.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    order = json['order'];
    dimensionID = json['dimensionID'];
    variationID = json['variationID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['order'] = this.order;
    data['dimensionID'] = this.dimensionID;
    data['variationID'] = this.variationID;
    return data;
  }
}