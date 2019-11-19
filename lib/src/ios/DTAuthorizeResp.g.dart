//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:ddshare_fluttify/src/ios/ios.export.g.dart';
import 'package:ddshare_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class DTAuthorizeResp extends DTBaseResp  {
  // generate getters
  Future<String> get_accessCode() async {
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod("DTAuthorizeResp::get_accessCode", {'refId': refId});
  
    return result;
  }
  

  // generate setters
  Future<void> set_accessCode(String accessCode) async {
    await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('DTAuthorizeResp::set_accessCode', {'refId': refId, "accessCode": accessCode});
  
  
  }
  

  // generate methods
  
}