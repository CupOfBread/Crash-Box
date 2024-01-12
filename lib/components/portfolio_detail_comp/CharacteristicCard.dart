import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class CharacteristicCard extends StatelessWidget {
  const CharacteristicCard({super.key, required this.volatility, required this.maxDrawDown, required this.sharpeRatio, required this.incomeRate});

  // 波动率
  final double volatility;

  // 最大回撤
  final double maxDrawDown;

  // 夏普比率
  final double sharpeRatio;

  // 收益(用于计算收益回撤比)
  final double incomeRate;

  @override
  Widget build(BuildContext context) {
    return BrnShadowCard(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 12),
        color: Colors.white,
        child: Column(
          children: [
            const BrnCommonCardTitle(
              title: '特色数据',
              subTitleWidget: Text("(暂未启用)"),
            ),
            BrnEnhanceNumberCard(
              rowCount: 2,
              itemChildren: [
                BrnNumberInfoItemModel(
                  title: '波动率',
                  number: '${volatility.toStringAsFixed(2)}%',
                ),
                BrnNumberInfoItemModel(
                  title: '最大回撤',
                  number: '${maxDrawDown.toStringAsFixed(2)}%',
                ),
                BrnNumberInfoItemModel(
                  title: '夏普比率',
                  number: sharpeRatio.toStringAsFixed(2),
                ),
                BrnNumberInfoItemModel(
                  title: '收益回撤比',
                  number: (incomeRate / maxDrawDown).toStringAsFixed(2),
                ),
              ],
            )
          ],
        ));
  }
}
