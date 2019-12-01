//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:ddshare_fluttify/src/ios/ios.export.g.dart';
import 'package:ddshare_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class com_android_dingtalk_share_ddsharemodule_message_SendMessageToDD_Resp
    extends com_android_dingtalk_share_ddsharemodule_message_BaseResp {
  // generate getters

  // generate setters

  // generate methods
  Future<int> getType() async {
    // print log
    if (fluttifyLogEnabled) {
      print(
          'fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendMessageToDD.Resp@$refId::getType([])');
    }

    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify')
        .invokeMethod(
            'com.android.dingtalk.share.ddsharemodule.message.SendMessageToDD.Resp::getType',
            {"refId": refId});

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
    if (fluttifyLogEnabled) {
      print(
          'fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendMessageToDD.Resp@$refId::fromBundle([])');
    }

    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify')
        .invokeMethod(
            'com.android.dingtalk.share.ddsharemodule.message.SendMessageToDD.Resp::fromBundle',
            {"bundle": bundle.refId, "refId": refId});

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
    if (fluttifyLogEnabled) {
      print(
          'fluttify-dart: com.android.dingtalk.share.ddsharemodule.message.SendMessageToDD.Resp@$refId::toBundle([])');
    }

    // invoke native method
    final result = await MethodChannel('com.fluttify/ddshare_fluttify')
        .invokeMethod(
            'com.android.dingtalk.share.ddsharemodule.message.SendMessageToDD.Resp::toBundle',
            {"bundle": bundle.refId, "refId": refId});

    // handle native call

    // convert native result to dart side object
    if (result == null) {
      return null;
    } else {
      return result;
    }
  }
}
