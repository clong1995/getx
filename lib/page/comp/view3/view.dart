import 'package:flutter/material.dart';
import 'logic.dart';

class View3View extends StatelessWidget {
  const View3View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final View3Logic logic = View3Logic().put();
    return Column(
      children: [
        logic.builder(
          builder: ()=>Text(logic.state.datetime),
        ),
        ElevatedButton(
          onPressed: logic.onPressed,
          child: const Text("VIEW3 NOW"),
        ),
      ],
    );
  }
}
