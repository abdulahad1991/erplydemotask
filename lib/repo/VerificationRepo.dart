

import 'package:erplytest/models/VerificationResponse.dart';
import 'package:erplytest/networking/ApiProvider.dart';

class VerificationRepo {
  ApiProvider _provider = ApiProvider();

  Future<VerificationResponse> verifyUser(String accountNumber, String userName, String password) async {
    final response = await _provider.get("clientCode="+accountNumber+"&username="+userName+"&password="+password+"&request=verifyUser");
    return VerificationResponse.fromJson(response);
  }
}