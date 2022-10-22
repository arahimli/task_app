import 'package:flutter/material.dart';
import 'package:task_app/presentation/pages/authentication/sign_in/view.dart';

class SignInPage extends StatefulWidget {
  static const pageUrl = '/sign-in';
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}
