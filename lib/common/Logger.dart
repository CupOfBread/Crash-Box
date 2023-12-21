import 'package:logger/logger.dart';

var _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

LogD(Object msg) {
  _logger.d("${DateTime.now().toString()}\n$msg");
}

LogI(Object msg) {
  _logger.i("${DateTime.now().toString()}\n$msg");
}

LogW(Object msg) {
  _logger.w("${DateTime.now().toString()}\n$msg");
}

LogE(Object msg) {
  _logger.e("${DateTime.now().toString()}\n$msg");
}
