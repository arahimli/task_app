
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/presentation/pages/home/page.dart';
import 'package:task_app/presentation/pages/main/page.dart';

import '../../blocs/authentication/bloc.dart';
import 'view.dart';



class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  static const pageUrl = '/app-navigate';


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return const HomePage();
        } else if (state is AuthenticationInitial) {
          return const AppLoadingView();
        } else {
          return const MainPage();
        }
      },
    );
  }
}