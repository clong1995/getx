import 'package:flutter/material.dart';

class _LogicDict {
  static final Map<int, dynamic> _logicDict = {};

  static void set<T>(T logic) {
    if (!contain<T>()) _logicDict[T.hashCode] = logic;
  }

  static T get<T>() => _logicDict[T.hashCode] as T;

  static bool contain<T>() => _logicDict.containsKey(T.hashCode);

  static void remove<T>() {
    _logicDict.remove(T.hashCode);
  }
}

abstract class Logic<T> {
  final Map<String, void Function()> _updateNamedDict = {};
  final Map<int, void Function()> _updateDict = {};

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

  // init
  void onInit() {}

  // dispose
  void onDispose() {}

  late BuildContext _context;

  BuildContext get context => _context;

  // put
  T put(BuildContext context);

  //增加一个logic
  T putLogic(T logic, BuildContext context) {
    _context = context;
    if (!_LogicDict.contain<T>()) {
      onInit(); //保证只执行一次
    }/*else{
      //存在。检查是否widget还在，没有销毁。（当没有使用builder的时候）
      T tLogic = _LogicDict.get<T>();//无类型的logic对象
      if(tLogic != null){
        Logic eLogic = (tLogic as Logic);//转换成接口类型的logic对象
        if(!eLogic.context.mounted){//取到的是已经不存在widget的logic
          _LogicDict.remove<T>();
          eLogic.onDispose();
          //再次执行
          onInit();
        }
      }
    }*/


    _LogicDict.set<T>(logic);
    return _LogicDict.get<T>();
  }

  Widget builder({
    String? id,
    required Widget Function() builder,
  }) =>
      _GetxWidget<T>(
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
          if (_updateNamedDict.isEmpty && _updateDict.isEmpty) dispose();
        },
      );

  //移除logic
  void dispose() {
    _LogicDict.remove<T>();
    onDispose();
  }

  //跳转到一个新的页面
  Future<E?> push<E>(Widget Function() page, [Object? arguments]) =>
      Navigator.push<E>(
        _context,
        MaterialPageRoute<E>(
          builder: (BuildContext context) => page(),
          settings: RouteSettings(
            arguments: arguments,
          ),
        ),
      );

  //关闭所有页面跳转到新的页面
  Future<E?> pushAndRemove<E>(StatelessWidget Function() page,
          [Object? arguments]) =>
      Navigator.pushAndRemoveUntil<E>(
        _context,
        MaterialPageRoute<E>(
          builder: (BuildContext context) => page(),
          settings: RouteSettings(
            arguments: arguments,
          ),
        ),
        (Route<dynamic> route) => false,
      );

  //页面返回
  void pop<E>([E? result]) {
    Navigator.maybePop<E>(
      _context,
      result,
    );
  }

  //参数
  E? arguments<E>() {
    ModalRoute? modalRoute = ModalRoute.of(_context);
    if (modalRoute == null) {
      return null;
    }
    Object? arguments = modalRoute.settings.arguments;
    if(arguments == null){
      return null;
    }
    return arguments as E;
  }

  //找到一个logic
  E find<E>() => _LogicDict.get<E>();
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

//找到一个logic
E logicFind<E>() => _LogicDict.get<E>();

//销毁所有logic
/*void logicDestroy() {
  _LogicDict._logicDict.clear();
}*/



///下一版，去掉StatelessWidget外壳，直接GetxWidget
///能省掉
///final XxxLogic logic = XxxLogic().put(context);
///去掉 content
///解决没有builder时候没法销毁logic的bug