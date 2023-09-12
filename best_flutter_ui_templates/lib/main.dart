import 'dart:io';

import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/home_screen.dart';
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
      
      // 路由表
      // routes: {
      //   MyHomePage.routeName: (context) => MyHomePage(),
      //   MyHomePage.routeName: (context) => MyHomePage(),
      //   MyHomePage.routeName: (context) => MyHomePage(),
      // },


      // onGenerateRoute 假如我们想在用户没有登录的时候自动跳转到登录页面，在登录的时候可以正常浏览其他页面。这样每一次打开页面的时候都去判断登录状态非常麻烦，
      // 我们可以利用MaterialApp的onGenerateRoute属性。

      // onGenerateRoute只会对命名路由生效
      // onGenerateRoute属性，它在打开命名路由时可能会被调用
      // 如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件
      // 如果路由表中没有注册，才会调用onGenerateRoute来生成路由

      // 删除路由表 routes
      // 删除 home
      // 使用 initialRoute

      // onGenerateRoute: _onGenerateRoute,

    );
  }

  // Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  //   String routeName;
  //   routeName = routeBeforeHook(settings);
  //   return MaterialPageRoute(builder: (context) {
  //     /// 注意：如果路由的形式为: '/a/b/c'
  //     /// 那么将依次检索 '/' -> '/a' -> '/a/b' -> '/a/b/c'
  //     /// 所以，我这里的路由命名避免使用 '/xxx' 形式
  //     switch (routeName) {
  //       case "index":
  //         return MyHomePage();
  //       case "login":
  //         return LoginScreen();
  //       default:
  //         return Scaffold(
  //           body: Center(
  //             child: Text("页面不存在"),
  //           ),
  //         );
  //     }
  //   });
  // }

  // String routeBeforeHook(RouteSettings settings) {
  //   /// Global.prefs 是全局的 SharedPreferences 实例
  //   /// SharedPreferences 是常用的本地存储的插件
  //   final token = Global.prefs.getString('token') ?? '';
  //   if (token != '') {
  //     if (settings.name == 'login') {
  //       return 'index';
  //     }
  //     return settings.name;
  //   }
  //   return 'login';
  // }
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