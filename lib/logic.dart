import 'package:flutter/material.dart';

import 'key.dart';
import 'logic_dict.dart';

abstract class Logic<T> {
  final Map<String, void Function()> _updateDict = {};
  final List<void Function()> _updateList = [];
  late BuildContext context = getxNavKey.currentState!.context;

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

  //init
  void onInit() {}

  //dispose
  void onDispose() {
    LogicDict.remove<T>();
  }

  //
  T put();

  //增加一个logic
  T putLogic(T logic) {
    /*if (!_LogicDict.contain<T>()) {
      onInit();
    }*/
    LogicDict.set<T>(logic);
    return LogicDict.get<T>();
  }


  Widget builder({
    String? id,
    required Widget Function() builder,
  }) {
    return _GetxWidget<T>(
      builder: builder,
      onInit: (void Function() update) {
        if (!LogicDict.contain<T>()) onInit();
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

class _GetxWidget<T> extends StatefulWidget {
  final Widget Function() builder;
  final void Function(void Function() update) onInit;
  final void Function() onDispose;

  const _GetxWidget({
    Key? key,
    required this.builder,
    required this.onInit,
    required this.onDispose,
  }) : super(key: key);

  @override
  State<_GetxWidget> createState() => _GetxWidgetState<T>();
}

class _GetxWidgetState<T> extends State<_GetxWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      widget.onInit(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) => widget.builder();

  @override
  void dispose() {
    widget.onDispose();
    super.dispose();
  }
}
