import '../view2/logic.dart';
import '/comp/getx/logic.dart';
import 'state.dart';

class View1Logic extends Logic<View1Logic> {
  final View1State state = View1State();

  void onPressed() {
    find<View2Logic>().now();
  }

  void now() {
    state.datetime = DateTime.now().toString();
    print("view1 now");
    update();
  }

  @override
  View1Logic put() => getPut(this);
}
