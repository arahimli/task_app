
// Flutter imports
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// Project imports
import '../../../domain/uses_cases/common/styles.dart';
import '../../../domain/uses_cases/config/router.dart' as router;
import '../../../domain/uses_cases/common/utlis.dart';
import '../../../domain/uses_cases/config/get_it.dart';
import '../../../domain/uses_cases/config/main_colors.dart';
import '../../../domain/uses_cases/config/main_config.dart';
import '../../widgets/app/app_builder.dart';
import '../../widgets/app/theme.dart';
import '../navigate/page.dart';


class MainApp extends StatelessWidget {
  final Connectivity connectivity;

  const MainApp({Key? key, required this.connectivity}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    // init Color
    MainColors.loadColor(context);
    MainStyles.loadStyle(context);

    final dark = ThemeData.dark();
    final darkButtonTheme = dark.buttonTheme.copyWith(buttonColor: Colors.grey[700]);
    final darkFABTheme = dark.floatingActionButtonTheme;

    final themeCollection = ThemeCollection(
        themes: {
          AppThemes.lightBlue: ThemeData(

              appBarTheme: AppBarTheme(
                  backgroundColor: const Color(0xFFF7F7F8),
                  // This will be applied to the "back" icon
                  iconTheme: const IconThemeData(color: Colors.black),

                  // This will be applied to the action icon buttons that locates on the right side
                  actionsIconTheme: const IconThemeData(color: Colors.black),
                  centerTitle: true,
                  elevation: 1,
                  titleTextStyle: MainStyles.semiBoldTextStyle
              )
          ),
          AppThemes.darkBlue: dark.copyWith(
              primaryColor: MainColors.white,
              // accentColor: Colors.blue,
              buttonTheme: darkButtonTheme,
              floatingActionButtonTheme: darkFABTheme.copyWith(backgroundColor: Colors.blue)),
        }
    );

    return DynamicTheme(
        themeCollection: themeCollection,
        defaultThemeId: AppThemes.lightBlue,


        builder: (BuildContext context, ThemeData theme) {
          return GestureDetector(
            onTap: () {
              Utils.focusClose(context);
            },
            child: AppBuilder(
                builder: (context) {
                  return MaterialApp(
                    builder: (context, child){
                      return MediaQuery(
                          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                          child: child!);
                    },
                    navigatorKey: GetIt.instance<NavigationService>().navigatorKey,
                    debugShowCheckedModeBanner: false,
                    title: MainConfig.appName,
                    theme: theme,
                    initialRoute: BlocNavigate.pageUrl,
                    onGenerateRoute: router.generateRoute,
                    localizationsDelegates: MainConfig.localizationsDelegates(context),
                    // locale: EasyLocalization.of(context)!.locale,
                    // supportedLocales: EasyLocalization.of(context)!.supportedLocales,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                  );
                }
            ),
          );
        });
  }
}


