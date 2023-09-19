import 'package:best_flutter_ui_templates/utils/log_util.dart';

///
/// model 类
///
class CountModel {

  var _count = 0;
  get count => _count;

  increment() {
    _count++;
    logF("after change $_count");
  }
}
