import 'dart:math';

import '/comp/getx/logic.dart';
import 'state.dart';

class MyLogic extends Logic<MyLogic> {
  final MyState state = MyState();

  void onAddPressed() {
    state.count++;
    update(["count"]);
  }
  void onNowPressed() {
    state.datetime = DateTime.now().toString();
    update(["datetime"]);
  }

  void onRandomPressed() {
    state.random = Random().nextInt(100);
    update();
  }

  @override
  MyLogic put() => getPut(this);
}
