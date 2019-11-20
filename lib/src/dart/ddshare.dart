import 'dart:io';

import '../android/android.export.g.dart';
import '../ios/ios.export.g.dart';

class DDSharePlugin {
  static com_android_dingtalk_share_ddsharemodule_DDShareApiV2 _androidApi;

  /// 初始化  activity的export为true
  static Future<void> init(String appId) {
    return platform(
      android: (pool) async {
        final android_content_Context context = await PlatformFactoryAndroid.getandroid_app_Activity();
        _androidApi = await DdshareFluttifyFactoryAndroid
            .createcom_android_dingtalk_share_ddsharemodule_DDShareApiV2__android_content_Context__String__boolean(
                context, appId, false);
//        await _androidApi.registerApp(appId);
      },
      ios: (pool) async {
        DTOpenAPI.registerApp(appId);
      },
    );
  }

  /// 是否安装了
  static Future<bool> isDDAppInstalled() async {
    if (Platform.isAndroid) return await _androidApi?.isDDAppInstalled();
    if (Platform.isIOS) return await DTOpenAPI.isDingTalkInstalled();
    return false;
  }

  /// 是否支持分享到好友
  static Future<bool> isDDSupportAPI() async {
    if (Platform.isAndroid) return await _androidApi?.isDDSupportAPI();
    if (Platform.isIOS) return await DTOpenAPI.isDingTalkSupportOpenAPI();
    return false;
  }
}
