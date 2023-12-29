import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';

import 'logic.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final logic = Get.put(DashboardLogic());
  final state = Get.find<DashboardLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: GFColors.DARK,
        brightness: Brightness.dark,
        title: Text("仪表盘"),
        actions: [
          GFIconButton(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            icon: const Icon(
              Icons.add_chart,
              color: Colors.white,
            ),
            type: GFButtonType.transparent,
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Text('DASHBOARD'),
      ),
    );
  }
}
