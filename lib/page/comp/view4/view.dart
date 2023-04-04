import 'package:flutter/material.dart';
import 'logic.dart';

class View4View extends StatelessWidget {
  const View4View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final View4Logic logic = View4Logic().put();
    return Column(
      children: [
        logic.builder(
          builder: ()=>Text(logic.state.datetime),
        ),
        ElevatedButton(
          onPressed: logic.onPressed,
          child: const Text("VIEW4 NOW"),
        ),
      ],
    );
  }
}
