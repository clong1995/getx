import 'package:flutter/material.dart';

import 'getx_widget.dart';
import 'logic_dict.dart';

abstract class Logic<T> {
  final Map<String, void Function()> _updateDict = {};
  final List<void Function()> _updateList = [];

  void update([List<String>? ids]) {
    if (ids != null) {
      _updateDict.forEach((key, value) {
        if (ids.contains(key)) {
          value.call();
        }
      });
      return;
    } else {
      for (void Function() element in _updateList) {
        element.call();
      }
    }
  }

  T put();

  //init
  void onInit() {}

  //dispose
  void onDispose() {}

  T getPut(T logic) {
    if(!LogicDict.contain<T>()){
      onInit();
    }
    LogicDict.set<T>(logic);
    return LogicDict.get<T>();
  }

  E find<E>() => LogicDict.get<E>();

  Widget builder({
    String? id,
    required Widget Function() builder,
  }) {
    return GetxWidget(
      builder: builder,
      onInit: (void Function() update) {
        if (id == null) {
          _updateList.add(update);
        } else {
          _updateDict[id] = update;
        }
      },
      onDispose: onDispose,
    );
  }
}
