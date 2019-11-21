import 'enums.dart';

class DDShareBody {
  /// 标题
  String mTitle;

  /// 内容
  String mContent;

  /// 缩略图链接
  String mThumbUrl;

  /// 网页分享的连接地址
  String mUrl;

  DDShareType shareType;

  DDShareBody({this.mTitle, this.mContent, this.mThumbUrl, this.mUrl, this.shareType});
}
