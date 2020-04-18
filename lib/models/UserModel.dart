import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{
  String _sessionKey;

  void setSessionKey(String sessionKey){
    _sessionKey = sessionKey;
    notifyListeners();
  }

  String get sessionKey{
    return _sessionKey;
  }
}