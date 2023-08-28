import 'dart:io';

import 'package:best_flutter_ui_templates/app_theme.dart';
// 注意：
// 这里的意思是导入 foundation.dart 里面所有以及导出的文件，里面有constants.dart，constants.dart里有kIsWeb()方法
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'navigation_home_screen.dart';
import 'utils/log_util.dart';

void main() async {

  // SystemChrome 控制操作系统图形界面的特定方面以及它如何与应用程序交互。需要注意的是在使用的时候一定要保证先执行 WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  // 禁止横屏
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // 状态栏背景颜色
      statusBarColor: Colors.transparent,
      // 状态栏图标颜色
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      // 导航栏三个按钮的背景颜色
      systemNavigationBarColor: Colors.white,
      // 导航栏和主内容区中间的分割线颜色
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      // app基本的主题
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        // 页面切换动画受到这个参数的影响
        platform: TargetPlatform.iOS,
      ),
      home: NavigationHomeScreen(),
    );
  }
}

////////////////////// test //////////////////////
void dance() {
  logF("invoke dance()");
}

class Sport {
  void play(params) {
    logF("play(),params is $params");
  }
}