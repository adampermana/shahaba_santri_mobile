package com.eprisi.sah.adzan

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.media.AudioAttributes
import android.media.MediaPlayer
import android.os.Build
import android.os.IBinder
import android.os.PowerManager
import android.widget.RemoteViews
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.core.content.ContextCompat
import com.eprisi.sah.MainActivity
import com.eprisi.sah.R

class AdzanAlarmService : Service() {
    private var mediaPlayer: MediaPlayer? = null
    private var wakeLock: PowerManager.WakeLock? = null
    private var activeAlarmId: Int = 0

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_STOP -> {
                stopAlarm(intent.getIntExtra(AdzanAlarmRequest.EXTRA_ALARM_ID, activeAlarmId))
                return START_NOT_STICKY
            }
            ACTION_START -> {
                val request = AdzanAlarmRequest.fromIntent(intent) ?: return START_NOT_STICKY
                startAlarm(request)
                return START_NOT_STICKY
            }
        }

        return START_NOT_STICKY
    }

    override fun onDestroy() {
        releasePlayer()
        releaseWakeLock()
        super.onDestroy()
    }

    private fun startAlarm(request: AdzanAlarmRequest) {
        activeAlarmId = request.alarmId
        acquireWakeLock()
        ensureNotificationChannel()
        startForeground(request.alarmId, buildNotification(request))
        startAudio(request.alarmId)
    }

    private fun startAudio(alarmId: Int) {
        releasePlayer()
        resources.openRawResourceFd(R.raw.adzan_default)?.use { audio ->
            mediaPlayer = MediaPlayer().apply {
                setAudioAttributes(
                    AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_ALARM)
                        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                        .build()
                )
                setDataSource(audio.fileDescriptor, audio.startOffset, audio.length)
                prepare()
                isLooping = false
                setVolume(0.3f, 0.3f)
                setOnCompletionListener { stopAlarm(alarmId) }
                start()
            }
        }
    }

    private fun stopAlarm(alarmId: Int) {
        releasePlayer()
        releaseWakeLock()
        if (alarmId != 0) {
            AdzanAlarmScheduler.removeStored(this, alarmId)
            NotificationManagerCompat.from(this).cancel(alarmId)
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            @Suppress("DEPRECATION")
            stopForeground(true)
        }
        stopSelf()
    }

    private fun buildNotification(request: AdzanAlarmRequest): Notification {
        val compact = buildRemoteViews(R.layout.notification_adzan, request)
        val expanded = buildRemoteViews(R.layout.notification_adzan_expanded, request)
        val contentIntent = PendingIntent.getActivity(
            this,
            request.alarmId + REQUEST_CONTENT_OFFSET,
            Intent(this, MainActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or
                    Intent.FLAG_ACTIVITY_CLEAR_TOP or
                    Intent.FLAG_ACTIVITY_SINGLE_TOP
            },
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_adzan_notification_small)
            .setContentTitle(request.title)
            .setContentText(request.body)
            .setCustomContentView(compact)
            .setCustomBigContentView(expanded)
            .setContentIntent(contentIntent)
            .setDeleteIntent(stopPendingIntent(request.alarmId))
            .setPriority(NotificationCompat.PRIORITY_MAX)
            .setCategory(NotificationCompat.CATEGORY_ALARM)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setOnlyAlertOnce(true)
            .setOngoing(true)
            .setAutoCancel(false)
            .setSound(null)
            .build()
    }

    private fun buildRemoteViews(layoutId: Int, request: AdzanAlarmRequest): RemoteViews {
        return RemoteViews(packageName, layoutId).apply {
            setTextViewText(R.id.adzan_title, request.title)
            setTextViewText(R.id.adzan_body, request.body)
            setTextColor(
                R.id.adzan_title,
                notificationColor(R.color.adzan_notification_text_primary)
            )
            setTextColor(
                R.id.adzan_body,
                notificationColor(R.color.adzan_notification_text_secondary)
            )
            setImageViewResource(R.id.adzan_icon_image, R.drawable.ic_adzan_notification_small)
            setImageViewResource(R.id.adzan_prayer_image, imageResFor(request.prayerName))
            if (layoutId == R.layout.notification_adzan_expanded) {
                setTextColor(
                    R.id.adzan_stop,
                    notificationColor(R.color.adzan_notification_action_stop)
                )
                setTextColor(
                    R.id.adzan_qibla,
                    notificationColor(R.color.adzan_notification_action_qibla)
                )
                setOnClickPendingIntent(R.id.adzan_stop, stopPendingIntent(request.alarmId))
                setOnClickPendingIntent(R.id.adzan_qibla, qiblaPendingIntent(request))
            }
        }
    }

    private fun notificationColor(colorRes: Int): Int {
        return ContextCompat.getColor(this, colorRes)
    }

    private fun stopPendingIntent(alarmId: Int): PendingIntent {
        val intent = Intent(this, AdzanAlarmActionReceiver::class.java).apply {
            action = AdzanAlarmActionReceiver.ACTION_STOP
            putExtra(AdzanAlarmRequest.EXTRA_ALARM_ID, alarmId)
        }
        return PendingIntent.getBroadcast(
            this,
            alarmId + REQUEST_STOP_OFFSET,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    private fun qiblaPendingIntent(request: AdzanAlarmRequest): PendingIntent {
        val intent = Intent(this, AdzanAlarmActionReceiver::class.java).apply {
            action = AdzanAlarmActionReceiver.ACTION_QIBLA
            putExtra(AdzanAlarmRequest.EXTRA_ALARM_ID, request.alarmId)
            putExtra(AdzanAlarmRequest.EXTRA_QIBLA_PATH, request.qiblaPath)
        }
        return PendingIntent.getBroadcast(
            this,
            request.alarmId + REQUEST_QIBLA_OFFSET,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    private fun imageResFor(prayerName: String): Int {
        return when (prayerName.lowercase()) {
            "dzuhur", "ashar" -> R.drawable.notif_duzhur_ashar
            "terbit" -> R.drawable.notif_terbit
            "maghrib" -> R.drawable.notif_maghrib
            "isya" -> R.drawable.notif_isya
            else -> R.drawable.notif_icon
        }
    }

    private fun ensureNotificationChannel() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        if (manager.getNotificationChannel(CHANNEL_ID) != null) return

        val channel = NotificationChannel(
            CHANNEL_ID,
            "Adzan Alarm",
            NotificationManager.IMPORTANCE_HIGH
        ).apply {
            description = "Notifikasi alarm adzan"
            setSound(null, null)
            lockscreenVisibility = Notification.VISIBILITY_PUBLIC
        }
        manager.createNotificationChannel(channel)
    }

    private fun acquireWakeLock() {
        releaseWakeLock()
        val powerManager = getSystemService(Context.POWER_SERVICE) as PowerManager
        wakeLock = powerManager.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "Sahaba:AdzanAlarm"
        ).apply {
            acquire(WAKE_LOCK_TIMEOUT_MS)
        }
    }

    private fun releaseWakeLock() {
        wakeLock?.takeIf { it.isHeld }?.release()
        wakeLock = null
    }

    private fun releasePlayer() {
        mediaPlayer?.let { player ->
            try {
                if (player.isPlaying) player.stop()
            } catch (_: IllegalStateException) {
            } finally {
                player.release()
            }
        }
        mediaPlayer = null
    }

    companion object {
        const val ACTION_START = "com.eprisi.sah.adzan.START"
        const val ACTION_STOP = "com.eprisi.sah.adzan.STOP_SERVICE"
        const val CHANNEL_ID = "adzan_alarm_channel"
        private const val REQUEST_CONTENT_OFFSET = 10_000
        private const val REQUEST_STOP_OFFSET = 20_000
        private const val REQUEST_QIBLA_OFFSET = 30_000
        private const val WAKE_LOCK_TIMEOUT_MS = 5 * 60 * 1000L
    }
}
