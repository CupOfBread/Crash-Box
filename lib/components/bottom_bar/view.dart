import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class BottomBarComponent extends StatelessWidget {
  const BottomBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(BottomBarLogic());
    final state = Get.find<BottomBarLogic>().state;

    return GetBuilder<BottomBarLogic>(builder: (logic) {
      return BottomNavigationBar(
          currentIndex: state.currentIndex,
          iconSize: 28,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedFontSize: 10,
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.98),
          selectedItemColor: Color.fromRGBO(255, 81, 4, 1),
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            logic.changeNavIndex(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.savings), label: "组合"),
            BottomNavigationBarItem(icon: Icon(Icons.face), label: "我的"),
          ]);
    });
  }
}
