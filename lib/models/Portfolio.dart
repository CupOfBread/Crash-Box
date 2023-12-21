import 'dart:convert';

import 'User.dart';

Portfolio portfolioFromJson(String str) => Portfolio.fromJson(json.decode(str));

String portfolioToJson(Portfolio data) => json.encode(data.toJson());

class Portfolio {
  int? id;
  String? portfolioName;
  int? userId;
  double? fund;
  dynamic cash;
  double? marketValue;
  double? marketValueYes;
  int? score;
  String? tag;
  String? target;
  String? strategy;
  DateTime? createTime;
  DateTime? updateTime;
  User? user;

  Portfolio({
    this.id,
    this.portfolioName,
    this.userId,
    this.fund,
    this.cash,
    this.marketValue,
    this.marketValueYes,
    this.score,
    this.tag,
    this.target,
    this.strategy,
    this.createTime,
    this.updateTime,
    this.user,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        id: json["id"],
        portfolioName: json["portfolioName"],
        userId: json["userId"],
        fund: json["fund"],
        cash: json["cash"],
        marketValue: json["marketValue"],
        marketValueYes: json["marketValueYes"]?.toDouble(),
        score: json["score"],
        tag: json["tag"],
        target: json["target"],
        strategy: json["strategy"],
        createTime: json["createTime"] == null ? null : DateTime.parse(json["createTime"]),
        updateTime: json["updateTime"] == null ? null : DateTime.parse(json["updateTime"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "portfolioName": portfolioName,
        "userId": userId,
        "fund": fund,
        "cash": cash,
        "marketValue": marketValue,
        "marketValueYes": marketValueYes,
        "score": score,
        "tag": tag,
        "target": target,
        "strategy": strategy,
        "createTime": createTime?.toIso8601String(),
        "updateTime": updateTime?.toIso8601String(),
        "user": user?.toJson(),
      };
}
