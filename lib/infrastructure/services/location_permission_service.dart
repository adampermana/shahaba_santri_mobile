import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

class LocationPermissionService {
  Future<Map<String, String>> getAddressFromCoordinates(
    Map<String, double> position,
  ) async {
    final placemarks = await placemarkFromCoordinates(
      position['latitude']!,
      position['longitude']!,
    );

    if (placemarks.isNotEmpty) {
      final placemark = placemarks.first;
      return {
        'province': placemark.administrativeArea ?? 'Unknown Province',
        'district': placemark.subAdministrativeArea ?? 'Unknown District',
        'name': placemark.name ?? 'Unknown Name',
        'street': placemark.thoroughfare ?? 'Unknown Street',
        'locality': placemark.locality ?? 'Unknown Locality',
        'postalCode': placemark.postalCode ?? 'Unknown PostalCode',
      };
    } else {
      return {
        'province': 'Unknown Province',
        'district': 'Unknown District',
        'name': 'Unknown Name',
        'street': 'Unknown Street',
        'locality': 'Unknown Locality',
        'postalCode': 'Unknown PostalCode',
      };
    }
  }

  Future<Either<Failure, Position>> getCurrentPosition() async {
    try {
      var permission = await Geolocator.checkPermission();

      // ── 1. Munculkan iOS/Android native popup jika belum diminta atau
      //       pernah ditolak sekali (bukan permanently denied).
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.unableToDetermine) {
        permission = await Geolocator.requestPermission();
      }

      // ── 2. Izin ditolak setelah diminta atau ditolak permanen.
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // iOS: tidak maksa, diam-diam fallback ke (0, 0).
        if (Platform.isIOS) {
          return Right(_fallbackPosition());
        }

        // Android: tampilkan alert seperti semula.
        return const Left(
          PermissionFailure(
            permissionType: PermissionType.location,
            title: 'Izinkan Akses Lokasi',
            message:
                'Kami menggunakan lokasi Anda untuk '
                'menampilkan informasi kehalalan produk '
                'yang sesuai dengan wilayah Anda.',
          ),
        );
      }

      // ── 3. Cek apakah layanan lokasi (GPS) aktif.
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        // iOS: GPS mati → fallback ke (0, 0) tanpa alert.
        if (Platform.isIOS) {
          return Right(_fallbackPosition());
        }

        // Android: tampilkan alert seperti semula.
        return const Left(
          LocationFailure(
            'Izinkan Akses Lokasi',
            'Kami menggunakan lokasi Anda untuk '
                'menampilkan informasi kehalalan produk '
                'yang sesuai dengan wilayah Anda.',
          ),
        );
      }

      // ── 4. Ambil posisi.
      try {
        final position = await Geolocator.getCurrentPosition();
        if (kReleaseMode && position.isMocked) {
          return const Left(
            LocationFakeGpsFailure(
              'Lokasi Palsu Terdeteksi',
              'Aplikasi kami mendeteksi penggunaan Lokasi palsu. '
                  'Harap nonaktifkan untuk menggunakan fitur kami.',
            ),
          );
        }

        return Right(position);
      } on LocationError catch (e) {
        return Left(LocationFailure('Failed to get current location', '$e'));
      }
    } on LocationError catch (e) {
      return Left(LocationFailure('Gagal mendapatkan lokasi', '$e'));
    }
  }

  /// Posisi fallback (0, 0) — digunakan di iOS saat user menolak izin lokasi.
  Position _fallbackPosition() => Position(
    latitude: 0,
    longitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  Future<String> getLocationPlaceMark(double latitude, double longitude) async {
    try {
      final response = await placemarkFromCoordinates(latitude, longitude);
      final province = response.first.subLocality;
      final country = response.first.administrativeArea;

      return '$province, $country';
    } on PlatformException {
      return 'Unknown place, try again';
    }
  }
}
