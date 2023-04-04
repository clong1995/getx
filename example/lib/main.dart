import 'package:flutter/material.dart';

import 'logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MainLogic logic = MainLogic().put();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('例子'),
        ),
        body: logic.builder(
            builder: () => ListView(
                  children: [
                    ListTile(
                      title: const Text("1、单个刷新"),
                      onTap: logic.navSinglePage,
                    ),
                    ListTile(
                      title: Text("2、多个位置同时刷新"),
                      onTap: logic.navMultiplePage,
                    ),
                    ListTile(
                      title: Text("3、按照id刷新"),
                      onTap: logic.navIdPage,
                    ),
                    ListTile(
                      title: Text("4、跨组件调用"),
                      onTap: logic.navAcrossCompPage,
                    ),
                    ListTile(
                      title: Text("5、跨页面调用"),
                      onTap: logic.navAcrossPagePage,
                    ),
                    ListTile(
                      title: Text("6、路由(当前就是例子)"),
                    ),
                  ],
                )),
      ),
    );
  }
}
