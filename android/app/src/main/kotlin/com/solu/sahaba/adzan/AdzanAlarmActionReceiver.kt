package com.solu.sahaba.adzan

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.solu.sahaba.MainActivity

class AdzanAlarmActionReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        when (intent.action) {
            ACTION_STOP -> {
                val serviceIntent = Intent(context, AdzanAlarmService::class.java).apply {
                    action = AdzanAlarmService.ACTION_STOP
                    putExtra(
                        AdzanAlarmRequest.EXTRA_ALARM_ID,
                        intent.getIntExtra(AdzanAlarmRequest.EXTRA_ALARM_ID, 0)
                    )
                }
                context.startService(serviceIntent)
            }
            ACTION_QIBLA -> {
                val qiblaPath = intent.getStringExtra(AdzanAlarmRequest.EXTRA_QIBLA_PATH)
                    ?: "/main/qibla"
                val launchIntent = Intent(context, MainActivity::class.java).apply {
                    flags = Intent.FLAG_ACTIVITY_NEW_TASK or
                        Intent.FLAG_ACTIVITY_CLEAR_TOP or
                        Intent.FLAG_ACTIVITY_SINGLE_TOP
                    putExtra(MainActivity.EXTRA_ROUTE, qiblaPath)
                }
                context.startActivity(launchIntent)
            }
        }
    }

    companion object {
        const val ACTION_STOP = "com.solu.sahaba.adzan.STOP"
        const val ACTION_QIBLA = "com.solu.sahaba.adzan.QIBLA"
    }
}
