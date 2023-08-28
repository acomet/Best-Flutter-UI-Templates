import 'package:best_flutter_ui_templates/utils/log_util.dart';

class Student {
  String name;
  int age;
  String address;
  int score;
  Student(this.name, this.age, {this.address = "", this.score = 60});

  void tellYourName() {
    logI(this.name);
  }

  void allYourInformation() {
    logF(this.toString());
  }

  @override
  String toString() {
    return "name is $name ,age is $age ,address is $address ,score is $score";
  }
}

void main() {
  var student = Student("curry", 8, score: 99, address: "shen zhen");
  student.allYourInformation();
}
