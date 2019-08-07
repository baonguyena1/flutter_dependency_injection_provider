
import 'package:dependency_injection_provider/services/api.dart';
import 'package:dependency_injection_provider/services/authentication_service.dart';
import 'package:dependency_injection_provider/viewmodels/comment_viewmodel.dart';
import 'package:dependency_injection_provider/viewmodels/home_viewmodel.dart';
import 'package:dependency_injection_provider/viewmodels/login_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  // Register Services
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  
  // Register Models
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => CommentViewModel());
}