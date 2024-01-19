import 'package:bruno/bruno.dart';
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
        title: const Text("仪表盘"),
        actions: [
          GFIconButton(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            icon: const Icon(
              Icons.sync,
              color: Colors.white,
            ),
            type: GFButtonType.transparent,
            onPressed: () {
              logic.getStockIndexData();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              BrnShadowCard(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BrnCommonCardTitle(
                      title: 'A股',
                    ),
                    GetBuilder<DashboardLogic>(builder: (logic) {
                      return GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 4,
                            childAspectRatio: 1.84,
                          ),
                          itemCount: state.CN_StockIndex.length,
                          itemBuilder: (context, index) {
                            return Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [logic.getBgColor(state.CN_StockIndex[index].quote!.chg ?? 0), Colors.white]),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(state.CN_StockIndex[index].quote!.name!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                    Text(state.CN_StockIndex[index].quote!.current.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            color: logic.getTextColor(state.CN_StockIndex[index].quote!.percent ?? 0))),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("${state.CN_StockIndex[index].quote!.chg ?? 0}",
                                            style: TextStyle(
                                                color: logic.getTextColor(state.CN_StockIndex[index].quote!.percent ?? 0),
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(width: 6),
                                        Text("${state.CN_StockIndex[index].quote!.percent ?? 0}%",
                                            style: TextStyle(
                                                color: logic.getTextColor(state.CN_StockIndex[index].quote!.percent ?? 0),
                                                fontWeight: FontWeight.w600))
                                      ],
                                    )
                                  ],
                                ));
                          });
                    }),
                    const BrnCommonCardTitle(
                      title: '港股',
                    ),
                    GetBuilder<DashboardLogic>(builder: (logic) {
                      return GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 4,
                            childAspectRatio: 1.84,
                          ),
                          itemCount: state.HK_StockIndex.length,
                          itemBuilder: (context, index) {
                            return Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [logic.getBgColor(state.HK_StockIndex[index].quote!.chg ?? 0), Colors.white]),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(state.HK_StockIndex[index].quote!.name!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                    Text(state.HK_StockIndex[index].quote!.current.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            color: logic.getTextColor(state.HK_StockIndex[index].quote!.percent ?? 0))),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("${state.HK_StockIndex[index].quote!.chg ?? 0}",
                                            style: TextStyle(
                                                color: logic.getTextColor(state.HK_StockIndex[index].quote!.percent ?? 0),
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(width: 6),
                                        Text("${state.HK_StockIndex[index].quote!.percent ?? 0}%",
                                            style: TextStyle(
                                                color: logic.getTextColor(state.HK_StockIndex[index].quote!.percent ?? 0),
                                                fontWeight: FontWeight.w600))
                                      ],
                                    )
                                  ],
                                ));
                          });
                    }),
                    const BrnCommonCardTitle(
                      title: '美股',
                    ),
                    GetBuilder<DashboardLogic>(builder: (logic) {
                      return GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 4,
                            childAspectRatio: 1.84,
                          ),
                          itemCount: state.US_StockIndex.length,
                          itemBuilder: (context, index) {
                            return Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [logic.getBgColor(state.US_StockIndex[index].quote!.percent ?? 0), Colors.white]),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(state.US_StockIndex[index].quote!.name!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                    Text(state.US_StockIndex[index].quote!.current.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            color: logic.getTextColor(state.US_StockIndex[index].quote!.percent ?? 0))),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("${state.US_StockIndex[index].quote!.chg ?? 0}",
                                            style: TextStyle(
                                                color: logic.getTextColor(state.US_StockIndex[index].quote!.percent ?? 0),
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(width: 6),
                                        Text("${state.US_StockIndex[index].quote!.percent}%",
                                            style: TextStyle(
                                                color: logic.getTextColor(state.US_StockIndex[index].quote!.percent ?? 0),
                                                fontWeight: FontWeight.w600))
                                      ],
                                    )
                                  ],
                                ));
                          });
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
