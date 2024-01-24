import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import '../../models/Portfolio.dart';
import '../../models/PortfolioCharacteristic.dart';
import '../../models/PortfolioDetail.dart';

class PortfolioDetailState {
  bool showBackToTopButton = false;

  late String id;
  late String name;

  Portfolio portfolio = Portfolio(updateTime: DateTime.now(), createTime: DateTime.now(), fund: 0, marketValue: 0, marketValueYes: 0);
  PortfolioCharacteristic characteristic = PortfolioCharacteristic();
  double incomeRate = 0.0;
  double clearanceIncome = 0.0;
  double totalCost = 0.0;
  double todayIncome = 0.0;
  double currentMarketValue = 0.0;
  bool isTrade = false;
  List<PortfolioDetail> detailList = [];
  List<Map<String, String>> stockList = [];
  bool isLoading = true;
  List<Color> randomColors = [
    Color(0xFFff4d4f),
    Color(0xFF722ed1),
    Color(0xFFfa8c16),
    Color(0xFF13c2c2),
    Color(0xFFfadb14),
    Color(0xFFa0d911),
    Color(0xFFeb2f96),
    Color(0xFFff4d4f),
    Color(0xFF722ed1),
    Color(0xFFfa8c16),
    Color(0xFF13c2c2),
    Color(0xFFfadb14),
    Color(0xFFa0d911),
    Color(0xFFeb2f96),
  ];

  List<BrnDoughnutDataItem> graphData = [];

  PortfolioDetailState() {}
}
