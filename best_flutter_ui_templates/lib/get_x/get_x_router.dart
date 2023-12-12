import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXRouter extends StatelessWidget {
  const GetXRouter({super.key});

  @override
  Widget build(BuildContext context) {
    /// 获取参数
    var argument = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("GetXRouter"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Text("其他页面传递过来的数据是 $argument"),
              SizedBox(
                height: 16,
              ),
              FloatingActionButton.extended(onPressed: () {
                Get.back(result: "Stephen");
              }, label: Text("返回数据"))
            ],
          ),
        ),
      ),
    );
  }
}
