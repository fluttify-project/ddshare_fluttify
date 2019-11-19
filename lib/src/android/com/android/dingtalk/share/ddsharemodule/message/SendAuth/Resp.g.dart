//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:ddshare_fluttify/src/ios/ios.export.g.dart';
import 'package:ddshare_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class com_android_dingtalk_share_ddsharemodule_message_SendAuth_Resp extends java_lang_Object  {
  // generate getters
  Future<String> get_code() async {
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod("com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp::get_code", {'refId': refId});
  
    return result;
  }
  
  Future<String> get_state() async {
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod("com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp::get_state", {'refId': refId});
  
    return result;
  }
  

  // generate setters
  Future<void> set_code(String code) async {
    await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp::set_code', {'refId': refId, "code": code});
  
  
  }
  
  Future<void> set_state(String state) async {
    await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp::set_state', {'refId': refId, "state": state});
  
  
  }
  

  // generate methods
  Future<int> getType() async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp@$refId::getType([])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp::getType', {"refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
  Future<void> toBundle(android_os_Bundle bundle) async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp@$refId::toBundle([])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp::toBundle', {"bundle": bundle.refId, "refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
  Future<void> fromBundle(android_os_Bundle bundle) async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp@$refId::fromBundle([])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Resp::fromBundle', {"bundle": bundle.refId, "refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
}