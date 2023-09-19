import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LearnChannelOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LearnChannelOneState();
  }
}

class LearnChannelOneState extends State<LearnChannelOne> {
  String displayResult = "";

  static const CHANNEL_FLUTTER_TO_ANDROID = "com.example.best_flutter_ui_templates.flutterplugin/PluginFlutterToAndroid";

  // 获取flutter到Android的channel
  static const flutterToAndroidChannel = const MethodChannel(CHANNEL_FLUTTER_TO_ANDROID);

  /// 仅调用原生方法
  Future<Null> _invokeNativeToast() async {
    await flutterToAndroidChannel.invokeMethod("toast");
  }

  /// 仅调用原生方法，并拿到结果
  Future<Null> _requestAndGetResult() async {
    var data = {"account": "BOSS", "password": "yes"};
    var result = await flutterToAndroidChannel.invokeMethod("login", data);
    setState(() {
      displayResult =  result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LearnChannel One"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18, left: 4),
        child: Center(
          child: Column(
            children: [
              Text("$displayResult", style: TextStyle(fontSize: 16),),
              SizedBox(
                height: 16,
              ),
              FloatingActionButton.extended(
                  // 这里要注意，箭头函数后必须要带上括号，以下是错误写法
                  // onPressed: () => _invokeNativeToast,
                  onPressed: () => _invokeNativeToast(),
                  label: Text("调用Android toast()方法")),
              SizedBox(
                height: 16,
              ),
              FloatingActionButton.extended(onPressed: () => _requestAndGetResult(), label: Text("传递参数给Android，并返回结果")),
              SizedBox(
                height: 16,
              ),
              FloatingActionButton.extended(onPressed: () {}, label: Text("传递参数给Android")),
              SizedBox(
                height: 16,
              ),
              FloatingActionButton.extended(onPressed: () {}, label: Text("传递参数给Android")),
            ],
          ),
        ),
      ),
    );
  }
}
