import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

import 'logic.dart';

class PortfolioInstructionPage extends StatelessWidget {
  PortfolioInstructionPage({Key? key}) : super(key: key);

  final logic = Get.put(PortfolioInstructionLogic());
  final state = Get.find<PortfolioInstructionLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          backgroundColor: GFColors.DARK,
          brightness: Brightness.dark,
          title: const Text("说明"),
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
                            title: '组合归档&更新时间',
                          ),
                          Text(
                            '工作日17:00',
                          ),
                          BrnCommonCardTitle(
                            title: '年化收益率',
                          ),
                          Text(
                            '年化收益率 = (投资内收益 / 本金) / (投资天数 / 365) * 100%\n\n'
                                '投资内收益 = 市值 - 本金 + 已清仓股票',
                          ),
                          BrnCommonCardTitle(
                            title: '市值',
                          ),
                          Text(
                            '市值 = 所有股票当日累计市值 + 现金',
                          ),
                          BrnCommonCardTitle(
                            title: '特色数据',
                          ),
                          Text(
                            '(特色数据功能暂未实现，敬请期待！)\n\n'
                            '夏普比率= (Rp - Rf)/σp\n其中，Rp代表投资组合的预期收益率，Rf代表无风险利率，σp代表投资组合的标准差。',
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
