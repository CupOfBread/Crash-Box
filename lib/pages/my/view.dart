import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

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
        child: Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              BrnShadowCard(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                color: Colors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BrnCommonCardTitle(
                      title: 'CRASH BOX',
                    ),
                    BrnExpandableText(
                      text: '更清晰地展示实盘组合。',
                      maxLines: 2,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              GetBuilder<MyLogic>(builder: (logic) {
                return BrnShadowCard(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BrnCommonCardTitle(
                        title: '当前版本',
                        accessoryText: state.appVersion,
                      ),
                      BrnExpandableText(
                        text: state.latestAppVersionRemark,
                        maxLines: 2,
                      )
                    ],
                  ),
                );
              }),
              logic.getUpdateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
