import 'package:flutter/material.dart';

import 'logic.dart';

class ArgsPage extends StatelessWidget {
  const ArgsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ArgsLogic logic = ArgsLogic().put(context);

    // print(ModalRoute.of());
    return Scaffold(
      appBar: AppBar(
        title: const Text("跨页面传递参数"),
      ),
      body: Center(
        child: logic.builder(
          builder: () => Text("name:${logic.name}\nage:${logic.age}"),
        ),
      ),
    );
  }
}
