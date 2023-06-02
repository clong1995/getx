import 'package:flutter/material.dart';
import 'package:getx/logic.dart';


class TestLogic extends Logic<TestLogic> {

  @override
  TestLogic put(BuildContext context) => putLogic(this, context);

  @override
  void onInit() {
    print("onInit");
  }
}
