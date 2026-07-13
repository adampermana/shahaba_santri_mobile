package com.solu.sahaba.adzan

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class AdzanBootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == Intent.ACTION_BOOT_COMPLETED) {
            AdzanAlarmScheduler.rescheduleStored(context)
        }
    }
}
