import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loggy/loggy.dart';

import 'data/repositories/authentication/authentication.dart';
import 'domain/uses_cases/config/get_it.dart';
import 'domain/uses_cases/config/main_config.dart';
import 'domain/uses_cases/config/main_utils.dart';
import 'presentation/blocs/app/app_bloc_observer.dart';
import 'presentation/blocs/authentication/bloc.dart';
import 'presentation/pages/app/app.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  setupLocator();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );

  Bloc.observer = AppBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
        AuthenticationBloc(AuthenticationRepository())
          ..add(AuthenticationStarted()),
      ),
    ],
    child: EasyLocalization(
        path: MainConfig.langPath,
        startLocale: await MainConfig.defaultLanguage.startLocale(),
        // fallbackLocale: MainConfig.defaultLanguage.toLocale(),
        supportedLocales: MainUtils.getSupportedLanguages(),
        child: MainApp(
            connectivity: Connectivity()
        )
    ),
  ));
}




