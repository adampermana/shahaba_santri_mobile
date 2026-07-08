package com.solu.sahaba

import android.content.Intent
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
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
}
