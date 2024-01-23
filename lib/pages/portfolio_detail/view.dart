import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:date_format/date_format.dart';

import 'package:crash_box/components/portfolio_detail_comp/CharacteristicCard.dart';
import 'package:crash_box/components/portfolio_detail_comp/FundDetailCard.dart';
import 'package:crash_box/components/portfolio_detail_comp/OverviewCard.dart';
import 'package:crash_box/components/portfolio_detail_comp/PortfolioInfo.dart';
import 'package:crash_box/components/portfolio_detail_comp/TradeNoticeBar.dart';
import 'package:crash_box/components/portfolio_detail_comp/PositionCard.dart';
import 'logic.dart';

class PortfolioDetailPage extends StatelessWidget {
  PortfolioDetailPage({super.key});

  final logic = Get.put(PortfolioDetailLogic());
  final state = Get.find<PortfolioDetailLogic>().state;
  late ScrollController _scrollController;

  void scrollToTop() {
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 600), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset >= 200) {
          logic.showBackToTopButton(true);
        } else {
          logic.showBackToTopButton(false);
        }
      });

    return Scaffold(
        appBar: GFAppBar(
          backgroundColor: GFColors.DARK,
          brightness: Brightness.dark,
          title: Text(state.name),
          actions: [
            PopupMenuButton(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: "refresh",
                    child: Text("刷新"),
                  ),
                  const PopupMenuItem(
                    value: "clearance",
                    child: Text("已清仓项目"),
                  ),
                  // const PopupMenuItem(
                  //   value: "historyDigit",
                  //   child: Text("历史净值"),
                  // ),
                  const PopupMenuItem(
                    value: "instructions",
                    child: Text("组合说明"),
                  ),
                ];
              },
              color: Colors.white,
              onSelected: (String option) {
                logic.doAction(option);
              },
            )
          ],
        ),
        floatingActionButton: GetBuilder<PortfolioDetailLogic>(builder: (logic) {
          return state.showBackToTopButton
              ? GFIconButton(
                  onPressed: scrollToTop,
                  icon: const Icon(Icons.arrow_upward),
                  shape: GFIconButtonShape.circle,
                  color: Colors.black26,
                )
              : const SizedBox();
        }),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(8),
                child: ListView(
                  shrinkWrap: true,
                  controller: _scrollController,
                  children: [
                    GetBuilder<PortfolioDetailLogic>(builder: (logic) {
                      return state.isLoading
                          ? const Column(
                              children: [
                                SizedBox(height: 14),
                                GFLoader(
                                  type: GFLoaderType.custom,
                                  loaderIconOne: Text('加载中...'),
                                ),
                                SizedBox(height: 14),
                              ],
                            )
                          : const SizedBox();
                    }),
                    GetBuilder<PortfolioDetailLogic>(builder: (logic) {
                      return TradeNoticeBar(
                        isTrade: state.isTrade,
                      );
                    }),
                    const SizedBox(height: 8),
                    GetBuilder<PortfolioDetailLogic>(builder: (logic) {
                      return OverviewCard(
                          // 年化收益率=(投资内收益/本金)/(投资天数/365)*100%
                          // 投资内收益=市值-本金+已清仓股票
                          annualizedRate: ((state.clearanceIncome + state.portfolio.marketValue! - state.portfolio.fund!) / state.portfolio.fund!) /
                              (state.portfolio.updateTime!.difference(state.portfolio.createTime!).inDays / 365) *
                              100,
                          dailyIncreaseRate: (state.portfolio.marketValue! - state.portfolio.marketValueYes!) / state.portfolio.marketValueYes! * 100,
                          lastUpdateDate: formatDate(state.portfolio.updateTime ?? DateTime.now(), [mm, '-', dd]),
                          marketValue: state.portfolio.marketValue ?? 0,
                          durationDays: state.portfolio.updateTime!.difference(state.portfolio.createTime!).inDays);
                    }),
                    const SizedBox(height: 8),
                    GetBuilder<PortfolioDetailLogic>(builder: (logic) {
                      return PositionCard(
                        graphData: state.graphData,
                      );
                    }),
                    const SizedBox(height: 8),
                    GetBuilder<PortfolioDetailLogic>(builder: (logic) {
                      return FundDetailCard(
                        fund: state.portfolio.fund ?? 0,
                        marketValue: state.portfolio.marketValue ?? 0,
                        clearanceIncome: state.clearanceIncome,
                        cash: state.portfolio.cash ?? 0,
                        todayIncome: state.todayIncome,
                      );
                    }),
                    const SizedBox(height: 8),
                    GetBuilder<PortfolioDetailLogic>(builder: (logic) {
                      return PortfolioInfo(
                        target: state.portfolio.target ?? '',
                        strategy: state.portfolio.strategy ?? '',
                        tag: state.portfolio.tag ?? '',
                        portfolio: state.portfolio,
                        createTime: state.portfolio.createTime.toString().substring(0, 10),
                      );
                    }),
                    const SizedBox(height: 8),
                    GetBuilder<PortfolioDetailLogic>(builder: (logic) {
                      return CharacteristicCard(
                        volatility: state.characteristic.volatility ?? 0,
                        maxDrawDown: state.characteristic.maxDrawdown ?? 0,
                        sharpeRatio: state.characteristic.sharpeRatio ?? 0,
                        incomeRate: (state.portfolio.marketValue! - state.portfolio.fund! + state.clearanceIncome) / state.portfolio.fund! * 100,
                      );
                    }),
                    const SizedBox(height: 8)
                  ],
                ))));
  }
}
