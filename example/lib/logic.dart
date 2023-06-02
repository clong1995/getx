import 'package:flutter/material.dart';
import 'package:getx/logic.dart';
import 'pages/test/page.dart';

import 'pages/across_comp/page.dart';
import 'pages/across_page/page1/view.dart';
import 'pages/args/args.dart';
import 'pages/args/page.dart';
import 'pages/id/page.dart';
import 'pages/multiple/page.dart';
import 'pages/single/page.dart';

class MainLogic extends Logic<MainLogic> {
  //单个刷新
  void onSinglePageTap() => push(() => const SinglePage());

  //多个位置同时刷新
  void onMultiplePageTap() => push(() => const MultiplePage());

  //按照id刷新
  void onIdPageTap() => push(() => const IdPage());

  //跨组件调用
  void onAcrossCompPageTap() => push(() => const AcrossCompPage());

  //跨页面调用
  void onPage1ViewTap() => push(() => const Page1View());

  //跨页面调用
  void onArgsPageTap() => push(
        () => const ArgsPage(),
        ArgsArgs(
          age: 18,
          name: "小华",
        ),
      );

  void onTestPageTap() => push(() => const TestPage());

  @override
  MainLogic put(BuildContext context) => putLogic(this, context);
}
