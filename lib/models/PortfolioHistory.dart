// To parse this JSON data, do
//
//     final portfolioHistory = portfolioHistoryFromJson(jsonString);

import 'dart:convert';

PortfolioHistory portfolioHistoryFromJson(String str) => PortfolioHistory.fromJson(json.decode(str));

String portfolioHistoryToJson(PortfolioHistory data) => json.encode(data.toJson());

class PortfolioHistory {
  int? id;
  int? portfolioId;
  DateTime? recordTime;
  int? marketValue;
  double? fund;
  double? cash;
  double? overIncome;

  PortfolioHistory({
    this.id,
    this.portfolioId,
    this.recordTime,
    this.marketValue,
    this.fund,
    this.cash,
    this.overIncome,
  });

  factory PortfolioHistory.fromJson(Map<String, dynamic> json) => PortfolioHistory(
    id: json["id"],
    portfolioId: json["portfolioId"],
    recordTime: json["recordTime"] == null ? null : DateTime.parse(json["recordTime"]),
    marketValue: json["marketValue"],
    fund: json["fund"]?.toDouble(),
    cash: json["cash"]?.toDouble(),
    overIncome: json["overIncome"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "portfolioId": portfolioId,
    "recordTime": recordTime?.toIso8601String(),
    "marketValue": marketValue,
    "fund": fund,
    "cash": cash,
    "overIncome": overIncome,
  };
}
