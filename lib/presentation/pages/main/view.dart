import 'package:flutter/material.dart';

import '../../../domain/uses_cases/common/utlis.dart';
import '../../../generated/assets.dart';
import '../../widgets/components/buttons/big_borderd_button.dart';
import '../../widgets/components/buttons/big_unborderd_button.dart';
import '../authentication/sign_in/page.dart';
import '../authentication/sign_up/page.dart';

class MainView extends StatefulWidget {


  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(Assets.imagesLogo, height: MediaQuery.of(context).size.height * 0.4,),
            Column(
              children: [
                BigUnBorderedButton(
                  horizontal: 16,
                  text: Utils.getString(context, "main_page__login_button_text"),
                  onTap: (){
                    Navigator.pushNamed(context, SignInPage.pageUrl);
                  },
                ),
                const SizedBox(height: 16,),
                BigBorderedButton(
                  onTap: (){
                    Navigator.pushNamed(context, SignUpPage.pageUrl);
                  },
                  horizontal: 16,
                  text: Utils.getString(context, "main_page__register_button_text"),
                ),
              ],
            )
          ],
        )
    );
  }
}
