import 'package:dependency_injection_provider/services/authentication_service.dart';
import 'package:dependency_injection_provider/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends BaseModel {
  LoginViewModel({@required AuthenticationService authenticationService})
    : _authenticationService = authenticationService;

  AuthenticationService _authenticationService;

  Future<bool>login(String userIdText) async {
    setBusy(true);
    var userId = int.parse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}