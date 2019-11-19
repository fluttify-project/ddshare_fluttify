//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:ddshare_fluttify/src/ios/ios.export.g.dart';
import 'package:ddshare_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class com_android_dingtalk_share_ddsharemodule_message_SendAuth_Req extends java_lang_Object  {
  // generate getters
  Future<String> get_scope() async {
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod("com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req::get_scope", {'refId': refId});
  
    return result;
  }
  
  Future<String> get_state() async {
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod("com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req::get_state", {'refId': refId});
  
    return result;
  }
  

  // generate setters
  Future<void> set_scope(String scope) async {
    await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req::set_scope', {'refId': refId, "scope": scope});
  
  
  }
  
  Future<void> set_state(String state) async {
    await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req::set_state', {'refId': refId, "state": state});
  
  
  }
  

  // generate methods
  Future<void> toBundle(android_os_Bundle bundle) async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req@$refId::toBundle([])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req::toBundle', {"bundle": bundle.refId, "refId": refId});
  
  
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
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req@$refId::fromBundle([])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req::fromBundle', {"bundle": bundle.refId, "refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
  Future<int> getType() async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req@$refId::getType([])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req::getType', {"refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
  Future<bool> checkArgs() async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req@$refId::checkArgs([])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req::checkArgs', {"refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
  Future<int> getSupportVersion() async {
    // print log
    if (!kReleaseMode) {
      print('fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req@$refId::getSupportVersion([])');
    }
  
    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('com.android.dingtalk.share.ddsharemodule.message.SendAuth.Req::getSupportVersion', {"refId": refId});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
    
      return result;
    }
  }
  
}