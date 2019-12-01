import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:ddshare_fluttify/ddshare_fluttify.dart';
import 'package:oktoast/oktoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      // Android 测试
      DDSharePlugin.init("dingoalgfg9lln5ltgtmwg");
    } else if (Platform.isIOS) {
      // 苹果测试
      DDSharePlugin.init("dingoak5hqhuvmpfhpnjvt");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      _buildTitle("消息发送前校验"),
      _buildItem("是否安装钉钉", isDDAppInstalled),
      _buildItem("是否支持分享到好友", isDDSupportAPI),
//    _buildItem("是否支持分享到Ding", isDDSupportDingAPI),
      _buildTitle("分享到好友"),
      _buildItem("文本分享", sendTextMessage),
      _buildItem("图片网络分享", sendOnlineImage),
      _buildItem("链接分享", sendWebPageMessage),
    ];
    if (Platform.isAndroid) {
      items.add(_buildItem("图片本地分享", sendLocalImage));
    }
    return OKToast(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('钉钉分享Demo')),
          body: ListView(children: items),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) => Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      height: 30);

  Widget _buildItem(String label, [VoidCallback onTap]) =>
      ListTile(title: Text(label), onTap: onTap);

  isDDAppInstalled() async {
    bool flag = await DDSharePlugin.isDDAppInstalled();
    showToast("$flag");
  }

  isDDSupportAPI() async {
    bool flag = await DDSharePlugin.isDDSupportAPI();
    showToast("$flag");
  }

  isDDSupportDingAPI() async {
    bool flag = await DDSharePlugin.isDDSupportDingAPI();
    showToast("$flag");
  }

  sendTextMessage([bool isSendDing = false]) async {
    bool flag = await DDSharePlugin.sendTextMessage("一个简单的文本分享",
        isSendDing: isSendDing);
    showToast("$flag");
  }

  sendOnlineImage([bool isSendDing = false]) async {
    //        String picUrl = "http://upfile.asqql.com/2009pasdfasdfic2009s305985-ts/2017-12/201712617475697622.gif";
    //        String picUrl = "http://img.zcool.cn/community/010a1b554c01d1000001bf72a68b37.jpg@1280w_1l_2o_100sh.png";
    String picUrl =
        "https://img-download.pchome.net/download/1k1/ut/5a/ouzdgm-1dzc.jpg";
    //        String picUrl = "http://img.qdaily.com/uploads/20160606152752iqaH5t4KMvn18BZo.gif-WebpWebW640";
    //        String picUrl = "http://img.qdaily.com/uploads/20160606152752iqaH5t4KMvn18BZo.gif";
    //        String picUrl = "http://static.dingtalk.com/media/lAHPBY0V4shLSVDMlszw_240_150.gif";

    bool flag =
        await DDSharePlugin.sendOnlineImage(picUrl, isSendDing: isSendDing);
    showToast("$flag");
  }

  sendLocalImage([bool isSendDing = false]) async {
    // 替换成本地可用路径
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    bool flag =
        await DDSharePlugin.sendLocalImage(image, isSendDing: isSendDing);
    showToast("$flag");
  }

  sendWebPageMessage([bool isSendDing = false]) async {
    String url = "https://www.baidu.com";
    String title = "这是标题";
    String content = "这里是分享的内容:" + DateTime.now().toIso8601String();
    String thumbUrl =
        "https://t.alipayobjects.com/images/rmsweb/T1vs0gXXhlXXXXXXXX.jpg";

    bool flag = await DDSharePlugin.sendWebPageMessage(url,
        title: title,
        content: content,
        thumbUrl: thumbUrl,
        isSendDing: isSendDing);
    showToast("$flag");
  }
}
