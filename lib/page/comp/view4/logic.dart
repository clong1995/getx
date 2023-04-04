import '/comp/getx/logic.dart';
import 'state.dart';

class View4Logic extends Logic<View4Logic> {
  final View4State state = View4State();

  void onPressed() {
    state.datetime = DateTime.now().toString();
    update();
  }

  @override
  View4Logic put() => getPut(this);
}
