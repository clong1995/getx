import 'package:flutter/material.dart';
import 'package:getx/page/comp/view4/view.dart';
import 'comp/view1/view.dart';
import 'comp/view2/view.dart';
import 'comp/view3/view.dart';
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
          onPressed: logic.onAddPressed,
          child: const Text("ADD"),
        ),
        logic.builder(
          id: "datetime",
          builder: ()=>Text(logic.state.datetime),
        ),
        ElevatedButton(
          onPressed: logic.onNowPressed,
          child: const Text("NOW"),
        ),
        logic.builder(
          builder: ()=>Text("${logic.state.random}"),
        ),
        ElevatedButton(
          onPressed: logic.onRandomPressed,
          child: const Text("RANDOM"),
        ),
        Row(
          children: const [
            View1View(),
            View2View(),
          ],
        ),
        const View3View(),
        const View4View(),
      ],
    );
  }
}
