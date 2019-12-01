//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:ddshare_fluttify/src/ios/ios.export.g.dart';
import 'package:ddshare_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class DTMediaAlipayObject extends NSObject {
  // generate getters
  Future<String> get_pageURL() async {
    final result = await MethodChannel('com.fluttify/ddshare_fluttify')
        .invokeMethod("DTMediaAlipayObject::get_pageURL", {'refId': refId});

    return result;
  }

  // generate setters
  Future<void> set_pageURL(String pageURL) async {
    await MethodChannel('com.fluttify/ddshare_fluttify').invokeMethod(
        'DTMediaAlipayObject::set_pageURL',
        {'refId': refId, "pageURL": pageURL});
  }

// generate methods

}
