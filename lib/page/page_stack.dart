import 'package:flutter/cupertino.dart';

class PageStack {
  static PageStack _instance;
  static Map<String, Object> listPage = {};

  /// Construtor da classe
  factory PageStack() {
    _instance ??= PageStack._internalConstructor();
    return _instance;
  }

  PageStack._internalConstructor();

  static Widget page(String id) {
    print(_instance);
    return PageStack.listPage[id];
  }

  static registrer(String id, Widget widget) {
    PageStack.listPage[id] = widget;
  }

  static bool exist(String id) {
    return PageStack.listPage[id] != null;
  }
}
