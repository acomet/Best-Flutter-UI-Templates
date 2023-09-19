import 'package:best_flutter_ui_templates/utils/log_util.dart';
import 'package:flutter/foundation.dart';

class ViewModel2 with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  increment() {
    _count++;
    logF("after change $_count");

    /// 该属性发送改变后，通知所有监听者
    notifyListeners();
  }
}
