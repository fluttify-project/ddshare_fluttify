//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:ddshare_fluttify/src/ios/ios.export.g.dart';
import 'package:ddshare_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class com_android_dingtalk_share_ddsharemodule_plugin_SignatureCheck extends java_lang_Object  {
  // generate getters
  

  // generate setters
  

  // generate methods
  static Future<String> getMD5Signature(android_content_Context context, String packageName) async {
    // print log
    if (fluttifyLogEnabled) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.plugin.SignatureCheck::getMD5Signature([\'packageName\':$packageName])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.plugin.SignatureCheck::getMD5Signature', {"context": context.refId, "packageName": packageName});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
}