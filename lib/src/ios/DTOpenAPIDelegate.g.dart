//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:ddshare_fluttify/src/ios/ios.export.g.dart';
import 'package:ddshare_fluttify/src/android/android.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
mixin DTOpenAPIDelegate on NSObject {
  @mustCallSuper
  Future<void> onReq(DTBaseReq req) {
    kNativeObjectPool.add(req);

    if (!kReleaseMode) {
      debugPrint('onReq::kNativeObjectPool: $kNativeObjectPool');
    }
  }

  @mustCallSuper
  Future<void> onResp(DTBaseResp resp) {
    kNativeObjectPool.add(resp);

    if (!kReleaseMode) {
      debugPrint('onResp::kNativeObjectPool: $kNativeObjectPool');
    }
  }
}
