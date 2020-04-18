import 'dart:async';

import 'package:erplytest/models/VerificationResponse.dart';
import 'package:erplytest/networking/Response.dart';
import 'package:erplytest/repo/VerificationRepo.dart';

class VerificationBloc {
  VerificationRepo _verificationRepository;
  StreamController _verificationController;

  StreamSink<Response<VerificationResponse>> get chuckListSink =>
      _verificationController.sink;

  Stream<Response<VerificationResponse>> get verificationStream =>
      _verificationController.stream;

  ChuckCategoryBloc() {
    _verificationController = StreamController<Response<VerificationResponse>>();
    _verificationRepository = VerificationRepo();
    fetchCategories();
  }

  fetchCategories() async {
    chuckListSink.add(Response.loading('Getting Chuck Categories.'));
    try {
      VerificationResponse chuckCats =
      await _verificationRepository.verifyUser("accountNumber", "userName", "password");
      chuckListSink.add(Response.completed(chuckCats));
    } catch (e) {
      chuckListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _verificationController?.close();
  }
}