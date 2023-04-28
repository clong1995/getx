import 'package:flutter/material.dart';

import 'key.dart';
import 'logic_dict.dart';

class Getx {
  static final BuildContext _context = getxNavKey.currentState!.context;

  static BuildContext get context => _context;

  //跳转到一个新的页面
  static Future<T?> push<T>(Widget Function() page,
      [Object? arguments]) {
    return Navigator.push<T>(
      _context,
      MaterialPageRoute<T>(
        builder: (BuildContext context) => page(),
        settings: RouteSettings(
          arguments: arguments,
        ),
      ),
    );
  }

  //关闭所有页面跳转到新的页面
  static Future<T?> pushAndRemove<T>(StatelessWidget Function() page,
      [Object? arguments]) {
    return Navigator.pushAndRemoveUntil<T>(
      _context,
      MaterialPageRoute<T>(
        builder: (BuildContext context) => page(),
        settings: RouteSettings(
          arguments: arguments,
        ),
      ),
      (Route<dynamic> route) => false,
    );
  }

  //页面返回
  static void pop<T>([T? result]) {
    Navigator.pop<T>(
      _context,
      result,
    );
  }

  //找到一个logic
  static T find<T>() => LogicDict.get<T>();

  //弹出层
  static Future<T?> alertDialog<T>(
    Widget widget, {
    bool barrierDismissible = true,
    Color? barrierColor = const Color(0x80000000),
  }) {
    return showDialog<T>(
      context: _context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder: (BuildContext context) => widget,
    );
  }

  static T arguments<T>() {
    return ModalRoute.of(_context)?.settings.arguments as T;
  }
}
