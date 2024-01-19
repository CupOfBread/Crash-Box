import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

import 'logic.dart';

class PortfolioClearedPage extends StatelessWidget {
  PortfolioClearedPage({super.key});

  final logic = Get.put(PortfolioClearedLogic());
  final state = Get.find<PortfolioClearedLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          backgroundColor: GFColors.DARK,
          brightness: Brightness.dark,
          title: const Text("已清仓项目"),
        ),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(8),
                child: ListView(children: [
                  BrnShadowCard(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      color: Colors.white,
                      child: GetBuilder<PortfolioClearedLogic>(builder: (logic) {
                        return Column(
                          children: state.stockList.map((item) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.sizeOf(context).width * 0.6,
                                        height: 40,
                                        alignment: const AlignmentDirectional(-1, 0),
                                        child: Text(
                                          item['stockName'] ?? '-',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w800,
                                              color: logic.getColor(double.parse(item['overIncome'] ?? '0'))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                BrnRichInfoGrid(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  crossAxisCount: 2,
                                  pairInfoList: [
                                    BrnRichGridInfo(
                                        '清仓收益：',
                                        Text(
                                          item['overIncome'] ?? "-",
                                          style:
                                              TextStyle(color: logic.getColor(double.parse(item['overIncome'] ?? '0')), fontWeight: FontWeight.w600),
                                        )),
                                    BrnRichGridInfo('项目类型：', Text(item['type'] ?? "-")),
                                    BrnRichGridInfo('购买时间：', Text(item['purchaseTime'] ?? "-")),
                                    BrnRichGridInfo('清仓时间：', Text(item['sellTime'] ?? "-")),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                  child: Container(
                                    height: 1,
                                    color: const Color.fromRGBO(245, 245, 245, 1.0),
                                  ),
                                )
                              ],
                            );
                          }).toList(),
                        );
                      }))
                ]))));
  }
}
