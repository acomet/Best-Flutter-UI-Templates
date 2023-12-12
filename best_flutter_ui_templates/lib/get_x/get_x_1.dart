import 'package:best_flutter_ui_templates/get_x/player.dart';
import 'package:best_flutter_ui_templates/utils/log_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_x_router.dart';

class GetXWidget extends StatelessWidget {

  learnRouter() async {
    var result = await Get.to(GetXRouter(), transition: Transition.upToDown, curve: Curves.easeIn, arguments: "30");
    logF("返回数据是 $result");
  }

  final name = "Curry".obs;
  final player = Player();
  final computer = Computer("SONY", "BLACK").obs;

  changeName() {
    name.value = "Stephen Curry";
    player.name.value = "Stephen Curry";
    player.number.value = 30;

    computer.update((val) {
      computer.value.brand = "Apple";
      computer.value.color = "White";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Widget"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton.extended(onPressed: () => {Get.snackbar("HELLO", "GOOD MORNING")}, label: Text("Snack bar")),
              SizedBox(height: 10),
              FloatingActionButton.extended(
                  onPressed: () => {
                        Get.defaultDialog(
                            title: "温馨提示",
                            // confirm: Container(
                            //   width: 80,
                            //   height: 30,
                            //   child: Center(
                            //     child: Text("OK"),
                            //   ),
                            //   decoration: BoxDecoration(color: Colors.cyanAccent, borderRadius: BorderRadius.all(Radius.circular(10))),
                            // ),
                            ///
                            textConfirm: "好",
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              logF("Confirm");
                            },

                            ///
                            cancel: FloatingActionButton.extended(onPressed: () => {logF("CANCEL 0")}, label: Text("Cancel")),
                            // onCancel: () => {logF("CANCEL 1")},
                            // middleText: "使用onConfirm()， onCancel()，那就自己处理点击事件；",

                            content: Text("使用onConfirm()， onCancel()，那就自己处理点击事件；")),
                      },
                  label: Text("Dialog")),
              SizedBox(height: 10),
              FloatingActionButton.extended(onPressed: () => {learnRouter()}, label: Text("路由跳转")),
              SizedBox(height: 10),
              Obx(
                () => Text("$name"),
              ),
              Obx(() => Text("player's name is ${player.name} ,number is ${player.number}")),
              Obx(() => Text("computer's brand is ${computer.value.brand} ,color is ${computer.value.color}")),
              SizedBox(height: 10),
              FloatingActionButton.extended(
                  onPressed: () {
                    changeName();
                  },
                  label: Text("Change"))
            ],
          ),
        ),
      ),
    );
  }
}
