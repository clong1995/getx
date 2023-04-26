import 'package:flutter/material.dart';
import 'package:getx/getx.dart';
import 'package:getx/key.dart';

import 'pages/across_comp/page.dart';
import 'pages/across_page/page1/view.dart';
import 'pages/id/page.dart';
import 'pages/multiple/page.dart';
import 'pages/single/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getxNavKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('例子'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text("1、单个刷新"),
              onTap: () => Getx.push(() => const SinglePage()),
            ),
            ListTile(
              title: const Text("2、多个位置同时刷新"),
              onTap: () => Getx.push(() => const MultiplePage()),
            ),
            ListTile(
              title: const Text("3、按照id刷新"),
              onTap: () => Getx.push(() => const IdPage()),
            ),
            ListTile(
              title: const Text("4、跨组件调用"),
              onTap: () => Getx.push(() => const AcrossCompPage()),
            ),
            ListTile(
              title: const Text("5、跨页面调用"),
              onTap: () => Getx.push(() => const Page1View()),
            ),
            const ListTile(
              title: Text("6、路由(当前就是例子)"),
            ),
          ],
        ),
      ),
    );
  }
}
