import 'package:crash_box/components/portfolio_list/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../components/portfolio_list/logic.dart';
import 'logic.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage({Key? key}) : super(key: key);

  final logic = Get.put(PortfolioLogic());
  final state = Get.find<PortfolioLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: GFColors.DARK,
        brightness: Brightness.dark,
        title: Text("组合"),
        actions: [
          GFIconButton(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            icon: const Icon(
              Icons.sync,
              color: Colors.white,
            ),
            type: GFButtonType.transparent,
            onPressed: () {
              final portfolioListLogic = Get.find<PortfolioListLogic>();
              portfolioListLogic.getPortfolioList();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 34,
              color: const Color.fromRGBO(232, 232, 232, 1.0),
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '组合名称',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, decoration: TextDecoration.underline),
                  ),
                  Text(
                    '市值/涨跌幅',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
            PortfolioListComponent()
          ],
        ),
      ),
    );
  }
}
