class LogicDict<T> {
  static final Map<int, dynamic> _logicDict = {};

  static void set<T>(T logic) {
    if (!_logicDict.containsKey(T.hashCode)) {
      _logicDict[T.hashCode] = logic;
    }
  }

  static T? get<T>() {
    if (!_logicDict.containsKey(T.hashCode)) null;
    return _logicDict[T.hashCode] as T;
  }
}
