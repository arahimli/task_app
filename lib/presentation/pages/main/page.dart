import 'package:flutter/material.dart';

import 'view.dart';

class MainPage extends StatefulWidget {

  static const String pageUrl = '/';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const MainView();
  }
}
