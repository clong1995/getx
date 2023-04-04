import '/comp/getx/logic.dart';
import 'state.dart';

class View3Logic extends Logic<View3Logic> {
  final View3State state = View3State();

  void onPressed() {
    state.datetime = DateTime.now().toString();
    update();
  }

  @override
  void onInit() {
    print("onInit view 3");
  }

  @override
  void onDispose() {
    print("onDispose");
  }

  @override
  View3Logic put() => getPut(this);
}
