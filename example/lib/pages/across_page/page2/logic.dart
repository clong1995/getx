import 'package:getx/getx.dart';

import '../page1/logic.dart';

class Page2Logic extends Logic<Page2Logic> {
  void onPressed() {
    find<Page1Logic>().now();
  }

  @override
  Page2Logic put() => putLogic(this);
}
