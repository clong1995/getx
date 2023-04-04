import 'package:flutter/material.dart';

import 'logic.dart';

class Page1View extends StatelessWidget {
  const Page1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Page1Logic logic = Page1Logic().put();
    return Scaffold(
      appBar: AppBar(
        title: const Text("跨页面调用"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("page 1"),
            logic.builder(
              builder: () => Text(logic.state.datetime),
            ),
            ElevatedButton(
              onPressed: logic.onPressed,
              child: const Text("nav to page2"),
            ),
          ],
        ),
      ),
    );
  }
}
