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
    DDSharePlugin.init("appId");
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('钉钉分享Demo')),
          body: ListView(
            children: <Widget>[
              ListTile(title: Text("是否安装钉钉"), onTap: isDDAppInstalled),
              ListTile(title: Text("是否支持分享"), onTap: isDDSupportAPI),
            ],
          ),
        ),
      ),
    );
  }

  isDDAppInstalled() async {
    bool flag = await DDSharePlugin.isDDAppInstalled();
    showToast("$flag");
  }

  isDDSupportAPI() async {
    bool flag = await DDSharePlugin.isDDSupportAPI();
    showToast("$flag");
  }
}
