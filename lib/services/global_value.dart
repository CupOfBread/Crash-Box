import 'package:path_provider/path_provider.dart';

class GlobalValue {
  late final applicationDocumentsDirectory;

  String get serverUrl => "http://192.168.1.145:6060/";
  // String get serverUrl => "http://yukisama.ddns.net:56060/";

  GlobalValue() {
    _init();
  }

  Future<void> _init() async {
    applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
  }
}
