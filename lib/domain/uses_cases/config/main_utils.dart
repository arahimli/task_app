import 'dart:ui';

import 'main_config.dart';

class MainUtils{

  MainUtils._();

  static List<Locale> getSupportedLanguages() {
    return MainConfig.mainSupportedLanguageList.map((lang) => Locale(lang.languageCode, lang.countryCode)).toList();
  }


}