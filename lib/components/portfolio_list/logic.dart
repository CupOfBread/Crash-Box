import 'package:bruno/bruno.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../models/Portfolio.dart';
import '../../services/global_value.dart';
import 'state.dart';

class PortfolioListLogic extends GetxController {
  final PortfolioListState state = PortfolioListState();
  final GLOBAL_VALUE = GetIt.I<GlobalValue>();
  final dio = GetIt.I<Dio>();

  @override
  void onInit() {
    getPortfolioList();
    super.onInit();
  }

  void getPortfolioList() async {
    final response = await dio.get("portfolio/queryPage", queryParameters: {'current': state.current, 'size': state.size});

    var list = response.data['result']['records'];
    List<Portfolio> portfolioList = List<Portfolio>.from(list.map((e) => Portfolio.fromJson(e)).toList());

    state.portfolioList = portfolioList;
    BrnToast.show("获取组合列表成功", Get.overlayContext!);
    update();
  }

  getPercent(double today, double yesterday) {
    bool isUp = today - yesterday > 0;
    bool isSame = today - yesterday == 0;
    Color textColor = Colors.black;

    if (isUp && !isSame) {
      textColor = Colors.red;
    }
    if (!isUp && !isSame) {
      textColor = Colors.green;
    }

    return Text(
      '${((today - yesterday) / yesterday * 100).toStringAsFixed(2)}%',
      style: TextStyle(color: textColor, fontSize: 11),
    );
  }

  getTags(String tags) {
    if (tags == '') {
      return const Row();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: BrnTagCustom(
        tagText: tags.split(',')[0],
        backgroundColor: Colors.green,
        tagBorderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5), topRight: Radius.circular(5)),
      ),
    );
  }
}
