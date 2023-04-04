import 'package:flutter/material.dart';

import 'logic.dart';

class Comp1View extends StatelessWidget {
  const Comp1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Comp1Logic logic = Comp1Logic().put();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("comp1"),
        logic.builder(
          builder: () => Text(logic.state.datetime),
        ),
        ElevatedButton(
          onPressed: logic.onPressed,
          child: const Text("update comp2"),
        ),
      ],
    );
  }
}
