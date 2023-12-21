import 'dart:convert';

PortfolioDetail portfolioDetailFromJson(String str) => PortfolioDetail.fromJson(json.decode(str));

String portfolioDetailToJson(PortfolioDetail data) => json.encode(data.toJson());

class PortfolioDetail {
  int? id;
  String? name;
  String? code;
  int? portfolioId;
  String? type;
  int? over;
  dynamic overIncome;
  double? unitPrice;
  double? amount;
  DateTime? purchaseTime;
  DateTime? updateTime;
  String? location;

  PortfolioDetail({
    this.id,
    this.name,
    this.code,
    this.portfolioId,
    this.type,
    this.over,
    this.overIncome,
    this.unitPrice,
    this.amount,
    this.purchaseTime,
    this.updateTime,
    this.location,
  });

  factory PortfolioDetail.fromJson(Map<String, dynamic> json) => PortfolioDetail(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        portfolioId: json["portfolioId"],
        type: json["type"],
        over: json["over"],
        overIncome: json["overIncome"],
        unitPrice: json["unitPrice"]?.toDouble(),
        amount: json["amount"],
        purchaseTime: json["purchaseTime"] == null ? null : DateTime.parse(json["purchaseTime"]),
        updateTime: json["updateTime"] == null ? null : DateTime.parse(json["updateTime"]),
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "portfolioId": portfolioId,
        "type": type,
        "over": over,
        "overIncome": overIncome,
        "unitPrice": unitPrice,
        "amount": amount,
        "purchaseTime": purchaseTime?.toIso8601String(),
        "updateTime": updateTime?.toIso8601String(),
        "location": location,
      };
}
