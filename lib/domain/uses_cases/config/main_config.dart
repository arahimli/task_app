
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../models/language/language_model.dart';

class MainConfig {
  MainConfig._();

  ///
  /// AppVersion
  /// For your app, you need to change according based on your app version
  ///
  static const bool debug = true;

  static const String appName = debug ? 'Task app test' : 'Task app';


  static const String appVersion = '1.0.0';

  static const int appVersionAndroid = 1;
  static const int appVersionIos = 1;

  static const String appUrl = 'https://taskapp.az';
  static const String appPlayStoreUrl = 'https://play.google.com/store/apps/details?id=az.formapp';
  static const String appAppStoreUrl = 'https://apps.apple.com/az/app/formapp/idxxxxxxx';


  ///
  /// Animation Duration
  ///
  static const Duration animationDuration = Duration(milliseconds: 500);


  ///
  /// Fonts Family Config
  /// Before you declare you here,
  /// 1) You need to add font under assets/fonts/
  /// 2) Declare at pubspec.yaml
  /// 3) Update your font family name at below
  ///
  static const String mainDefaultFontFamily = 'Mulish';

  /// Default Language
// static const main_default_language = 'en';

// static const main_language_list = [Locale('en', 'EN'), Locale('ar', 'DZ')];
  static const String mainAppDbName = 'main_db.db';

  ///
  /// For default language change, please check
  /// LanguageFragment for language code and country code
  /// ..............................................................
  /// Language             | Language Code     | Country Code
  /// ..............................................................
  /// "Azerbaijani"            | "az"              | "AZ"
  /// "English"            | "en"              | "EN"
  /// "Russian"            | "ru"              | "RU"
  /// ..............................................................
  ///

  static const String langPath = 'assets/langs';
  static final Language defaultLanguage =  Language(languageCode: 'az', countryCode: 'AZ', name: 'Azerbaijani');

  static final List<Language> mainSupportedLanguageList = <Language>[
    Language(languageCode: 'az', countryCode: 'AZ', name: 'Azerbaijani'),
    Language(languageCode: 'en', countryCode: 'EN', name: 'English'),
  ];
  static List<LocalizationsDelegate> localizationsDelegates(BuildContext context){
    return <LocalizationsDelegate<dynamic>>[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      EasyLocalization.of(context)!.delegate,
      DefaultCupertinoLocalizations.delegate

    ];
  }

  ///
  /// Price Format
  /// Need to change according to your format that you need
  /// E.g.
  /// ",##0.00"   => 2,555.00
  /// "##0.00"    => 2555.00
  /// ".00"       => 2555.00
  /// ",##0"      => 2555
  /// ",##0.0"    => 2555.0
  ///
  static const String priceFormat = ',###.00';

  ///
  /// Date Time Format
  ///
  static const String dateFormat = 'dd-MM-yyyy HH:mm:ss';

  ///
  /// iOS App No
  ///
  static const String iOSAppStoreId = '';

  ///
  /// Tmp Image Folder Name
  ///
  static const String tmpImageFolderName = 'tmpfolder';

  ///
  /// Image Loading
  ///
  /// - If you set "true", it will load thumbnail image first and later it will
  ///   load full image
  /// - If you set "false", it will load full image directly and for the
  ///   placeholder image it will use default placeholder Image.
  ///
  // static const bool USE_THUMBNAIL_AS_PLACEHOLDER = true;

  ///
  /// Image Size
  ///
  static const int profileImageSize = 512;

  ///
  /// Default Limit
  ///
  static const int defaultLoadingLimit = 30;

  ///
  ///Login Setting
  ///
  static bool showFacebookLogin = false;
  static bool showGoogleLogin = true;
  static bool showPhoneLogin = true;

  ///
  ///Release Settings
  ///
  static bool kReleaseMode = true;


}