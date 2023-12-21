import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/bottom_bar/logic.dart';
import '../../components/bottom_bar/view.dart';
import '../my/view.dart';
import '../portfolio/view.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic());
    final state = Get.find<HomeLogic>().state;
    final bottomBarLogic = Get.put(BottomBarLogic());

    List<Widget> pages = [PortfolioPage(), MyPage()];

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: bottomBarLogic.pageController,
          children: pages,
        ),
      ),
      bottomNavigationBar: const BottomBarComponent(),
    );
  }
}
