package com.example.best_flutter_ui_templates.flutterplugin

import android.text.TextUtils
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class PluginFlutterToAndroid(private val activity: FlutterActivity) : MethodChannel.MethodCallHandler {

    companion object {

        // 通常为“包名/标识”
        private const val CHANNEL_FLUTTER_TO_ANDROID = "com.example.best_flutter_ui_templates.flutterplugin/PluginFlutterToAndroid"

        // 暂时不知道这个句柄有什么用
        private lateinit var channelFlutterToAndroid: MethodChannel

        fun registerWith(flutterEngine: FlutterEngine, activity: FlutterActivity) {
            channelFlutterToAndroid = MethodChannel(flutterEngine.dartExecutor, CHANNEL_FLUTTER_TO_ANDROID)
            val instance = PluginFlutterToAndroid(activity) // setMethodCallHandler在此通道上接收方法调用的回调
            channelFlutterToAndroid.setMethodCallHandler(instance)
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "toast" -> {
                Toast.makeText(activity, "Hello Native", Toast.LENGTH_SHORT).show()
            }
            "login" -> {
                // Flutter 传递过来的数据
                // 解析参数
                val account: String? = call.argument("account")
                val password: String? = call.argument("password")
                if (TextUtils.isEmpty(account) || TextUtils.isEmpty(password)) {
                    result.error("500", "username or password incorrect", "错了就是错了")
                    return
                }

                if (account == "BOSS" && password == "yes") {
                    result.success("{'code':'200','data':'Genius! You make it'}")
                }
            }
        }
    }
}