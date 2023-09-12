import 'package:best_flutter_ui_templates/utils/log_util.dart';

class Student {
  String name;
  Student({this.name = ""});
}

void main() {

  var player = "curry";
  player = "calvin";

  // final 可以没有初始值
  final number;
  // 没赋值之前就是用会报错
  // logF("number is $number");
  number = 8;
  // 不能多次赋值
  // number = 9;
  logF("number is $number");


  // const 必须要有初始值
  const score = 98;
  // 不能多次赋值
  // score = 99;
  


}
