import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/repositories/apploading/appeal_form_repository.dart';
import '../../../data/repositories/authentication/authentication.dart';
import '../../../data/repositories/database/database_repository.dart';
import '../../../data/repositories/home/home_repository.dart';


GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => HomeRepository());
  getIt.registerLazySingleton(() => AppLoadingRepository());
  getIt.registerLazySingleton(() => AuthenticationRepository());
  getIt.registerLazySingleton(() => DatabaseRepository());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }
}

