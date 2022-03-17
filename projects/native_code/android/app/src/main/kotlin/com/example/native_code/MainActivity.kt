package com.example.native_code

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "amanda.com.br/native"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->

            if(call.method == "calcSum") {
                val number1 = call.argument<Int>("number1")?.toInt() ?: 0
                val number2 = call.argument<Int>("number1")?.toInt() ?: 0

                result.success(number1 + number2)
            } else {
                result.notImplemented()
            }
        }
    }
}
