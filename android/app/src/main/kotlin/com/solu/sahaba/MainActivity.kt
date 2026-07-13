package com.solu.sahaba

import android.content.Intent
import android.os.Bundle
import androidx.core.content.FileProvider
import com.solu.sahaba.adzan.AdzanAlarmScheduler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    private var navigationChannel: MethodChannel? = null
    private var pendingRoute: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        pendingRoute = intent?.getStringExtra(EXTRA_ROUTE)
        super.onCreate(savedInstanceState)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        val route = intent.getStringExtra(EXTRA_ROUTE)
        if (!route.isNullOrBlank()) {
            pendingRoute = route
            navigationChannel?.invokeMethod("openRoute", route)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "sahaba/adzan_alarm"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "scheduleAdzanAlarm" -> {
                    val request = AdzanAlarmScheduler.requestFrom(call.arguments)
                    if (request == null) {
                        result.error("invalid_args", "Adzan alarm arguments are invalid", null)
                        return@setMethodCallHandler
                    }

                    AdzanAlarmScheduler.schedule(this, request)
                    result.success(null)
                }
                "cancelAdzanPrayer" -> {
                    val prayerName = call.argument<String>("prayerName")
                    if (prayerName.isNullOrBlank()) {
                        result.error("invalid_prayer", "Prayer name is required", null)
                        return@setMethodCallHandler
                    }

                    AdzanAlarmScheduler.cancelPrayer(this, prayerName)
                    result.success(null)
                }
                "cancelAdzanAlarm" -> {
                    val alarmId = call.argument<Int>("alarmId")
                    if (alarmId == null) {
                        result.error("invalid_alarm", "Alarm id is required", null)
                        return@setMethodCallHandler
                    }

                    AdzanAlarmScheduler.cancelAlarm(this, alarmId)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }

        navigationChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "sahaba/navigation"
        ).also { channel ->
            channel.setMethodCallHandler { call, result ->
                when (call.method) {
                    "getInitialRoute" -> {
                        result.success(pendingRoute)
                        pendingRoute = null
                    }
                    else -> result.notImplemented()
                }
            }
        }

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "sahaba/share"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "shareImage" -> {
                    val bytes = call.argument<ByteArray>("bytes")
                    val fileName = call.argument<String>("fileName") ?: "quran.png"
                    val text = call.argument<String>("text")

                    if (bytes == null) {
                        result.error("invalid_bytes", "Image bytes are required", null)
                        return@setMethodCallHandler
                    }

                    shareImage(bytes, fileName, text)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun shareImage(bytes: ByteArray, fileName: String, text: String?) {
        val shareDir = File(cacheDir, "share")
        shareDir.mkdirs()

        val imageFile = File(shareDir, fileName)
        imageFile.writeBytes(bytes)

        val uri = FileProvider.getUriForFile(
            this,
            "$packageName.fileprovider",
            imageFile
        )

        val intent = Intent(Intent.ACTION_SEND).apply {
            type = "image/png"
            putExtra(Intent.EXTRA_STREAM, uri)
            text?.let { putExtra(Intent.EXTRA_TEXT, it) }
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }

        startActivity(Intent.createChooser(intent, null))
    }

    companion object {
        const val EXTRA_ROUTE = "sahaba.route"
    }
}
