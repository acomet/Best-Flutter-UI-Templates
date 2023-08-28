import 'package:logger/logger.dart';

const String _TAG = "BOSS--->";

var _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

logT(String msg) {
  _logger.t("$_TAG :: $msg");
}

logD(String msg) {
  _logger.d("$_TAG :: $msg");
}

logI(String msg) {
  _logger.i("$_TAG :: $msg");
}

logW(String msg) {
  _logger.w("$_TAG :: $msg");
}

logE(String msg) {
  _logger.e("$_TAG :: $msg");
}

logF(String msg) {
  _logger.f("$_TAG :: $msg");
}
