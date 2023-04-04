import 'package:flutter/material.dart';

abstract class Logic<T> {
  final Map<String, void Function()> _updateDict = {};
  final List<void Function()> _updateList = [];
  late BuildContext context;

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
  void onDispose() {}

  //
  T put();

  //增加一个logic
  T putLogic(T logic) {
    /*if (!_LogicDict.contain<T>()) {
      onInit();
    }*/
    _LogicDict.set<T>(logic);
    return _LogicDict.get<T>();
  }

  //找到一个logic
  E find<E>() => _LogicDict.get<E>();

  //跳转到一个新的页面
  Future<K?> navPush<K>(StatelessWidget Function() page) {
    return Navigator.push<K>(
      context,
      MaterialPageRoute(builder: (context) => page()),
    );
  }

  //关闭所有页面跳转到新的页面
  Future<K?> navPushAndRemove<K>(StatelessWidget Function() page) {
    return Navigator.pushAndRemoveUntil<K>(
      context,
      MaterialPageRoute<K>(builder: (BuildContext context) => page()),
      (Route<dynamic> route) => false,
    );
  }

  //页面返回
  void navPop<K>([K? result]) {
    Navigator.pop<K>(
      context,
      result,
    );
  }

  Widget builder({
    String? id,
    required Widget Function() builder,
  }) {
    return _GetxWidget<T>(
      builder: builder,
      onInit: (BuildContext context, void Function() update) {
        this.context = context;
        if (!_LogicDict.contain<T>()) onInit();
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

class _LogicDict {
  static final Map<int, dynamic> _logicDict = {};

  static void set<T>(T logic) {
    if (!contain<T>()) {
      _logicDict[T.hashCode] = logic;
    }
  }

  static T get<T>() {
    return _logicDict[T.hashCode] as T;
  }

  static bool contain<T>() {
    return _logicDict.containsKey(T.hashCode);
  }

  static void remove<T>() {
    _logicDict.remove(T.hashCode);
  }
}

class _GetxWidget<T> extends StatefulWidget {
  final Widget Function() builder;
  final void Function(BuildContext context, void Function() update) onInit;
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
      widget.onInit(context, () {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) => widget.builder();

  @override
  void dispose() {
    widget.onDispose();
    _LogicDict.remove<T>();
    super.dispose();
  }
}
