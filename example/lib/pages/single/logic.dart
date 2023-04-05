import 'package:getx/logic.dart';

import 'state.dart';

class SingleLogic extends Logic<SingleLogic> {
  final SingleState state = SingleState();

  void onPressed() {
    state.datetime = DateTime.now().toString();
    update();
  }

  @override
  SingleLogic put() => putLogic(this);
}
