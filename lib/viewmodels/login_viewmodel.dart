import 'package:dependency_injection_provider/locator.dart';
import 'package:dependency_injection_provider/services/authentication_service.dart';
import 'package:dependency_injection_provider/utilities/enums/viewstate.dart';
import 'package:dependency_injection_provider/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService = locator<AuthenticationService>();

  String _errorMessage;
  String get errorMessage => _errorMessage;

  Future<bool>login(String userIdText) async {
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);
    if (userId == null) {
      _errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }
    var success = await _authenticationService.login(userId);
    setState(ViewState.Idle);
    return success;
  }
}