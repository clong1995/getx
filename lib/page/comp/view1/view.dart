import 'package:flutter/material.dart';
import 'logic.dart';

class View1View extends StatelessWidget {
  const View1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final View1Logic logic = View1Logic().put();
    return Column(
      children: [
        logic.builder(
          builder: ()=>Text(logic.state.datetime),
        ),
        ElevatedButton(
          onPressed: logic.onPressed,
          child: const Text("VIEW2 NOW"),
        ),
      ],
    );
  }
}
