import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/portfolio_detail/logic.dart';

class PositionCard extends StatelessWidget {
  PositionCard({super.key, required this.graphData});

  final graphData;

  final logic = Get.find<PortfolioDetailLogic>();
  final state = Get.find<PortfolioDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BrnShadowCard(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 12),
      color: Colors.white,
      child: Column(
        children: [
          const BrnCommonCardTitle(
            title: '持仓详情',
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: BrnDoughnutChart(
              padding: const EdgeInsets.all(20),
              data: graphData,
            ),
          ),
          GetBuilder<PortfolioDetailLogic>(builder: (logic) {
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
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              '${item['percent']}%',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BrnRichInfoGrid(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      crossAxisCount: 2,
                      pairInfoList: [
                        BrnRichGridInfo('\t\t\t\t\t\t\t现价：', item['currentUnitPrice']),
                        BrnRichGridInfo('\t\t\t\t\t\t\t成本：', item['costUnitPrice']),
                        BrnRichGridInfo(
                            '今日涨幅：',
                            Text(
                              '${item['stockPercent']!}%',
                              style: TextStyle(color: logic.getColor(double.parse(item['stockPercent'] ?? ''))),
                            )),
                        BrnRichGridInfo(
                            '建仓以来：',
                            Text(
                              '${((double.parse(item['currentUnitPrice']!) - double.parse(item['costUnitPrice']!)) / double.parse(item['costUnitPrice']!) * 100.0).toStringAsFixed(2)}%',
                              style: TextStyle(
                                  color: logic.getColor((double.parse(item['currentUnitPrice']!) - double.parse(item['costUnitPrice']!)) /
                                      double.parse(item['costUnitPrice']!) *
                                      100.0)),
                            )),
                        BrnRichGridInfo('持仓数量：', item['amount']),
                        BrnRichGridInfo('持仓市值：', (double.parse(item['amount']!) * double.parse(item['currentUnitPrice']!)).toStringAsFixed(2)),
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
          })
        ],
      ),
    );
  }
}
