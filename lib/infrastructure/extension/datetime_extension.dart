import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

extension IndoDateTimeX on DateTime {
  static const _hari = <String>[
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];
  static const bulan = <String>[
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  /// Konversi ke UTC+offset (jam)
  DateTime _toUtcOffset(int offsetHours) =>
      toUtc().add(Duration(hours: offsetHours));

  /// Label zona berdasarkan offset jam UTC
  String _indoZoneLabel(int offsetHours) {
    switch (offsetHours) {
      case 7:
        return 'WIB';
      case 8:
        return 'WITA';
      case 9:
        return 'WIT';
      default:
        // fallback: pakai timeZoneName asli device
        return timeZoneName;
    }
  }

  // ----------------------------
  // Zona spesifik (WIB/WITA/WIT)
  // ----------------------------

  /// Pastikan waktu pada zona WIB (UTC+7).
  DateTime get asWIB {
    if (timeZoneOffset.inHours == 7) return this;
    return _toUtcOffset(7);
  }

  /// Pastikan waktu pada zona WITA (UTC+8).
  DateTime get asWITA {
    if (timeZoneOffset.inHours == 8) return this;
    return _toUtcOffset(8);
  }

  DateTime get asWIT {
    if (timeZoneOffset.inHours == 9) return this;
    return _toUtcOffset(9);
  }

  // ----------------------------
  // Versi GENERIC
  // ----------------------------

  /// "Selasa, 25 Juli 2025" berdasarkan offset UTC tertentu (default: WIB / 7).
  String longDateId({int utcOffset = 7}) {
    final t = _toUtcOffset(utcOffset);
    return '${_hari[t.weekday - 1]}, ${t.day} ${bulan[t.month - 1]} ${t.year}';
  }

  /// "Pukul 08:30 WIB/WITA/WIT" berdasarkan offset UTC tertentu (default: WIB / 7).
  String pukulZona({
    int utcOffset = 7,
    bool withSeconds = false,
  }) {
    final t = _toUtcOffset(utcOffset);
    final hh = t.hour.toString().padLeft(2, '0');
    final mm = t.minute.toString().padLeft(2, '0');
    final ss = t.second.toString().padLeft(2, '0');
    final clock = withSeconds ? '$hh:$mm:$ss' : '$hh:$mm';

    final label = _indoZoneLabel(utcOffset);
    return 'Pukul $clock $label';
  }

  /// Salam sesuai waktu zona tertentu (default: WIB / 7).
  String salamWaktuZona({
    int utcOffset = 7,
    bool preferPetang = true,
  }) {
    final h = _toUtcOffset(utcOffset).hour;

    if (h < 5) return 'Selamat dini hari';
    if (h < 11) return 'Selamat pagi';
    if (h < 15) return 'Selamat siang';

    if (preferPetang) {
      if (h < 17) return 'Selamat sore'; // 15–16
      if (h < 19) return 'Selamat petang'; // 17–18
      return 'Selamat malam'; // 19–23
    } else {
      if (h < 19) return 'Selamat sore'; // 15–18
      return 'Selamat malam'; // 19–23
    }
  }

  // ----------------------------
  //  LOCAL timezone (device)
  // ----------------------------

  String longDateIdLocal() {
    final t = this; // already local
    return '${_hari[t.weekday - 1]}, ${t.day} ${bulan[t.month - 1]} ${t.year}';
  }

  /// "Pukul 08:30 WIB/WITA/WIT" pakai timezone lokal user.
  String pukulLocal({bool withSeconds = false}) {
    final t = this; // already local
    final hh = t.hour.toString().padLeft(2, '0');
    final mm = t.minute.toString().padLeft(2, '0');
    final ss = t.second.toString().padLeft(2, '0');
    final clock = withSeconds ? '$hh:$mm:$ss' : '$hh:$mm';

    final label = _indoZoneLabel(timeZoneOffset.inHours);
    return 'Pukul $clock $label';
  }

  /// Salam sesuai timezone lokal user.
  String salamWaktuLocal({bool preferPetang = true}) {
    final h = hour; // local

    if (h < 5) return 'Selamat dini hari 🌌';
    if (h < 11) return 'Selamat pagi ☀️';
    if (h < 15) return 'Selamat siang 🌤️';

    if (preferPetang) {
      if (h < 17) return 'Selamat sore 🌇'; // 15–16
      if (h < 19) return 'Selamat petang 🌆'; // 17–18
      return 'Selamat malam 🌙'; // 19–23
    } else {
      if (h < 19) return 'Selamat sore 🌇'; // 15–18
      return 'Selamat malam 🌙'; // 19–23
    }
  }

  String pukulWIB({bool withSeconds = false}) {
    return pukulZona(withSeconds: withSeconds);
  }

  /// Versi lama: salam berdasarkan WIB.
  String salamWaktu({bool preferPetang = true}) {
    return salamWaktuZona(preferPetang: preferPetang);
  }

  String formatDates(String date) {
    try {
      // Parse format: "2025-10-28 07:54:03"
      final dt = DateTime.parse(date);
      final now = DateTime.now();
      final diff = now.difference(dt);

      if (diff.inDays == 0) {
        return 'Hari ini';
      } else if (diff.inDays == 1) {
        return '1 Hari lalu';
      } else if (diff.inDays < 7) {
        return '${diff.inDays} Hari lalu';
      } else {
        // Format: "17 Des 2025"
        return DateFormat('dd MMM yyyy', 'id_ID').format(dt);
      }
    } on Exception catch (e) {
      debugPrint('Error formatting date: "$date", error: $e');
      return date;
    }
  }
}

DateTime dateFromApi(String v) {
  try {
    if (v.contains(' ')) {
      final isoString = v.replaceFirst(' ', 'T');
      return DateTime.parse(isoString);
    }
    return DateTime.parse(v);
  } on Exception catch (e) {
    debugPrint('Error parsing date: "$v", error: $e');
    return DateTime.now();
  }
}

String dateToApi(DateTime d) => DateFormat('yyyy-MM-dd HH:mm:ss').format(d);
