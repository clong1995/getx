import 'package:flutter/material.dart';

import 'key.dart';
import 'logic_dict.dart';

abstract class Logic<T> {
  final Map<String, void Function()> _updateNamedDict = {};
  final Map<int, void Function()> _updateDict = {};
  late BuildContext context = getxNavKey.currentState!.context;

  void update([List<String>? ids]) {
    if (ids != null) {
      //命名update
      _updateNamedDict.forEach((key, value) {
        if (ids.contains(key)) {
          value.call();
        }
      });
      return;
    } else {
      //无名update
      _updateDict.forEach((key, value) {
        value.call();
      });
    }
  }

  //init
  void onInit() {}

  //dispose
  void onDispose() {}

  //
  T put();

  //增加一个logic
  T putLogic(T logic) {
    if (!LogicDict.contain<T>()) onInit(); //保证只执行一次
    LogicDict.set<T>(logic);
    return LogicDict.get<T>();
  }

  Widget builder({
    String? id,
    required Widget Function() builder,
  }) {
    return _GetxWidget<T>(
      builder: builder,
      onInit: (void Function() update, int hashCode) {
        if (id == null) {
          _updateDict[hashCode] = update;
        } else {
          _updateNamedDict[id] = update;
        }
      },
      onDispose: (int hashCode) {
        //移除update
        if (id == null) {
          _updateDict.remove(hashCode);
        } else {
          _updateNamedDict.remove(id);
        }
        //当这个页面的各个builder都销毁的时候，
        if (_updateNamedDict.isEmpty && _updateDict.isEmpty) {
          LogicDict.remove<T>();
          onDispose();
        }
      },
    );
  }
}

class _GetxWidget<T> extends StatefulWidget {
  final Widget Function() builder;
  final void Function(void Function() update, int hashCode) onInit;
  final void Function(int hashCode) onDispose;

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
      widget.onInit(
        () {
          setState(() {});
        },
        hashCode,
      );
    });
  }

  @override
  Widget build(BuildContext context) => widget.builder();

  @override
  void dispose() {
    widget.onDispose(hashCode);
    super.dispose();
  }
}
