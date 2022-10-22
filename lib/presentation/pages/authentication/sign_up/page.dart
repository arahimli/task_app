import 'package:flutter/material.dart';
import 'view.dart';

class SignUpPage extends StatefulWidget {
  static const pageUrl = '/sign-up';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return const SignUpView();
  }
}
