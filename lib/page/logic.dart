import '/comp/getx/logic.dart';
import 'state.dart';

class MyLogic extends Logic<MyLogic> {
  final MyState state = MyState();

  void onPressed() {
    state.count++;
    update();
  }

  @override
  MyLogic put() => getPut(this);
}
