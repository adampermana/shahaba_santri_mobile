import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mime/mime.dart';

String? parseToBase64(String? source) {
  if (source == null || source.isEmpty) return null;
  return base64Encode(File(source).readAsBytesSync());
}

Future<String?> compressImageToTargetSize({
  required File file,
  int minQuality = 20,
  int targetMinKB = 200,
  int targetMaxKB = 400,
}) async {
  int quality = 75; // mulai dari kualitas tinggi
  File? compressedFile;

  while (quality >= minQuality) {
    final result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      '${Directory.systemTemp.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
      quality: quality,
      minWidth: 1024,
      minHeight: 768,
    );

    if (result == null) return null;

    final sizeKB = File(result.path).lengthSync() ~/ 1024; // ✅ pakai File()

    if (sizeKB >= targetMinKB && sizeKB <= targetMaxKB) {
      compressedFile = File(result.path);
      break;
    }

    if (sizeKB > targetMaxKB) {
      quality -= 5; // turunin kualitas kalau masih terlalu besar
    } else {
      compressedFile = File(result.path); // udah cukup kecil
      break;
    }
  }
  debugPrint('ada sihh $quality');

  checkFileType(compressedFile!);
  debugPrint('wa[aan]: ${File(compressedFile.path).lengthSync() / 1024} KB');

  return compressedFile.path;
}

void checkFileType(File file) {
  final mimeType = lookupMimeType(file.path);
  debugPrint('Mime type: $mimeType');

  if (mimeType == 'image/png') {
    debugPrint('File ini PNG');
  } else if (mimeType == 'image/jpeg') {
    debugPrint('File ini JPEG');
  } else {
    debugPrint('Format lain: $mimeType');
  }
}
