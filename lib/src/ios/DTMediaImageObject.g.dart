//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:ddshare_fluttify/src/ios/ios.export.g.dart';
import 'package:ddshare_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class DTMediaImageObject extends NSObject  {
  // generate getters
  Future<String> get_imageURL() async {
    final result = await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod("DTMediaImageObject::get_imageURL", {'refId': refId});
  
    return result;
  }
  

  // generate setters
  Future<void> set_imageURL(String imageURL) async {
    await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod('DTMediaImageObject::set_imageURL', {'refId': refId, "imageURL": imageURL});
  
  
  }
  

  // generate methods
  
}