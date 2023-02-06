package com.example.flutter_demo2

import android.app.Activity
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry

class FlutterIntentPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
    private val _tag = FlutterIntentPlugin::class.java.canonicalName
    private var channel: MethodChannel? = null
    private var result: String? = null
    private var binding: ActivityPluginBinding? = null
    private lateinit var context: Context
    private var activity: Activity? = null

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "sales") {
            val compName = ComponentName(
                "com.lululalait.kiosk",
                "com.lululalait.kiosk.KioskActivity"
            )
            val intent = Intent(Intent.ACTION_MAIN).apply {
                addCategory(Intent.CATEGORY_LAUNCHER)
                component = compName
                putExtra("Request", call.arguments as String)
                addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION)
            }
            activity!!.startActivityForResult(intent, 0)
        }
    }

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "payment")
        channel?.setMethodCallHandler(this)

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.let {
            it.setMethodCallHandler(null)
            channel = null
        }

    }

    override fun onDetachedFromActivity() {
        activity = null
        binding?.removeActivityResultListener(this)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        this.binding = binding
        binding.addActivityResultListener(this)
    }


    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        data?.getStringExtra("Response")?.let {
            result = it
        }
        channel?.let {
            it.invokeMethod("response", result)
        }
        return true
    }
}
