package com.solu.sahaba.adzan

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import androidx.core.content.ContextCompat

class AdzanAlarmReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val request = AdzanAlarmRequest.fromIntent(intent) ?: return
        val serviceIntent = Intent(context, AdzanAlarmService::class.java).apply {
            action = AdzanAlarmService.ACTION_START
            request.putInto(this)
        }
        ContextCompat.startForegroundService(context, serviceIntent)
    }

    companion object {
        const val ACTION_TRIGGER = "com.solu.sahaba.adzan.TRIGGER"
    }
}
