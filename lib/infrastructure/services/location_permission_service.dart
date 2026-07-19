import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';

class LocationPermissionService {
  Future<Either<Failure, Position>> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Cek apakah layanan lokasi diaktifkan
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Left(
        LocationFailure(
          'Tidak bisa mendapatkan lokasi saat ini',
          'Pastikan Anda mengaktifkan GPS dan coba lagi',
        ),
      );
    }

    // Cek status izin lokasi saat ini
    permission = await Geolocator.checkPermission();

    // Hanya minta izin jika belum diberikan
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    // Cek ulang izin yang diberikan setelah permintaan
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return const Left(
        PermissionFailure(
          permissionType: PermissionType.location,
          title: 'Tidak bisa mendapatkan lokasi saat ini',
          message:
              'Izin lokasi ditolak. Aktifkan izin untuk '
              'mengakses fitur tersebut.',
        ),
      );
    }

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
  }

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
