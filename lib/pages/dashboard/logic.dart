import 'package:bruno/bruno.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../models/StockBatch.dart';
import 'state.dart';

class DashboardLogic extends GetxController {
  final DashboardState state = DashboardState();

  @override
  Future<void> onInit() async {
    super.onInit();
    getStockIndexData();
  }

  getStockIndexData() async {
    state.isLoading = true;
    update();

    final dio = GetIt.I<Dio>();
    final response = await dio.get("/stock/index");
    if (response.data['success'] == false) {
      BrnToast.show("获取指数信息失败，请联系管理员修复！", Get.overlayContext!);
      return;
    }

    state.CN_StockIndex = [];
    state.HK_StockIndex = [];
    state.US_StockIndex = [];

    List<dynamic> items = response.data['data']['items'];

    List<StockBatch> stockBatchList = List<StockBatch>.from(items.map((e) => StockBatch.fromJson(e)).toList());

    for (var code in state.cnStockIndexCode) {
      for (var stock in stockBatchList) {
        if (code == stock.quote?.symbol) {
          state.CN_StockIndex.add(stock);
        }
      }
    }
    for (var code in state.hkStockIndexCode) {
      for (var stock in stockBatchList) {
        if (code == stock.quote?.symbol) {
          state.HK_StockIndex.add(stock);
        }
      }
    }
    for (var code in state.usStockIndexCode) {
      for (var stock in stockBatchList) {
        if (code == stock.quote?.symbol) {
          state.US_StockIndex.add(stock);
        }
      }
    }
    BrnToast.show("刷新成功", Get.overlayContext!);
    state.isLoading = false;
    update();
  }

  getTextColor(double num) {
    if (num == 0.0) return Colors.black;
    if (num > 0.0) return Colors.red;
    if (num < 0.0) return Colors.green;
  }

  getBgColor(double num) {
    if (num == 0.0) return Color.fromRGBO(227, 227, 227, 1.0);
    if (num > 0.0) return Colors.red[100];
    if (num < 0.0) return Colors.green[100];
  }
}
