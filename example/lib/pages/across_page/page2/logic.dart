import 'package:getx/getx.dart';
import 'package:getx/logic.dart';

import '../page1/logic.dart';

class Page2Logic extends Logic<Page2Logic> {
  void onPressed() {
    Getx.find<Page1Logic>().now();
  }

  @override
  Page2Logic put() => putLogic(this);
}
