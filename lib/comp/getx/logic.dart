import 'package:flutter/material.dart';

import 'getx_widget.dart';
import 'logic_dict.dart';

typedef Update = void Function();

abstract class Logic<T> {
  final Map<String, Update> _updateDict = {};
  final List<Update> _updateList = [];

  void update([List<String>? ids]) {
    if (ids != null) {
      _updateDict.forEach((key, value) {
        if (ids.contains(key)) {
          value.call();
        }
      });
      return;
    } else {
      for (Update element in _updateList) {
        element.call();
      }
    }
  }

  T put();

  T getPut(T logic) {
    LogicDict.set<T>(logic);
    return LogicDict.get<T>();
  }

  Widget builder({
    String? id,
    required Widget Function() builder,
  }) {
    return GetxWidget(
      builder: builder,
      onInit: (Update update) {
        if (id == null) {
          _updateList.add(update);
        } else {
          _updateDict[id] = update;
        }
      },
    );
  }
}
