import 'package:flutter/material.dart';
import 'logic.dart';

class View2View extends StatelessWidget {
  const View2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final View2Logic logic = View2Logic().put();
    return Column(
      children: [
        logic.builder(
          builder: ()=>Text(logic.state.datetime),
        ),
        ElevatedButton(
          onPressed: logic.onPressed,
          child: const Text("VIEW1 NOW"),
        ),
      ],
    );
  }
}
