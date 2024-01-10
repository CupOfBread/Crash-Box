import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import '../../models/Portfolio.dart';
import '../../models/PortfolioCharacteristic.dart';
import '../../models/PortfolioDetail.dart';

class PortfolioDetailState {
  bool showBackToTopButton = false;
  late String id;
  late String name;
  late Portfolio portfolio = Portfolio(updateTime: DateTime.now(), createTime: DateTime.now(), fund: 0, marketValue: 0, marketValueYes: 0);
  late PortfolioCharacteristic characteristic = PortfolioCharacteristic();
  late double incomeRate = 0.0;
  late double clearanceIncome = 0.0;
  late double totalCost = 0.0;
  late double todayIncome = 0.0;
  late bool isTrade = false;
  late List<PortfolioDetail> detailList = [];
  late List<Map<String, String>> stockList = [];
  List<Color> randomColors = [
    Colors.brown,
    Colors.redAccent,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.deepPurple,
    Colors.teal,
    Colors.limeAccent,
    Colors.green,
  ];

  List<BrnDoughnutDataItem> graphData = [];

  PortfolioDetailState() {}
}
