import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language {
  final String languageCode;
  final String countryCode;
  final String name;

  Language({required this.languageCode, required this.countryCode, required this.name});

  Locale toLocale() {
    // Platform.localeName;
    return Locale(languageCode, countryCode);
  }
  Future<Locale> startLocale() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('language')) {
      if(Platform.localeName.contains('en')){
        log("if");
        await pref.setString('language', 'en');
        return const Locale('en', 'EN');
      }else{
        log("else");
        await pref.setString('language', 'az');
        return const Locale('az', "AZ");
      }
    }else {
      log("else 2");
      return Locale(pref.getString('language')!, pref.getString('language').toString().toUpperCase());
    }

  }
}