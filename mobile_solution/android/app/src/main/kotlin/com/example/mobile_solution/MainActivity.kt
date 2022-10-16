package com.example.mobile_solution

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine;
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("401af9b9-226b-4887-8bb4-14752604e89a");
        super.configureFlutterEngine(flutterEngine);
    }
}
