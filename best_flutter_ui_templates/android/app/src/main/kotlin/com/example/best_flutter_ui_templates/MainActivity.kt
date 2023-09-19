package com.example.best_flutter_ui_templates

import com.example.best_flutter_ui_templates.flutterplugin.PluginFlutterToAndroid
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        // 注册
        // 从Flutter到Android
        PluginFlutterToAndroid.registerWith(flutterEngine, this)

        // Android到Flutter
    }
}
