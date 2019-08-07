import 'dart:async';

import 'package:dependency_injection_provider/locator.dart';
import 'package:dependency_injection_provider/models/user.dart';
import 'package:dependency_injection_provider/services/api.dart';

class AuthenticationService {
Api _api = locator<Api>();

  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    var fetchUser = await _api.getUserProfile(userId);
    var hasUser = fetchUser != null;
    if (hasUser) {
      _userController.add(fetchUser);
    }
    return hasUser;
  }
}