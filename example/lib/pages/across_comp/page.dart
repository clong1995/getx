import 'package:flutter/material.dart';

import 'comps/comp1/view.dart';
import 'comps/comp2/view.dart';

class AcrossCompPage extends StatelessWidget {
  const AcrossCompPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("跨组件调用"),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Comp1View(),
            VerticalDivider(),
            Comp2View(),
          ],
        ),
      ),
    );
  }
}
