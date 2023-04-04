import 'package:getx/getx.dart';

import 'pages/across_comp/page.dart';
import 'pages/across_page/page1/view.dart';
import 'pages/id/page.dart';
import 'pages/multiple/page.dart';
import 'pages/single/page.dart';

class MainLogic extends Logic<MainLogic> {
  @override
  MainLogic put() => putLogic(this);

  //
  void navSinglePage() => navPush(() => const SinglePage());

  //
  void navMultiplePage() => navPush(() => const MultiplePage());

  //
  void navIdPage() => navPush(() => const IdPage());

  //
  void navAcrossCompPage() => navPush(() => const AcrossCompPage());

  //
  void navAcrossPagePage() => navPush(() => const Page1View());
}
