# 钉钉分享组件
[![](https://img.shields.io/pub/v/ddshare_fluttify#align=left&display=inline&height=20&originHeight=20&originWidth=76&status=done&style=none&width=76)](https://pub.flutter-io.cn/packages/ddshare_fluttify)

DingTalk Share plugin, developed based on the fluttify engine. Supports both Android and IOS, text sharing, picture sharing, web page sharing.
钉钉分享的Flutter插件，同时支持Android和IOS。支持检测、分享文本、分享图片、分享网页。

## 安装:
```dart
dependencies:
  flutter:
    sdk: flutter
  ddshare_fluttify: ^0.1.0
```
## 导入：
```dart
import 'package:ddshare_fluttify/ddshare_fluttify.dart';
```
## 配置
### ios端
1. 在Other Linker Flags添加 `-all_load` 选项；

![](https://img.alicdn.com/tps/TB118c9KVXXXXcIaXXXXXXXXXXX-808-201.png#align=left&display=inline&height=186&originHeight=201&originWidth=808&status=done&width=746)

2. 将申请的appId添加到URL Types中作为钉钉回调的scheme, identifier 填写dingtalk; URL Schemes填写申请的AppId。 iOS9及以后的系统需要将钉钉和分享SDK的scheme配置在Info.plist。LSApplicationQueriesSchemes列表中，scheme分别为 dingtalk, dingtalk-open

![](https://img.alicdn.com/tps/TB1QyhdLXXXXXbZXVXXXXXXXXXX-973-709.png#align=left&display=inline&height=498&originHeight=709&originWidth=973&status=done&width=684)
### Android端
暂不需要配置

### 高级配置，可参考钉钉官方文档
[钉钉分享介入流程](https://ding-doc.dingtalk.com/doc#/native/oguxo2)

## 使用
```dart
// 1. 初始化，前往钉钉开放平台申请
DDSharePlugin.init("dingoalgfg9lln5ltgtmwg");
// 2. 检测是否安装了钉钉
bool flag = await DDSharePlugin.isDDAppInstalled();
// 3. 检测是否支持分享到好友
bool flag = await DDSharePlugin.isDDSupportAPI();
// 4. 检测是都支持分享到Ding
bool flag = await DDSharePlugin.isDDSupportDingAPI();
// 5. 分享文本
DDSharePlugin.sendTextMessage("一个简单的文本分享");
// 6. 分享网络图片
DDSharePlugin.sendOnlineImage(picUrl);
// 7. 分享本地图片(仅支持Android)
File imageFile = File('图片的本地地址');
DDSharePlugin.sendLocalImage(image);
// 8. 分享网页
String url = "https://www.badu.com";
String title = "这是标题";
String content = "这里是分享的文本内容";
// 缩略图
String thumbUrl = "https://t.alipayobjects.com/images/rmsweb/T1vs0gXXhlXXXXXXXX.jpg";
await DDSharePlugin.sendWebPageMessage(url, title: title, content: content, thumbUrl: thumbUrl);

// 分享回调（仅Android）
DDSharePlugin.setCallback((int flag) {
if (flag == 1)
  showToast('分享成功！');
else if (flag == 0)
  showToast('取消分享！');
else
  showToast('分享失败！');
});
```

### 开源不易，老铁们多多支持，顺手点个赞也是支持！😃
| ![image.png](https://cdn.nlark.com/yuque/0/2019/png/179485/1576646832207-e84c24f8-2e66-4937-af4d-b406f88c3974.png#align=left&display=inline&height=436&name=image.png&originHeight=337&originWidth=217&size=83049&status=done&style=none&width=281) | ![image.png](https://cdn.nlark.com/yuque/0/2019/png/179485/1576646720153-ad4673cb-3595-4468-9b60-75725e4322e7.png#align=left&display=inline&height=435&name=image.png&originHeight=298&originWidth=217&size=80120&status=done&style=none&width=317) |
| :---: | :---: |