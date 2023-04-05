import 'package:getx/logic.dart';

import 'state.dart';

class MultipleLogic extends Logic<MultipleLogic> {
  final MultipleState state = MultipleState();

  void onPressed() {
    state.datetime = DateTime.now().toString();
    update();
  }

  @override
  MultipleLogic put() => putLogic(this);
}
