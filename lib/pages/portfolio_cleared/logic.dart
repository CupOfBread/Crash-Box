import 'package:crash_box/common/Logger.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../models/PortfolioDetail.dart';
import 'state.dart';

class PortfolioClearedLogic extends GetxController {
  final PortfolioClearedState state = PortfolioClearedState();
  final dio = GetIt.I<Dio>();

  @override
  Future<void> onInit() async {
    state.id = Get.parameters['id'].toString();

    LogI(state.id);

    final response = await dio.get("/portfolio/queryClearedData", queryParameters: {'portfolioId': state.id});

    List<PortfolioDetail> detailList = List<PortfolioDetail>.from(response.data['data'].map((e) => PortfolioDetail.fromJson(e)).toList());

    for (var element in detailList) {
      Map<String, String> stock = {};
      stock["code"] = element.location! + element.code!;
      stock["purchaseTime"] = formatDate(element.purchaseTime ?? DateTime(2024, 1, 1), [yyyy, '-', mm, '-', dd]);
      stock["sellTime"] = formatDate(element.sellTime ?? DateTime(2024, 1, 1), [yyyy, '-', mm, '-', dd]);
      stock["overIncome"] = element.overIncome!.toStringAsFixed(2);
      stock["stockName"] = '${element.name}(${element.location}${element.code})';
      stock["type"] = (element.type ?? 'stock') == 'stock' ? '股票' : '基金';
      state.stockList.add(stock);
    }
    update();
    super.onInit();
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
}
