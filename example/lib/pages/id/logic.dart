import 'package:getx/logic.dart';

import 'state.dart';

class IdLogic extends Logic<IdLogic> {
  final IdState state = IdState();

  void onPressed1() {
    state.datetime1 = DateTime.now().toString();
    update(["now1"]);
  }

  void onPressed2() {
    state.datetime2 = DateTime.now().toString();
    state.datetime3 = DateTime.now().toString();
    update(["now2", "now3"]);
  }

  @override
  IdLogic put() => putLogic(this);
}
