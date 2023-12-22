import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import 'logic.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final logic = Get.put(MyLogic());
  final state = Get.find<MyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: GFColors.DARK,
        brightness: Brightness.dark,
        title: const Text("设置"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const GFListTile(titleText: 'Crash Box', subTitleText: '更清晰地展示实盘组合。', color: Colors.white),
            GetBuilder<MyLogic>(builder: (logic) {
              return GFListTile(titleText: '当前版本', subTitleText: state.appVersion, color: Colors.white);
            }),
            logic.getUpdateButton(),
          ],
        ),
      ),
    );
  }
}
