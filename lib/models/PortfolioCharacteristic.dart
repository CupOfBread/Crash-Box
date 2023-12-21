import 'dart:convert';

PortfolioCharacteristic portfolioCharacteristicFromJson(String str) => PortfolioCharacteristic.fromJson(json.decode(str));

String portfolioCharacteristicToJson(PortfolioCharacteristic data) => json.encode(data.toJson());

class PortfolioCharacteristic {
  int? id;
  int? portfolioId;
  double? volatility;
  double? sharpeRatio;
  double? maxDrawdown;
  DateTime? updateTime;

  PortfolioCharacteristic({
    this.id,
    this.portfolioId,
    this.volatility,
    this.sharpeRatio,
    this.maxDrawdown,
    this.updateTime,
  });

  factory PortfolioCharacteristic.fromJson(Map<String, dynamic> json) => PortfolioCharacteristic(
        id: json["id"],
        portfolioId: json["portfolioId"],
        volatility: json["volatility"]?.toDouble(),
        sharpeRatio: json["sharpeRatio"]?.toDouble(),
        maxDrawdown: json["maxDrawdown"]?.toDouble(),
        updateTime: json["updateTime"] == null ? null : DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "portfolioId": portfolioId,
        "volatility": volatility,
        "sharpeRatio": sharpeRatio,
        "maxDrawdown": maxDrawdown,
        "updateTime": updateTime?.toIso8601String(),
      };
}
