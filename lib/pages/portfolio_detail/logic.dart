import 'dart:async';
import 'dart:math';

import 'package:bruno/bruno.dart';
import 'package:crash_box/models/Portfolio.dart';
import 'package:crash_box/models/PortfolioCharacteristic.dart';
import 'package:crash_box/models/PortfolioDetail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../common/Logger.dart';
import 'state.dart';

class PortfolioDetailLogic extends GetxController {
  final PortfolioDetailState state = PortfolioDetailState();
  final dio = GetIt.I<Dio>();
  Timer? timer;
  String? queryStr = '';

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

    if (response.data['result']['portfolio'] != null) {
      state.portfolio = Portfolio.fromJson(response.data['result']['portfolio']);
    }
    if (response.data['result']['characteristic'] != null) {
      state.characteristic = PortfolioCharacteristic.fromJson(response.data['result']['characteristic']);
    }
    if (response.data['result']['detail'] != null) {
      state.detailList = List<PortfolioDetail>.from(response.data['result']['detail'].map((e) => PortfolioDetail.fromJson(e)).toList());
    }

    for (var element in state.detailList) {
      if (element.over == 1) continue;
      if (queryStr!.isEmpty) {
        queryStr = element.location! + element.code!;
      } else {
        queryStr = '$queryStr,${element.location!}${element.code!}';
      }
      state.graphData.add(BrnDoughnutDataItem(
          title: element.name!, value: element.unitPrice! * element.amount!, color: state.randomColors[state.detailList.indexOf(element)]));
      state.totalCost += element.unitPrice! * element.amount!;
    }

    final currentStockData = await dio.get("https://stock.xueqiu.com/v5/stock/realtime/quotec.json?symbol=${queryStr!}");

    for (var detail in state.detailList) {
      if (detail.over == 1) {
        state.clearanceIncome += detail.overIncome;
        continue;
      }
      var stockCurrent;
      for (var data in currentStockData.data['data']) {
        if (data['symbol'] == detail.location! + detail.code!) {
          stockCurrent = data;
          break;
        }
      }

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
    state.stockList.sort((a, b) => b['percent']!.compareTo(a['percent']!));
    BrnToast.show("刷新实盘数据成功", Get.overlayContext!);
  }
}
