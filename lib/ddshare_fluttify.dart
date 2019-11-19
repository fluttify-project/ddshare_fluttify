import 'dart:async';

import 'package:flutter/services.dart';

class DdshareFluttify {
  static const MethodChannel _channel =
      const MethodChannel('ddshare_fluttify');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
