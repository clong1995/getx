import 'package:flutter/material.dart';

import 'logic.dart';

class SinglePage extends StatelessWidget {
  const SinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SingleLogic logic = SingleLogic().put();
    return Scaffold(
      appBar: AppBar(
        title: const Text("单个刷新"),
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
