import 'package:flutter/material.dart';

import 'logic.dart';

class MultiplePage extends StatelessWidget {
  const MultiplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MultipleLogic logic = MultipleLogic().put();
    return Scaffold(
      appBar: AppBar(
        title: logic.builder(
          builder: () => Text("多个位置同时刷新${logic.state.datetime}"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            logic.builder(
              builder: () => Text("now:${logic.state.datetime}"),
            ),
            ElevatedButton(
              onPressed: logic.onPressed,
              child: const Text("NOW"),
            ),
          ],
        ),
      ),
    );
  }
}
