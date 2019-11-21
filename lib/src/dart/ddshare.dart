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
        await _androidApi.registerApp(appId);
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

  static Future<void> sendTextMessage(String text, [bool isSendDing = false]) async {
    return platform(
      android: (pool) async {
        // 初始化一个DDTextMessage对象
        com_android_dingtalk_share_ddsharemodule_message_DDTextMessage textObject = await DdshareFluttifyFactoryAndroid
            .createcom_android_dingtalk_share_ddsharemodule_message_DDTextMessage__();
        print(textObject.toString());
        await textObject.set_mText(text);

        //用DDTextMessage对象初始化一个DDMediaMessage对象
        com_android_dingtalk_share_ddsharemodule_message_DDMediaMessage mediaMessage =
            await DdshareFluttifyFactoryAndroid
                .createcom_android_dingtalk_share_ddsharemodule_message_DDMediaMessage__();
        print(mediaMessage.toString());
        mediaMessage.set_mMediaObject(mediaMessage);
        //构造一个Req
        com_android_dingtalk_share_ddsharemodule_message_SendMessageToDD_Req req = await DdshareFluttifyFactoryAndroid
            .createcom_android_dingtalk_share_ddsharemodule_message_SendMessageToDD_Req__();
        req.set_mMediaMessage(mediaMessage);

        //调用api接口发送消息到钉钉
        if (isSendDing) {
          return await _androidApi.sendReqToDing(req);
        } else {
          return await _androidApi.sendReq(req);
        }
      },
    );
  }
}
