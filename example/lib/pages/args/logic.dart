import 'package:flutter/material.dart';
import 'package:getx/logic.dart';

import 'args.dart';

class ArgsLogic extends Logic<ArgsLogic> {
  int age = 0;
  String name = "";

  @override
  void onInit() {
    ArgsArgs args = arguments<ArgsArgs>();
    name = args.name;
    age = args.age;
  }

  @override
  ArgsLogic put(BuildContext context) => putLogic(this, context);
}
