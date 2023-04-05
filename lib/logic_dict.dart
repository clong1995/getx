class LogicDict {
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
