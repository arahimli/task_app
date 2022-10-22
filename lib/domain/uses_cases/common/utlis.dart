import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mime/mime.dart';

class Utils {
  Utils._();

  static String getString(BuildContext context, String key) {
    if (key != '') {
      return tr(key);
    } else {
      return '';
    }
  }
  static String getStringWithoutContext(String? key) {
    if (key != '') {
      return tr(key!);
    } else {
      return '';
    }
  }

  static bool isImage(String path) {
    final mimeType = lookupMimeType(path);

    return mimeType != null ? mimeType.startsWith('image/') : false;
  }

  static String getExtensionFile(String path) {

    return extensionFromMime(path).split('.').last;
  }

// Define a reusable function
  static String generateRandomString(int length) {
    final _random = Random();
    const _availableChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => _availableChars[_random.nextInt(_availableChars.length)])
        .join();

    return randomString;
  }

// Define a reusable function

  static void focusClose(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }


// Define a reusable function
  static int findRangeIndex({required List<int> listData, required int value}) {
    int returnVal = 0;
    if(listData.length > 1){
      for(int i = 0; i < [[0], listData].expand((x) => x).toList().length-2; i++){
        if(listData[i] <= value && listData[i+1] > value ) {
          returnVal = i+1;
          break;
        }
      }
    }
    return returnVal;
  }


  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

}

