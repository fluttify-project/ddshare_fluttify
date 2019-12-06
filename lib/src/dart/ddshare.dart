import 'dart:async';
import 'dart:io';

import 'package:ddshare_fluttify/src/dart/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../android/android.export.g.dart';
import '../ios/ios.export.g.dart';
import 'models.dart';

StreamController<int> _responseShareController =
new StreamController.broadcast();

/// 分享回调 1-成功，0-取消，-1-失败
Stream<int> get shareCallback => _responseShareController.stream;

_initCallback() {
  if (Platform.isAndroid) {
    MethodChannel('com.fluttify/ddshare_fluttify')
      ..setMethodCallHandler((call) async {
        if ("Callback::com.android.dingtalk.share.ddsharemodule.IDDAPIEventHandler::onResp" == call.method) {
          _responseShareController.sink.add(call.arguments);
        }
        return Future.value(true);
      });
  }
}

class DDSharePlugin {
  static com_android_dingtalk_share_ddsharemodule_DDShareApiV2 _androidApi;
  /// 初始化  activity的export为true
  static Future<void> init(String appId) {
    _initCallback();
    return platform(
      android: (pool) async {
        final android_content_Context context = await getandroid_app_Activity();
        _androidApi =
            await createcom_android_dingtalk_share_ddsharemodule_DDShareApiV2__android_content_Context__String__boolean(
                context, appId, false);
        await _androidApi.registerApp(appId);
      },
      ios: (pool) async {
        await DTOpenAPI.registerApp(appId);
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

  /// 回调设置，1-成功，0-取消，-1-失败
  static void setCallback(ValueChanged<int> listen) {
    if (Platform.isAndroid) {
      _responseShareController.stream.listen(listen);
    }
  }



  /// 分享文本 <br/>
  /// [content] - 分享的文本内容 <br/>
  /// [isSendDing] - 是否分享到Ding <br/>
  static Future<bool> sendTextMessage(String content,
      {bool isSendDing = false}) async {
    return _share(
      DDShareBody(
        mContent: content,
        shareType: DDShareType.TEXT,
      ),
      isSendDing: isSendDing,
    );
  }

  /// 分享本地图片 <br/>
  /// [imgFile] - 本地图片，请先检测是否存在 <br/>
  /// [isSendDing] - 是否分享到Ding <br/>
  static Future<bool> sendLocalImage(File imgFile,
      {bool isSendDing = false}) async {
    return _share(
        DDShareBody(
          mContent: imgFile.path,
          shareType: DDShareType.IMG_LOCAL,
        ),
        isSendDing: isSendDing);
  }

  /// 分享网络图片 <br/>
  /// [url] - 图片地址 <br/>
  /// [isSendDing] - 是否分享到Ding <br/>
  static Future<bool> sendOnlineImage(String url,
      {bool isSendDing = false}) async {
    return _share(
      DDShareBody(
        mContent: url,
        shareType: DDShareType.IMG_URL,
      ),
      isSendDing: isSendDing,
    );
  }

  /// 分享网址 <br/>
  /// [url] - 网页地址 <br/>
  /// [title] - 分享标题 <br/>
  /// [content] - 分享内容 <br/>
  /// [thumbUrl] - 缩略图网络地址 <br/>
  /// [isSendDing] - 是否分享到Ding <br/>
  static Future<bool> sendWebPageMessage(String url,
      {String title,
      String content,
      String thumbUrl,
      bool isSendDing = false}) async {
    return _share(
      DDShareBody(
        mUrl: url,
        mTitle: title,
        mContent: content,
        mThumbUrl: thumbUrl,
        shareType: DDShareType.URL,
      ),
      isSendDing: isSendDing,
    );
  }


  /// 分享
  /// [isSendDing] - 是否分享到Ding <br/>
  static Future<bool> _share(DDShareBody shareBody,
      {bool isSendDing = false}) async {
    if (Platform.isAndroid) {
      com_android_dingtalk_share_ddsharemodule_message_DDMediaMessage
      mediaMessage =
      await createcom_android_dingtalk_share_ddsharemodule_message_DDMediaMessage__();
      switch (shareBody.shareType) {
        case DDShareType.TEXT:
          com_android_dingtalk_share_ddsharemodule_message_DDTextMessage
          textObject =
          await createcom_android_dingtalk_share_ddsharemodule_message_DDTextMessage__();
          await textObject.set_mText(shareBody.mContent);
          await mediaMessage.set_mMediaObject(textObject);
          break;
        case DDShareType.IMG_LOCAL:
        case DDShareType.IMG_URL:
          com_android_dingtalk_share_ddsharemodule_message_DDImageMessage
          imageObject =
          await createcom_android_dingtalk_share_ddsharemodule_message_DDImageMessage__();
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
            await createcom_android_dingtalk_share_ddsharemodule_message_DDWebpageMessage__();
            await webPageObject.set_mUrl(shareBody.mUrl);
            await mediaMessage.set_mMediaObject(webPageObject);
          } else {
            com_android_dingtalk_share_ddsharemodule_message_DDZhiFuBaoMesseage
            zfbPageObject =
            await createcom_android_dingtalk_share_ddsharemodule_message_DDZhiFuBaoMesseage__();
            await zfbPageObject.set_mUrl(shareBody.mUrl);
            await mediaMessage.set_mMediaObject(zfbPageObject);
          }
          await mediaMessage.set_mTitle(shareBody.mTitle);
          await mediaMessage.set_mThumbUrl(shareBody.mThumbUrl);
          await mediaMessage.set_mContent(shareBody.mContent);
          break;
      }
      com_android_dingtalk_share_ddsharemodule_message_SendMessageToDD_Req req =
      await createcom_android_dingtalk_share_ddsharemodule_message_SendMessageToDD_Req__();
      await req.set_mMediaMessage(mediaMessage);
      if (isSendDing) {
        return await _androidApi?.sendReqToDing(req);
      } else {
        return await _androidApi?.sendReq(req);
      }
    } else if (Platform.isIOS && !isSendDing) {
      DTMediaMessage mediaMessage = await createDTMediaMessage();
      switch (shareBody.shareType) {
        case DDShareType.TEXT:
          DTMediaTextObject object = await createDTMediaTextObject();
          await object.set_text(shareBody.mContent);
          await mediaMessage.set_mediaObject(object);
          break;
        case DDShareType.IMG_URL:
          DTMediaImageObject object = await createDTMediaImageObject();
          await object.set_imageURL(shareBody.mContent);
          await mediaMessage.set_mediaObject(object);
          break;
        case DDShareType.URL:
          DTMediaWebObject object = await createDTMediaWebObject();
          await object.set_pageURL(shareBody.mUrl);
          await mediaMessage.set_title(shareBody.mTitle);
          await mediaMessage.set_messageDescription(shareBody.mContent);
          await mediaMessage.set_thumbURL(shareBody.mThumbUrl);
          await mediaMessage.set_mediaObject(object);
          break;
        default:
          break;
      }

      DTSendMessageToDingTalkReq sendMessageReq =
      await createDTSendMessageToDingTalkReq();
      await sendMessageReq.set_message(mediaMessage);
      return await DTOpenAPI.sendReq(sendMessageReq);
    }
    return false;
  }
}
