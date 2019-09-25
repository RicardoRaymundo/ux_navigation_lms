import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ux_navigation/page/info/video/info_video_page.dart';
import 'package:ux_navigation/page/page_create_account.dart';
import 'package:ux_navigation/page/page_login.dart';
import 'package:ux_navigation/page/page_main.dart';

class AppRouting{
  static const String PAGE_MAIN = 'pageMain';
  static const String PAGE_LOGIN = 'pageLogin';
  static const String PAGE_INFO_VIDEO = 'pageInfoVideo';
  static const String PAGE_CREATE_ACCOUNT = 'pageCreateAccount';

  static Map<String, WidgetBuilder> routes() {
    return {
      /// Rotas do app
      PAGE_MAIN: (BuildContext context) => PageMain(),
      PAGE_LOGIN: (BuildContext context) => PageLogin(),
      PAGE_INFO_VIDEO: (BuildContext context) => InfoVideoPage(),
      PAGE_CREATE_ACCOUNT: (BuildContext context) => PageCreateAccount(),
    };
  }
}
