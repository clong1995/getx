import 'package:flutter/material.dart';
import 'logic_dict.dart';

import 'getx_widget.dart';

abstract class Logic<T> {
  void Function() update = () => print("not push");

  T put();

  T getPut(T logic) {
    LogicDict.set<T>(logic);
    T? oldLogic = LogicDict.get<T>();
    if (oldLogic != null) logic = oldLogic;
    update = (logic as Logic).update;
    return logic;
  }

  Widget builder({
    String? id,
    required Widget Function() builder,
  }) {
    return GetxWidget(
      builder: builder,
      onInit: (void Function() update) => this.update = update,
    );
  }
}
