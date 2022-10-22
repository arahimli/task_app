import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../data/repositories/authentication/authentication.dart';
import '../../../data/repositories/database/database_repository.dart';
import '../../../presentation/blocs/signin/bloc.dart';
import '../../../presentation/blocs/signup/bloc.dart';
import '../../../presentation/pages/authentication/sign_in/page.dart';
import '../../../presentation/pages/authentication/sign_up/page.dart';
import '../../../presentation/pages/home/page.dart';
import '../../../presentation/pages/navigate/page.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case BlocNavigate.pageUrl:
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
          const BlocNavigate()
      );
    case HomePage.pageUrl:
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
          const HomePage());

    case SignInPage.pageUrl:
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              MultiBlocProvider(
                  providers: [
                    BlocProvider<SignInFormBloc>(create: (BuildContext context) => SignInFormBloc(GetIt.instance<AuthenticationRepository>())),
                  ],
                  child: const SignInPage()
              ));
    case SignUpPage.pageUrl:
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              MultiBlocProvider(
                  providers: [
                    BlocProvider<SignUpFormBloc>(create: (BuildContext context) => SignUpFormBloc(GetIt.instance<AuthenticationRepository>(), GetIt.instance<DatabaseRepository>())),
                  ],
                  child: const SignUpPage()
              ));

    default:
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
          const HomePage());
  }
}