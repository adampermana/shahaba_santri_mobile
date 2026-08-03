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
      // ── 1. Cek izin dan munculkan prompt system jika belum pernah diminta.
      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.unableToDetermine) {
        permission = await Geolocator.requestPermission();
      }

      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
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

      // ── 2. Cek apakah layanan lokasi (GPS) aktif.
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return const Left(
          LocationFailure(
            'Izinkan Akses Lokasi',
            'Kami menggunakan lokasi Anda untuk '
                'menampilkan informasi kehalalan produk '
                'yang sesuai dengan wilayah Anda.',
          ),
        );
      }

      // ── 3. Ambil posisi
      // Jika izin diberikan dan layanan lokasi aktif, ambil posisi saat ini
      try {
        final position = await Geolocator.getCurrentPosition();
        // kReleaseMode
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
