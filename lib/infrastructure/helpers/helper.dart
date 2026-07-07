import 'package:sahaba_mobile/domains/quran/chapter.dart';
import 'package:sahaba_mobile/domains/quran/juz.dart';
import 'package:sahaba_mobile/domains/quran/verses/indopak.dart';

/// Check if the value is out of range
bool isOutOfRange(int value, int min, int max) => value < min || value > max;

/// Check if the juz number is out of range
bool isJuzOutOfRange(int value) {
  return isOutOfRange(value, 1, juzs.length);
}

/// Check if the chapter number is out of range
bool isChapterOutOfRange(int value) {
  return isOutOfRange(value, 1, chapters.length);
}

/// Check if the verse number is out of range
bool isVerseOutOfRange(int value) {
  return isOutOfRange(value, 1, versesIndopak.length);
}

/// Convert number to arabic number
String toArabicNumber(int number) {
  const digits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  return number
      .toString()
      .split('')
      .map((digit) => digits[int.parse(digit)])
      .join();
}
