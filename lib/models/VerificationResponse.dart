class VerificationResponse {
  Status status;
  List<Records> records;

  VerificationResponse({this.status, this.records});

  VerificationResponse.fromJson(Map<String, dynamic> json) {
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
  String userID;
  String userName;
  String employeeID;
  String employeeName;
  String groupID;
  String groupName;
  String ipAddress;
  String sessionKey;
  String identityToken;

  Records(
      {this.userID,
        this.userName,
        this.employeeID,
        this.employeeName,
        this.groupID,
        this.groupName,
        this.ipAddress,
        this.sessionKey,
        this.identityToken});

  Records.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    employeeID = json['employeeID'];
    employeeName = json['employeeName'];
    groupID = json['groupID'];
    groupName = json['groupName'];
    ipAddress = json['ipAddress'];
    sessionKey = json['sessionKey'];
    identityToken = json['identityToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['employeeID'] = this.employeeID;
    data['employeeName'] = this.employeeName;
    data['groupID'] = this.groupID;
    data['groupName'] = this.groupName;
    data['ipAddress'] = this.ipAddress;
    data['sessionKey'] = this.sessionKey;
    data['identityToken'] = this.identityToken;
    return data;
  }
}