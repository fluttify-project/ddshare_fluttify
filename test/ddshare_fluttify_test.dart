import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ddshare_fluttify/ddshare_fluttify.dart';

void main() {
  const MethodChannel channel = MethodChannel('ddshare_fluttify');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DdshareFluttify.platformVersion, '42');
  });
}
