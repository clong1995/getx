import 'package:flutter/material.dart';

import 'logic.dart';


class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TestLogic logic = TestLogic().put(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("测试"),
      ),
      body: Center(
        child: const Text("test"),
      ),
    );
  }
}
