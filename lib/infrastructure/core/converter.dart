import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mime/mime.dart';

String? parseToBase64(String? source) {
  if (source == null || source.isEmpty) return null;
  return base64Encode(File(source).readAsBytesSync());
}

Future<File> cropImageToAspectRatio({
  required File file,
  required double aspectRatio,
}) async {
  final bytes = await file.readAsBytes();
  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();
  final image = frame.image;

  try {
    final imageAspectRatio = image.width / image.height;
    late final ui.Rect sourceRect;

    if (imageAspectRatio > aspectRatio) {
      final cropWidth = image.height * aspectRatio;
      sourceRect = ui.Rect.fromLTWH(
        (image.width - cropWidth) / 2,
        0,
        cropWidth,
        image.height.toDouble(),
      );
    } else {
      final cropHeight = image.width / aspectRatio;
      sourceRect = ui.Rect.fromLTWH(
        0,
        (image.height - cropHeight) / 2,
        image.width.toDouble(),
        cropHeight,
      );
    }

    final outputWidth = sourceRect.width.round();
    final outputHeight = sourceRect.height.round();
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder)
      ..drawImageRect(
        image,
        sourceRect,
        ui.Rect.fromLTWH(
          0,
          0,
          outputWidth.toDouble(),
          outputHeight.toDouble(),
        ),
        ui.Paint(),
      );

    final croppedImage = await recorder.endRecording().toImage(
      outputWidth,
      outputHeight,
    );

    try {
      final croppedBytes = await croppedImage.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (croppedBytes == null) {
        throw StateError('Gagal memproses area gambar di dalam bingkai.');
      }

      final outputFile = File(
        '${Directory.systemTemp.path}/cropped_${DateTime.now().microsecondsSinceEpoch}.png',
      );
      await outputFile.writeAsBytes(croppedBytes.buffer.asUint8List());
      return outputFile;
    } finally {
      croppedImage.dispose();
    }
  } finally {
    image.dispose();
    codec.dispose();
  }
}

Future<String?> compressImageToTargetSize({
  required File file,
  int minQuality = 20,
  int targetMinKB = 200,
  int targetMaxKB = 400,
}) async {
  var quality = 75; // mulai dari kualitas tinggi
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
