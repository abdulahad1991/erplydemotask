import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{
  String _sessionKey;

  void setSessionKey(String sessionKey,{bool shouldUpdate = true}){
    _sessionKey = sessionKey;
    if(shouldUpdate){
      notifyListeners();
    }
  }

  String get sessionKey{
    return _sessionKey;
  }
}