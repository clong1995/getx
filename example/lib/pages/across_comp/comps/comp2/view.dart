import 'package:flutter/material.dart';

import 'logic.dart';

class Comp2View extends StatelessWidget {
  const Comp2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Comp2Logic logic = Comp2Logic().put(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("comp2"),
        logic.builder(
          builder: () => Text(logic.state.datetime),
        ),
        ElevatedButton(
          onPressed: logic.onPressed,
          child: const Text("update comp1"),
        ),
      ],
    );
  }
}
