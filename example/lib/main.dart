import 'dart:ffi';

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
    DDSharePlugin.init("dingoalgfg9lln5ltgtmwg");
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('钉钉分享Demo')),
          body: ListView(
            children: <Widget>[
              _buildTitle("消息发送前校验"),
              _buildItem("是否安装钉钉", isDDAppInstalled),
              _buildItem("是否支持分享", isDDSupportAPI),
              _buildTitle("分享到好友"),
              _buildItem("文本分享", sendTextMessage),
              _buildItem("图片分享"),
              _buildItem("链接分享"),
              _buildItem("支付宝红包分享"),
              _buildTitle("分享到Ding"),
              _buildItem("文本分享", () => sendTextMessage(true)),
              _buildItem("图片分享"),
              _buildItem("链接分享"),
              _buildItem("支付宝红包分享"),
            ],
          ),
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

  Widget _buildItem(String label, [VoidCallback onTap]) => ListTile(title: Text(label), onTap: onTap);

  isDDAppInstalled() async {
    bool flag = await DDSharePlugin.isDDAppInstalled();
    showToast("$flag");
  }

  isDDSupportAPI() async {
    bool flag = await DDSharePlugin.isDDSupportAPI();
    showToast("$flag");
  }

  sendTextMessage([bool isSendDing = false]) async {
    await DDSharePlugin.sendTextMessage("一个简单的文本分享", isSendDing);
  }
}
