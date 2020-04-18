
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Utils{
  static String baseURL = "https://468609.erply.com/";
  static const double padding_15 = 15.0;

}

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}
