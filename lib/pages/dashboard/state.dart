import '../../models/StockBatch.dart';

class DashboardState {
  List<String> cnStockIndexCode = ["SH000001", "SZ399001", "SZ399006", "SH000300", "SH000905"];
  List<String> hkStockIndexCode = ["HKHSI", "HKHSCEI"];
  List<String> usStockIndexCode = [".DJI", ".IXIC", ".INX"];

  List<StockBatch> CN_StockIndex = [];
  List<StockBatch> HK_StockIndex = [];
  List<StockBatch> US_StockIndex = [];

  bool isLoading = true;

  DashboardState() {}
}
