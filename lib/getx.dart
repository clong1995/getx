import 'package:flutter/material.dart';

import 'key.dart';
import 'logic_dict.dart';

class Getx {
  static final BuildContext _context = getxNavKey.currentState!.context;

  //跳转到一个新的页面
  static Future<T?> push<T>(StatelessWidget Function() page) {
    return Navigator.push<T>(
      _context,
      MaterialPageRoute(builder: (context) => page()),
    );
  }

  //关闭所有页面跳转到新的页面
  static Future<T?> pushAndRemove<T>(StatelessWidget Function() page) {
    return Navigator.pushAndRemoveUntil<T>(
      _context,
      MaterialPageRoute<T>(builder: (BuildContext context) => page()),
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
}
