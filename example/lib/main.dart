import 'package:flutter/material.dart';

import 'logic.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainLogic logic = MainLogic().put(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('例子'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("1、单个刷新"),
            onTap: logic.onSinglePageTap,
          ),
          ListTile(
            title: const Text("2、多个位置同时刷新"),
            onTap: logic.onMultiplePageTap,
          ),
          ListTile(
            title: const Text("3、按照id刷新"),
            onTap: logic.onIdPageTap,
          ),
          ListTile(
            title: const Text("4、跨组件调用"),
            onTap: logic.onAcrossCompPageTap,
          ),
          ListTile(
            title: const Text("5、跨页面调用"),
            onTap: logic.onPage1ViewTap,
          ),
          const ListTile(
            title: Text("6、路由(当前就是例子)"),
          ),
          ListTile(
            title: const Text("7、跨页面传递参数"),
            onTap: logic.onArgsPageTap,
          ),
        ],
      ),
    );
  }
}
