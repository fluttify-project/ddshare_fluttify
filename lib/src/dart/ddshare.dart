import 'dart:io';

import 'package:ddshare_fluttify/src/dart/enums.dart';

import '../android/android.export.g.dart';
import '../ios/ios.export.g.dart';
import 'models.dart';

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
        _androidApi.registerApp(appId);
      },
      ios: (pool) async {
        DTOpenAPI.registerApp(appId);
      },
    );
  }

  /// 是否安装了钉钉
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

  /// 是否支持分享到Ding 仅Android
  static Future<bool> isDDSupportDingAPI() async {
    if (Platform.isAndroid) return await _androidApi?.isDDSupportDingAPI();
    return false;
  }

  /// 分享
  static Future<bool> _share(DDShareBody shareBody, [bool isSendDing = false]) async {
    if (Platform.isAndroid) {
//      _androidApi.handleIntent(android_content_Intent()..refId=100..tag='ddshare_fluttify', DDAPIEventHandler());
      com_android_dingtalk_share_ddsharemodule_message_DDMediaMessage mediaMessage =
          await DdshareFluttifyFactoryAndroid.createcom_android_dingtalk_share_ddsharemodule_message_DDMediaMessage__();
      switch (shareBody.shareType) {
        case DDShareType.TEXT:
          com_android_dingtalk_share_ddsharemodule_message_DDTextMessage textObject =
              await DdshareFluttifyFactoryAndroid
                  .createcom_android_dingtalk_share_ddsharemodule_message_DDTextMessage__();
          await textObject.set_mText(shareBody.mContent);
          await mediaMessage.set_mMediaObject(textObject);
          break;
        case DDShareType.IMG_LOCAL:
        case DDShareType.IMG_URL:
          com_android_dingtalk_share_ddsharemodule_message_DDImageMessage imageObject =
              await DdshareFluttifyFactoryAndroid
                  .createcom_android_dingtalk_share_ddsharemodule_message_DDImageMessage__();
          if (shareBody.shareType == DDShareType.IMG_LOCAL) {
            await imageObject.set_mImagePath(shareBody.mContent);
          } else {
            await imageObject.set_mImageUrl(shareBody.mContent);
          }
          await mediaMessage.set_mMediaObject(imageObject);
          break;
        case DDShareType.URL:
        case DDShareType.ZFB:
          if (shareBody.shareType == DDShareType.URL) {
            com_android_dingtalk_share_ddsharemodule_message_DDWebpageMessage webPageObject =
                await DdshareFluttifyFactoryAndroid
                    .createcom_android_dingtalk_share_ddsharemodule_message_DDWebpageMessage__();
            await webPageObject.set_mUrl(shareBody.mUrl);
            await mediaMessage.set_mMediaObject(webPageObject);
          } else {
            com_android_dingtalk_share_ddsharemodule_message_DDZhiFuBaoMesseage zfbPageObject =
                await DdshareFluttifyFactoryAndroid
                    .createcom_android_dingtalk_share_ddsharemodule_message_DDZhiFuBaoMesseage__();
            await zfbPageObject.set_mUrl(shareBody.mUrl);
            await mediaMessage.set_mMediaObject(zfbPageObject);
          }
          await mediaMessage.set_mTitle(shareBody.mTitle);
          await mediaMessage.set_mThumbUrl(shareBody.mThumbUrl);
          await mediaMessage.set_mContent(shareBody.mContent);
          break;
      }
      com_android_dingtalk_share_ddsharemodule_message_SendMessageToDD_Req req = await DdshareFluttifyFactoryAndroid
          .createcom_android_dingtalk_share_ddsharemodule_message_SendMessageToDD_Req__();
      await req.set_mMediaMessage(mediaMessage);
      if (isSendDing) {
        return await _androidApi?.sendReqToDing(req);
      } else {
        return await _androidApi?.sendReq(req);
      }
    }

    return false;
  }

  /// 分享文本 <br/>
  /// [content] - 分享的文本内容 <br/>
  /// [isSendDing] - 是否分享到Ding
  static Future<bool> sendTextMessage(String content, [bool isSendDing = false]) async {
    return _share(DDShareBody(mContent: content, shareType: DDShareType.TEXT));
  }

  /// 分享本地图片 <br/>
  /// [imgFile] - 本地图片，请先检测是否存在 <br/>
  /// [isSendDing] - 是否分享到Ding
  static Future<bool> sendLocalImage(File imgFile, [bool isSendDing = false]) async {
    return _share(DDShareBody(mContent: imgFile.path, shareType: DDShareType.IMG_LOCAL), isSendDing);
  }

  /// 分享网络图片 <br/>
  /// [url] - 图片地址 <br/>
  /// [isSendDing] - 是否分享到Ding
  static Future<bool> sendOnlineImage(String url, [bool isSendDing = false]) async {
    return _share(DDShareBody(mContent: url, shareType: DDShareType.IMG_URL), isSendDing);
  }

  /// 分享网址 <br/>
  /// [url] - 网页地址 <br/>
  /// [title] - 分享标题 <br/>
  /// [content] - 分享内容 <br/>
  /// [thumbUrl] - 缩略图网络地址 <br/>
  /// [isSendDing] - 是否分享到Ding
  static Future<bool> sendWebPageMessage(String url,
      {String title, String content, String thumbUrl, bool isSendDing = false}) async {
    return _share(
      DDShareBody(mUrl: url, mTitle: title, mContent: content, mThumbUrl: thumbUrl, shareType: DDShareType.URL),
      isSendDing,
    );
  }

  /// 支付宝红包分享 <br/>
  /// [url] - 网页地址 <br/>
  /// [title] - 支付宝红包标题 <br/>
  /// [content] - 支付宝红包内容描述 <br/>
  /// [thumbUrl] - 缩略图网络地址 <br/>
  /// [isSendDing] - 是否分享到Ding
//  static Future<bool> sendZFBMessage(String url,
//      {String title, String content, String thumbUrl, bool isSendDing = false}) async {
//    return _share(
//      DDShareBody(mUrl: url, mTitle: title, mContent: content, mThumbUrl: thumbUrl, shareType: DDShareType.ZFB),
//      isSendDing,
//    );
//  }
}

class DDAPIEventHandler extends java_lang_Object with com_android_dingtalk_share_ddsharemodule_IDDAPIEventHandler {
  @override
  Future<void> onReq(com_android_dingtalk_share_ddsharemodule_message_BaseReq var1) {
    print(var1);
    return super.onReq(var1);
  }

  @override
  Future<void> onResp(com_android_dingtalk_share_ddsharemodule_message_BaseResp baseResp) async {
    int errCode = await baseResp.get_mErrCode();
    print("errorCode==========> $errCode");
    String errMsg = await baseResp.get_mErrStr();
    print("errMsg==========>" + errMsg);
    switch (errCode) {
      case 0:
        print("分享成功");
        break;
      case -2:
        print("分享取消");
        break;
      default:
        print("分享失败:$errMsg");
        break;
    }
    return super.onResp(baseResp);
  }
}
