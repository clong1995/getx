import 'package:flutter/material.dart';
import 'logic.dart';

class MyView extends StatelessWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyLogic logic = MyLogic().put();

    return Column(
      children: [
        logic.builder(
          id: "count",
          builder: ()=>Text("${logic.state.count}"),
        ),
        ElevatedButton(
          onPressed: logic.onPressed,
          child: const Text("ADD"),
        ),
      ],
    );
  }
}


