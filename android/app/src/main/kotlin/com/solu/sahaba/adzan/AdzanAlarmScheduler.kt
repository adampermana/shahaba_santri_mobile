package com.eprisi.sah.adzan

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build

object AdzanAlarmScheduler {
    private const val PREF_NAME = "sahaba_adzan_alarms"
    private const val KEY_ALARM_PREFIX = "alarm_"
    private const val KEY_PRAYER_PREFIX = "prayer_"

    fun requestFrom(arguments: Any?): AdzanAlarmRequest? {
        val data = arguments as? Map<*, *> ?: return null
        val alarmId = (data["alarmId"] as? Number)?.toInt() ?: return null
        val triggerAtMillis = (data["triggerAtMillis"] as? Number)?.toLong() ?: return null
        val prayerName = data["prayerName"] as? String ?: return null
        val prayerLabel = data["prayerLabel"] as? String ?: prayerName
        val title = data["title"] as? String ?: return null
        val body = data["body"] as? String ?: return null

        return AdzanAlarmRequest(
            alarmId = alarmId,
            prayerName = prayerName,
            prayerLabel = prayerLabel,
            title = title,
            body = body,
            triggerAtMillis = triggerAtMillis,
            locationName = data["locationName"] as? String ?: "Anda",
            date = data["date"] as? String ?: "",
            qiblaPath = data["qiblaPath"] as? String ?: "/main/qibla"
        )
    }

    fun schedule(context: Context, request: AdzanAlarmRequest) {
        cancelPendingIntent(context, request.alarmId)
        persist(context, request)
        schedulePendingIntent(context, request)
    }

    fun cancelPrayer(context: Context, prayerName: String) {
        val prefs = prefs(context)
        val alarmId = prefs.getInt(KEY_PRAYER_PREFIX + prayerName.lowercase(), 0)
        if (alarmId == 0) return
        cancelAlarm(context, alarmId)
    }

    fun cancelAlarm(context: Context, alarmId: Int) {
        cancelPendingIntent(context, alarmId)
        removeStored(context, alarmId)
    }

    fun removeStored(context: Context, alarmId: Int) {
        val prefs = prefs(context)
        val request = prefs.getString(KEY_ALARM_PREFIX + alarmId, null)
            ?.let(AdzanAlarmRequest::fromJson)

        prefs.edit()
            .remove(KEY_ALARM_PREFIX + alarmId)
            .apply {
                request?.prayerName?.let { remove(KEY_PRAYER_PREFIX + it.lowercase()) }
            }
            .apply()
    }

    fun rescheduleStored(context: Context) {
        val now = System.currentTimeMillis()
        val editor = prefs(context).edit()
        prefs(context).all.forEach { (key, value) ->
            if (!key.startsWith(KEY_ALARM_PREFIX) || value !is String) return@forEach

            val request = AdzanAlarmRequest.fromJson(value)
            if (request == null || request.triggerAtMillis <= now) {
                editor.remove(key)
                request?.prayerName?.let { editor.remove(KEY_PRAYER_PREFIX + it.lowercase()) }
            } else {
                schedulePendingIntent(context, request)
            }
        }
        editor.apply()
    }

    private fun persist(context: Context, request: AdzanAlarmRequest) {
        prefs(context).edit()
            .putString(KEY_ALARM_PREFIX + request.alarmId, request.toJson())
            .putInt(KEY_PRAYER_PREFIX + request.prayerName.lowercase(), request.alarmId)
            .apply()
    }

    private fun schedulePendingIntent(context: Context, request: AdzanAlarmRequest) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val pendingIntent = pendingIntent(context, request.alarmId, request)

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                alarmManager.setExactAndAllowWhileIdle(
                    AlarmManager.RTC_WAKEUP,
                    request.triggerAtMillis,
                    pendingIntent
                )
            } else {
                alarmManager.setExact(
                    AlarmManager.RTC_WAKEUP,
                    request.triggerAtMillis,
                    pendingIntent
                )
            }
        } catch (_: SecurityException) {
            alarmManager.set(
                AlarmManager.RTC_WAKEUP,
                request.triggerAtMillis,
                pendingIntent
            )
        }
    }

    private fun cancelPendingIntent(context: Context, alarmId: Int) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        alarmManager.cancel(pendingIntent(context, alarmId, null))
    }

    private fun pendingIntent(
        context: Context,
        alarmId: Int,
        request: AdzanAlarmRequest?
    ): PendingIntent {
        val intent = Intent(context, AdzanAlarmReceiver::class.java).apply {
            action = AdzanAlarmReceiver.ACTION_TRIGGER
            request?.putInto(this)
        }
        return PendingIntent.getBroadcast(
            context,
            alarmId,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    private fun prefs(context: Context) =
        context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
}
