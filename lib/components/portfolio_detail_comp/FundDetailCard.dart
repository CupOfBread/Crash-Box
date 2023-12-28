import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class FundDetailCard extends StatelessWidget {
  const FundDetailCard({super.key, required this.fund, required this.marketValue, required this.clearanceIncome, required this.cash, required this.todayIncome});

  // 投入资金额
  final double fund;

  // 当前市值
  final double marketValue;

  // 清仓收入
  final double clearanceIncome;

  // 现金
  final double cash;

  //当日浮动
  final double todayIncome;

  getColor(double number) {
    if (number == 0) {
      return Colors.black;
    }
    if (number > 0) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BrnShadowCard(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 12),
        color: Colors.white,
        child: Column(
          children: [
            const BrnCommonCardTitle(
              title: '组合详情',
            ),
            BrnRichInfoGrid(
              padding: const EdgeInsets.only(left: 8, right: 8),
              crossAxisCount: 2,
              pairInfoList: [
                BrnRichGridInfo('投入资金：', fund.toStringAsFixed(2)),
                BrnRichGridInfo('当前市值：', marketValue.toStringAsFixed(2)),
                BrnRichGridInfo('\t\t\t\t\t\t\t现金：', cash.toStringAsFixed(2)),
                BrnRichGridInfo(
                    '当日浮动：',
                    Text(
                      todayIncome.toStringAsFixed(2),
                      style: TextStyle(color: getColor(todayIncome)),
                    )),
                BrnRichGridInfo(
                    '清仓收益：',
                    Text(
                      clearanceIncome.toStringAsFixed(2),
                      style: TextStyle(color: getColor(clearanceIncome)),
                    )),
                BrnRichGridInfo(
                    '浮动收益：',
                    Text(
                      (marketValue - fund).toStringAsFixed(2),
                      style: TextStyle(color: getColor(marketValue - fund + clearanceIncome)),
                    )),
                BrnRichGridInfo(
                    '总收益额：',
                    Text(
                      (marketValue - fund + clearanceIncome).toStringAsFixed(2),
                      style: TextStyle(color: getColor(marketValue - fund + clearanceIncome)),
                    )),
                BrnRichGridInfo(
                    '总收益率：',
                    Text(
                      '${((marketValue - fund + clearanceIncome) / fund * 100).toStringAsFixed(2)}%',
                      style: TextStyle(color: getColor((marketValue - fund + clearanceIncome) / fund)),
                    )),
              ],
            ),
          ],
        ));
  }
}
