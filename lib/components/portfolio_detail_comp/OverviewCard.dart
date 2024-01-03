import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard(
      {super.key,
      required this.annualizedRate,
      required this.dailyIncreaseRate,
      required this.lastUpdateDate,
      required this.marketValue,
      required this.durationDays});

  //成立以来年化
  final double annualizedRate;

  //日涨幅
  final double dailyIncreaseRate;

  //最近更新日期
  final String lastUpdateDate;

  //市值
  final double marketValue;

  //持续天数
  final int durationDays;

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
            title: '组合总览',
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: (MediaQuery.sizeOf(context).width - 32) * 0.49,
                height: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${annualizedRate.toStringAsFixed(2)}%',
                      style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: getColor(annualizedRate)),
                    ),
                    const Text(
                      '年化收益率(成立以来)',
                      style: TextStyle(
                        color: Color(0xFF737373),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: (MediaQuery.sizeOf(context).width - 32) * 0.49,
                height: 100,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              '日涨幅($lastUpdateDate)',
                              style: const TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 12,
                                height: 1.6,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Text(
                                '${dailyIncreaseRate.toStringAsFixed(2)}%',
                                style: TextStyle(
                                  color: getColor(dailyIncreaseRate),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '市值($lastUpdateDate)',
                            style: const TextStyle(
                              color: Color(0xFF5D5D5D),
                              fontSize: 12,
                              height: 1.6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              marketValue.toStringAsFixed(2),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: const Text(
                              '运作天数',
                              style: TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 12,
                                height: 1.6,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              '$durationDays天',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
