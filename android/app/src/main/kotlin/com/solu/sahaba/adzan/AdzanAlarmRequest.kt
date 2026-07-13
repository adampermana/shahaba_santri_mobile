package com.solu.sahaba.adzan

import android.content.Intent
import org.json.JSONObject

data class AdzanAlarmRequest(
    val alarmId: Int,
    val prayerName: String,
    val prayerLabel: String,
    val title: String,
    val body: String,
    val triggerAtMillis: Long,
    val locationName: String,
    val date: String,
    val qiblaPath: String
) {
    fun putInto(intent: Intent) {
        intent.putExtra(EXTRA_ALARM_ID, alarmId)
        intent.putExtra(EXTRA_PRAYER_NAME, prayerName)
        intent.putExtra(EXTRA_PRAYER_LABEL, prayerLabel)
        intent.putExtra(EXTRA_TITLE, title)
        intent.putExtra(EXTRA_BODY, body)
        intent.putExtra(EXTRA_TRIGGER_AT, triggerAtMillis)
        intent.putExtra(EXTRA_LOCATION_NAME, locationName)
        intent.putExtra(EXTRA_DATE, date)
        intent.putExtra(EXTRA_QIBLA_PATH, qiblaPath)
    }

    fun toJson(): String = JSONObject()
        .put(EXTRA_ALARM_ID, alarmId)
        .put(EXTRA_PRAYER_NAME, prayerName)
        .put(EXTRA_PRAYER_LABEL, prayerLabel)
        .put(EXTRA_TITLE, title)
        .put(EXTRA_BODY, body)
        .put(EXTRA_TRIGGER_AT, triggerAtMillis)
        .put(EXTRA_LOCATION_NAME, locationName)
        .put(EXTRA_DATE, date)
        .put(EXTRA_QIBLA_PATH, qiblaPath)
        .toString()

    companion object {
        const val EXTRA_ALARM_ID = "alarmId"
        const val EXTRA_PRAYER_NAME = "prayerName"
        const val EXTRA_PRAYER_LABEL = "prayerLabel"
        const val EXTRA_TITLE = "title"
        const val EXTRA_BODY = "body"
        const val EXTRA_TRIGGER_AT = "triggerAtMillis"
        const val EXTRA_LOCATION_NAME = "locationName"
        const val EXTRA_DATE = "date"
        const val EXTRA_QIBLA_PATH = "qiblaPath"

        fun fromIntent(intent: Intent): AdzanAlarmRequest? {
            val alarmId = intent.getIntExtra(EXTRA_ALARM_ID, 0)
            if (alarmId == 0) return null

            return AdzanAlarmRequest(
                alarmId = alarmId,
                prayerName = intent.getStringExtra(EXTRA_PRAYER_NAME).orEmpty(),
                prayerLabel = intent.getStringExtra(EXTRA_PRAYER_LABEL).orEmpty(),
                title = intent.getStringExtra(EXTRA_TITLE).orEmpty(),
                body = intent.getStringExtra(EXTRA_BODY).orEmpty(),
                triggerAtMillis = intent.getLongExtra(EXTRA_TRIGGER_AT, 0L),
                locationName = intent.getStringExtra(EXTRA_LOCATION_NAME).orEmpty(),
                date = intent.getStringExtra(EXTRA_DATE).orEmpty(),
                qiblaPath = intent.getStringExtra(EXTRA_QIBLA_PATH) ?: "/main/qibla"
            )
        }

        fun fromJson(value: String): AdzanAlarmRequest? = runCatching {
            val json = JSONObject(value)
            AdzanAlarmRequest(
                alarmId = json.getInt(EXTRA_ALARM_ID),
                prayerName = json.optString(EXTRA_PRAYER_NAME),
                prayerLabel = json.optString(EXTRA_PRAYER_LABEL),
                title = json.optString(EXTRA_TITLE),
                body = json.optString(EXTRA_BODY),
                triggerAtMillis = json.optLong(EXTRA_TRIGGER_AT),
                locationName = json.optString(EXTRA_LOCATION_NAME, "Anda"),
                date = json.optString(EXTRA_DATE),
                qiblaPath = json.optString(EXTRA_QIBLA_PATH, "/main/qibla")
            )
        }.getOrNull()
    }
}
