import 'dart:async';

import 'package:bruno/bruno.dart';
import 'package:crash_box/models/Portfolio.dart';
import 'package:crash_box/models/PortfolioCharacteristic.dart';
import 'package:crash_box/models/PortfolioDetail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'state.dart';

class PortfolioDetailLogic extends GetxController {
  final PortfolioDetailState state = PortfolioDetailState();
  final dio = GetIt.I<Dio>();
  Timer? timer;
  String? stockQueryStr = '';

  @override
  Future<void> onInit() async {
    state.id = Get.parameters['id'].toString();
    state.name = Get.parameters['portfolioName'].toString();

    // 1分钟刷新一次数据
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      refreshData();
    });

    super.onInit();

    await refreshData();
    update();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void test() {
    refreshData();
    update();
  }

  getColor(double num) {
    if (num == 0) {
      return Colors.black;
    }
    if (num > 0) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  refreshData() async {
    final response = await dio.get("portfolio/queryDetail", queryParameters: {'id': state.id});
    // clean old data
    state.graphData = [];
    state.totalCost = 0.0;
    state.clearanceIncome = 0.0;
    state.stockList = [];
    state.todayIncome = 0.0;
    stockQueryStr = '';

    // 获取后端数据
    if (response.data['result']['portfolio'] != null) {
      state.portfolio = Portfolio.fromJson(response.data['result']['portfolio']);
    }
    if (response.data['result']['characteristic'] != null) {
      state.characteristic = PortfolioCharacteristic.fromJson(response.data['result']['characteristic']);
    }
    if (response.data['result']['detail'] != null) {
      state.detailList = List<PortfolioDetail>.from(response.data['result']['detail'].map((e) => PortfolioDetail.fromJson(e)).toList());
    }

    for (var detail in state.detailList) {
      // 累加已清仓股票&基金收益
      if (detail.over == 1) {
        state.clearanceIncome += detail.overIncome;
        continue;
      }

      // 生成饼图
      state.graphData.add(BrnDoughnutDataItem(
          title: detail.name!.substring(0, detail.name!.length > 4 ? 6 : 4),
          value: detail.unitPrice! * detail.amount!,
          color: state.randomColors[state.detailList.indexOf(detail)]));

      // 计算总成本
      state.totalCost += detail.unitPrice! * detail.amount!;
    }

    // ===============请求雪球股票实盘API===============
    // 组装查询股票实盘字符串
    for (var element in state.detailList) {
      // 跳过已清仓股票、基金
      if (element.over == 1 || element.type == 'funds') continue;
      if (stockQueryStr!.isEmpty) {
        stockQueryStr = element.location! + element.code!;
      } else {
        stockQueryStr = '$stockQueryStr,${element.location!}${element.code!}';
      }
    }
    if (stockQueryStr!.isEmpty) return;
    final currentStockData = await dio.get("https://stock.xueqiu.com/v5/stock/realtime/quotec.json?symbol=${stockQueryStr!}");
    // ===============请求雪球股票实盘API===============
    generateStockListData(currentStockData);

    state.stockList.sort((a, b) => b['percent']!.compareTo(a['percent']!));
    BrnToast.show("刷新实盘数据成功", Get.overlayContext!);
  }

  void generateStockListData(currentStockData) {
    // 遍历组合内所有持仓
    for (var detail in state.detailList) {
      // 跳过已经清仓的股票&基金
      if (detail.over == 1) continue;

      // 匹配从雪球股票API查询的数据
      var stockCurrent;
      for (var data in currentStockData.data['data']) {
        if (data['symbol'] == detail.location! + detail.code!) {
          stockCurrent = data;
          break;
        }
      }

      // 累加当日浮动收益
      state.todayIncome += (stockCurrent['chg'] * detail.amount);

      Map<String, String> item = {};
      item["stockName"] = '${detail.name}(${detail.location}${detail.code})';
      item["costUnitPrice"] = detail.unitPrice!.toStringAsFixed(3);
      item["currentUnitPrice"] = stockCurrent['current'].toStringAsFixed(3);
      if (stockCurrent['percent'] == null)
        item["stockPercent"] = '0.00';
      else
        item["stockPercent"] = stockCurrent['percent'].toStringAsFixed(2);
      item["amount"] = detail.amount!.toString();
      item["percent"] = ((detail.unitPrice! * detail.amount!.toDouble()) / state.totalCost * 100.0).toStringAsFixed(2);
      state.stockList.add(item);
    }
  }
}
