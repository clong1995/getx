import 'package:flutter/material.dart';

import 'logic.dart';

class Page2View extends StatelessWidget {
  const Page2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Page2Logic logic = Page2Logic().put();
    return Scaffold(
      appBar: AppBar(
        title: const Text("page2"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("page 2"),
            ElevatedButton(
              onPressed: logic.onPressed,
              child: const Text("update page1"),
            ),
          ],
        ),
      ),
    );
  }
}
