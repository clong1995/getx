import 'package:flutter/material.dart';

import 'logic.dart';

class IdPage extends StatelessWidget {
  const IdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IdLogic logic = IdLogic().put(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("按照id刷新"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            logic.builder(
              id: "now1",
              builder: () => Text("now1:${logic.state.datetime1}"),
            ),
            ElevatedButton(
              onPressed: logic.onPressed1,
              child: const Text("NOW 1"),
            ),
            logic.builder(
              id: "now2",
              builder: () => Text("now2:${logic.state.datetime2}"),
            ),
            logic.builder(
              id: "now3",
              builder: () => Text("now3:${logic.state.datetime3}"),
            ),
            ElevatedButton(
              onPressed: logic.onPressed2,
              child: const Text("NOW 2 和 NOW 3"),
            ),
          ],
        ),
      ),
    );
  }
}
