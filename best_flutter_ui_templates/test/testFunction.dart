import 'package:best_flutter_ui_templates/utils/log_util.dart';

void main() {
  sleep();
  // enableFlags();
  // swimming();
}

 sleep() {
  logF("sleep");
}

String doHomeWork(String job) {
  logF("before this is homework $job");
  return "home work is over";
}

void enableFlags({bool isBold = false, String name = ""}) {
  logF("isBold = $isBold and name=$name");
}

void swimming([String tools = "A", bool isNew = false]) {
  logF("tools = $tools and isNew=$isNew");
}
