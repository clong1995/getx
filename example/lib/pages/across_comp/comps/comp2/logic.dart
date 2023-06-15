import 'package:flutter/material.dart';
import 'package:getx/logic.dart';

import '../comp1/logic.dart';
import 'state.dart';

class Comp2Logic extends Logic<Comp2Logic> {
  final Comp2State state = Comp2State();

  void onPressed() {
    find<Comp1Logic>()?.now();
  }

  void now() {
    state.datetime = DateTime.now().toString();
    update();
  }

  @override
  Comp2Logic put(BuildContext context) => putLogic(this, context);
}
