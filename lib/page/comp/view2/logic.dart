import '../view1/logic.dart';
import '/comp/getx/logic.dart';
import 'state.dart';

class View2Logic extends Logic<View2Logic> {
  final View2State state = View2State();

  void onPressed() {
    find<View1Logic>().now();
  }

  void now(){
    state.datetime = DateTime.now().toString();
    print("view2 now");
    update();
  }

  @override
  View2Logic put() => getPut(this);
}
