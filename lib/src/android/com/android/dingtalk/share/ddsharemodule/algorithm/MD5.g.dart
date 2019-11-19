//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:ddshare_fluttify/src/ios/ios.export.g.dart';
import 'package:ddshare_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class com_android_dingtalk_share_ddsharemodule_algorithm_MD5 extends java_lang_Object  {
  // generate getters
  

  // generate setters
  

  // generate methods
  static Future<String> getMessageDigest(List<int> bytes) async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.algorithm.MD5::getMessageDigest([\'bytes\':$bytes])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.algorithm.MD5::getMessageDigest', {"bytes": bytes});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
  static Future<List<int>> getRawDigest(List<int> bytes) async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.algorithm.MD5::getRawDigest([\'bytes\':$bytes])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.algorithm.MD5::getRawDigest', {"bytes": bytes});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
  static Future<String> getMD5(String var0) async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.algorithm.MD5::getMD5([\'var0\':$var0])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.algorithm.MD5::getMD5', {"var0": var0});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
}