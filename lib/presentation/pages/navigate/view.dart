import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class AppLoadingView extends StatefulWidget {
  const AppLoadingView({Key? key}) : super(key: key);

  @override
  State<AppLoadingView> createState() => _AppLoadingViewState();
}

class _AppLoadingViewState extends State<AppLoadingView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Image.asset(Assets.imagesLogo, height: MediaQuery.of(context).size.height * 0.4,),
        )
    );
  }
}
