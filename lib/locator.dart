import 'package:enlightenfy/core/services/user_details_service.dart';
import 'package:enlightenfy/core/viewmodels/user_details_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/services/connectivity.dart';
import 'core/viewmodels/auth_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => UserDetailService());

  locator.registerFactory(() => AuthModel());
  locator.registerFactory(() => UserDetailsModel());
}
