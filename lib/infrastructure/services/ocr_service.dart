import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OcrService {
  // Database kata kunci halal (dummy)
  static final Map<String, String> halalKeywords = {
    'indomie': 'Halal',
    'potato': 'Halal',
    'mama lemon': 'Halal',
    'ekonomi': 'Halal',
    'lavender': 'Halal',
    'aqua': 'Halal',
    'energen': 'Halal',
    'silver queen': 'Halal',
    'wardah': 'Halal',
    'labore': 'Halal',
    'kanzler': 'Halal',
    'rinso': 'Halal',
    'betadine': 'Halal',
    'metoo': 'Halal',
  };

  /// Jalankan OCR
  static Future<String> extractMainText(
    String path, {
    double minArea = 3000, // sesuaikan
  }) async {
    final inputImage = InputImage.fromFile(File(path));
    final textRecognizer = TextRecognizer();

    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );

    textRecognizer.close();

    final buffer = StringBuffer();

    for (final block in recognizedText.blocks) {
      final rect = block.boundingBox;
      final area = rect.width * rect.height;

      if (area >= minArea) {
        buffer.writeln(block.text);
      }
    }

    return buffer.toString().trim();
  }

  static Future<String> extractBigText(String path) async {
    final inputImage = InputImage.fromFile(File(path));
    final textRecognizer = TextRecognizer();

    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );

    textRecognizer.close();

    final blocks = recognizedText.blocks.map((block) {
      final rect = block.boundingBox;
      final area = rect.width * rect.height;
      return TextBlockArea(block.text, area);
    }).toList();

    // sort dari area terbesar
    blocks.sort((a, b) => b.area.compareTo(a.area));

    return blocks.isNotEmpty ? blocks.first.text : '';
  }

  /// Cocokkan hasil OCR dengan database halal
  static String detectHalalStatus(String text) {
    String lowered = text.toLowerCase();

    for (var key in halalKeywords.keys) {
      if (lowered.contains(key)) {
        return halalKeywords[key]!;
      }
    }

    return 'Belum Terdaftar';
  }
}

class TextBlockArea {
  final String text;
  final double area;

  TextBlockArea(this.text, this.area);
}
