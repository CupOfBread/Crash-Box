import 'dart:convert';

StockBatch stockBatchFromJson(String str) => StockBatch.fromJson(json.decode(str));

String stockBatchToJson(StockBatch data) => json.encode(data.toJson());

class StockBatch {
  Market? market;
  Quote? quote;

  StockBatch({
    this.market,
    this.quote,
  });

  factory StockBatch.fromJson(Map<String, dynamic> json) => StockBatch(
    market: json["market"] == null ? null : Market.fromJson(json["market"]),
    quote: json["quote"] == null ? null : Quote.fromJson(json["quote"]),
  );

  Map<String, dynamic> toJson() => {
    "market": market?.toJson(),
    "quote": quote?.toJson(),
  };
}

class Market {
  dynamic statusId;
  String? region;
  String? status;
  String? timeZone;
  dynamic timeZoneDesc;
  int? delayTag;

  Market({
    this.statusId,
    this.region,
    this.status,
    this.timeZone,
    this.timeZoneDesc,
    this.delayTag,
  });

  factory Market.fromJson(Map<String, dynamic> json) => Market(
    statusId: json["status_id"],
    region: json["region"],
    status: json["status"],
    timeZone: json["time_zone"],
    timeZoneDesc: json["time_zone_desc"],
    delayTag: json["delay_tag"],
  );

  Map<String, dynamic> toJson() => {
    "status_id": statusId,
    "region": region,
    "status": status,
    "time_zone": timeZone,
    "time_zone_desc": timeZoneDesc,
    "delay_tag": delayTag,
  };
}

class Quote {
  String? symbol;
  String? code;
  String? exchange;
  String? name;
  int? type;
  String? subType;
  int? status;
  double? current;
  String? currency;
  double? percent;
  double? chg;
  int? timestamp;
  int? time;
  int? lotSize;
  double? tickSize;
  double? open;
  double? lastClose;
  double? high;
  double? low;
  double? avgPrice;
  int? volume;
  int? amount;
  double? turnoverRate;
  double? amplitude;
  dynamic marketCapital;
  dynamic floatMarketCapital;
  dynamic totalShares;
  int? floatShares;
  int? issueDate;
  int? lockSet;
  double? currentYearPercent;

  Quote({
    this.symbol,
    this.code,
    this.exchange,
    this.name,
    this.type,
    this.subType,
    this.status,
    this.current,
    this.currency,
    this.percent,
    this.chg,
    this.timestamp,
    this.time,
    this.lotSize,
    this.tickSize,
    this.open,
    this.lastClose,
    this.high,
    this.low,
    this.avgPrice,
    this.volume,
    this.amount,
    this.turnoverRate,
    this.amplitude,
    this.marketCapital,
    this.floatMarketCapital,
    this.totalShares,
    this.floatShares,
    this.issueDate,
    this.lockSet,
    this.currentYearPercent,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    symbol: json["symbol"],
    code: json["code"],
    exchange: json["exchange"],
    name: json["name"],
    type: json["type"],
    subType: json["sub_type"],
    status: json["status"],
    current: json["current"]?.toDouble(),
    currency: json["currency"],
    percent: json["percent"]?.toDouble(),
    chg: json["chg"]?.toDouble(),
    timestamp: json["timestamp"],
    time: json["time"],
    lotSize: json["lot_size"],
    tickSize: json["tick_size"]?.toDouble(),
    open: json["open"]?.toDouble(),
    lastClose: json["last_close"]?.toDouble(),
    high: json["high"]?.toDouble(),
    low: json["low"]?.toDouble(),
    avgPrice: json["avg_price"]?.toDouble(),
    volume: json["volume"],
    amount: json["amount"],
    turnoverRate: json["turnover_rate"]?.toDouble(),
    amplitude: json["amplitude"]?.toDouble(),
    marketCapital: json["market_capital"],
    floatMarketCapital: json["float_market_capital"],
    totalShares: json["total_shares"],
    floatShares: json["float_shares"],
    issueDate: json["issue_date"],
    lockSet: json["lock_set"],
    currentYearPercent: json["current_year_percent"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "code": code,
    "exchange": exchange,
    "name": name,
    "type": type,
    "sub_type": subType,
    "status": status,
    "current": current,
    "currency": currency,
    "percent": percent,
    "chg": chg,
    "timestamp": timestamp,
    "time": time,
    "lot_size": lotSize,
    "tick_size": tickSize,
    "open": open,
    "last_close": lastClose,
    "high": high,
    "low": low,
    "avg_price": avgPrice,
    "volume": volume,
    "amount": amount,
    "turnover_rate": turnoverRate,
    "amplitude": amplitude,
    "market_capital": marketCapital,
    "float_market_capital": floatMarketCapital,
    "total_shares": totalShares,
    "float_shares": floatShares,
    "issue_date": issueDate,
    "lock_set": lockSet,
    "current_year_percent": currentYearPercent,
  };
}
