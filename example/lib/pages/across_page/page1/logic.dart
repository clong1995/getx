import 'package:getx/logic.dart';
import 'package:getx/getx.dart';
import '../page2/view.dart';

import 'state.dart';

class Page1Logic extends Logic<Page1Logic> {
  final Page1State state = Page1State();

  void now() {
    state.datetime = DateTime.now().toString();
    update();
  }

  void onPressed() {
    Getx.push(() => const Page2View());
  }

  @override
  Page1Logic put() => putLogic(this);
}
