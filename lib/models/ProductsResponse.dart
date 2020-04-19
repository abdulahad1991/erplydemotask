class ProductsResponse {
  Status status;
  List<Records> records;

  ProductsResponse({this.status, this.records});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['records'] != null) {
      records = new List<Records>();
      json['records'].forEach((v) {
        records.add(new Records.fromJson(v));
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

class Status {
  String request;
  int requestUnixTime;
  String responseStatus;
  int errorCode;
  double generationTime;
  int recordsTotal;
  int recordsInResponse;

  Status(
      {this.request,
        this.requestUnixTime,
        this.responseStatus,
        this.errorCode,
        this.generationTime,
        this.recordsTotal,
        this.recordsInResponse});

  Status.fromJson(Map<String, dynamic> json) {
    request = json['request'];
    requestUnixTime = json['requestUnixTime'];
    responseStatus = json['responseStatus'];
    errorCode = json['errorCode'];
    generationTime = json['generationTime'];
    recordsTotal = json['recordsTotal'];
    recordsInResponse = json['recordsInResponse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request'] = this.request;
    data['requestUnixTime'] = this.requestUnixTime;
    data['responseStatus'] = this.responseStatus;
    data['errorCode'] = this.errorCode;
    data['generationTime'] = this.generationTime;
    data['recordsTotal'] = this.recordsTotal;
    data['recordsInResponse'] = this.recordsInResponse;
    return data;
  }
}

class Records {
  int productID;
  String name;
  String code;
  int price;
  String description;
  List<Images> images;

  Records(
      {this.productID,
        this.name,
        this.code,
        this.price,
        this.description,
        this.images});

  Records.fromJson(Map<String, dynamic> json) {
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