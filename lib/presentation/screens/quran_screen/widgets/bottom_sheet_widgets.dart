import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class QuranSelectionResult {
  const QuranSelectionResult({
    required this.juzIndex,
    required this.surah,
    required this.verseNumber,
  });

  final String juzIndex;
  final SurahModel surah;
  final int verseNumber;
}

class BottomSheetSelectQuran extends StatefulWidget {
  const BottomSheetSelectQuran({
    required this.surahs,
    required this.juzList,
    super.key,
    this.initialJuzIndex,
    this.initialSurahIndex,
    this.initialVerseNumber,
  });

  final List<SurahModel> surahs;
  final List<JuzModel> juzList;
  final String? initialJuzIndex;
  final String? initialSurahIndex;
  final int? initialVerseNumber;

  @override
  State<BottomSheetSelectQuran> createState() => _BottomSheetSelectQuranState();
}

class _BottomSheetSelectQuranState extends State<BottomSheetSelectQuran> {
  static const double _itemExtent = 36;

  final ScrollController _juzController = ScrollController();
  final ScrollController _surahController = ScrollController();
  final ScrollController _verseController = ScrollController();

  late SurahModel _selectedSurah;
  late int _selectedVerseNumber;
  late String _selectedJuzIndex;

  @override
  void initState() {
    super.initState();
    _setInitialSelection();
    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToSelections());
  }

  @override
  void didUpdateWidget(covariant BottomSheetSelectQuran oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.surahs != widget.surahs ||
        oldWidget.juzList != widget.juzList) {
      _setInitialSelection();
      WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToSelections());
    }
  }

  @override
  void dispose() {
    _juzController.dispose();
    _surahController.dispose();
    _verseController.dispose();
    super.dispose();
  }

  void _setInitialSelection() {
    if (widget.surahs.isEmpty) return;

    _selectedSurah =
        _findSurah(widget.initialSurahIndex) ?? widget.surahs.first;
    _selectedVerseNumber = _clampedVerse(
      widget.initialVerseNumber ?? _verseStartFromJuz(widget.initialJuzIndex),
      _selectedSurah,
    );
    _selectedJuzIndex =
        _juzIndexForVerse(_selectedSurah, _selectedVerseNumber) ??
        widget.initialJuzIndex ??
        _firstJuzIndex(_selectedSurah) ??
        (widget.juzList.isEmpty ? null : widget.juzList.first.index) ??
        '1';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (widget.surahs.isEmpty) {
      return SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Data Quran belum tersedia',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: ColorPalette.contentSecondary,
            ),
          ),
        ),
      );
    }

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                _header(context, 'Juz', flex: 2),
                _header(context, 'Surah', flex: 5),
                _header(context, 'Ayat', flex: 2),
              ],
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: _itemExtent * 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _juzList(context),
                  ),
                  Expanded(
                    flex: 5,
                    child: _surahList(context),
                  ),
                  Expanded(
                    flex: 2,
                    child: _verseList(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SubmitButtonStylesWidget(
              style: SubmitButtonStyle.elevated,
              primaryColor: ColorPalette.primaryColor,
              textButton: 'Konfirmasi',
              height: 46,
              radius: 24,
              onPressed: _confirm,
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(
    BuildContext context,
    String label, {
    required int flex,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: ColorPalette.contentSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _juzList(BuildContext context) {
    final juzItems = widget.juzList.isEmpty
        ? _juzIndexesFromSurahs()
        : widget.juzList.map((juz) => juz.index).whereType<String>().toList();

    return ListView.builder(
      controller: _juzController,
      padding: EdgeInsets.zero,
      itemExtent: _itemExtent,
      itemCount: juzItems.length,
      itemBuilder: (context, index) {
        final juzIndex = juzItems[index];
        return _pickerItem(
          context,
          label: juzIndex,
          isSelected: juzIndex == _selectedJuzIndex,
          alignment: Alignment.center,
          onTap: () => _selectJuz(juzIndex),
        );
      },
    );
  }

  Widget _surahList(BuildContext context) {
    return ListView.builder(
      controller: _surahController,
      padding: EdgeInsets.zero,
      itemExtent: _itemExtent,
      itemCount: widget.surahs.length,
      itemBuilder: (context, index) {
        final surah = widget.surahs[index];
        final label =
            '${_readableIndex(surah.index)}. '
            '${_cleanQuranText(surah.title ?? 'Surah')}';

        return _pickerItem(
          context,
          label: label,
          isSelected: surah.index == _selectedSurah.index,
          alignment: Alignment.center,
          onTap: () => _selectSurah(surah),
        );
      },
    );
  }

  Widget _verseList(BuildContext context) {
    final verseCount = _verseCount(_selectedSurah);

    return ListView.builder(
      controller: _verseController,
      padding: EdgeInsets.zero,
      itemExtent: _itemExtent,
      itemCount: verseCount,
      itemBuilder: (context, index) {
        final verseNumber = index + 1;

        return _pickerItem(
          context,
          label: '$verseNumber',
          isSelected: verseNumber == _selectedVerseNumber,
          alignment: Alignment.center,
          onTap: () => _selectVerse(verseNumber),
        );
      },
    );
  }

  Widget _pickerItem(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required Alignment alignment,
    required VoidCallback onTap,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: textTheme.labelSmall?.copyWith(
              fontSize: isSelected ? 16 : null,
              color: isSelected
                  ? ColorPalette.kBlack
                  : ColorPalette.contentSecondary,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  void _selectJuz(String juzIndex) {
    final nextSurah = _firstSurahInJuz(juzIndex) ?? _selectedSurah;
    final nextVerse = _firstVerseInJuz(juzIndex, nextSurah);

    setState(() {
      _selectedJuzIndex = juzIndex;
      _selectedSurah = nextSurah;
      _selectedVerseNumber = _clampedVerse(nextVerse, nextSurah);
    });
    _animateToSelections();
  }

  void _selectSurah(SurahModel surah) {
    setState(() {
      _selectedSurah = surah;
      _selectedVerseNumber = 1;
      _selectedJuzIndex =
          _juzIndexForVerse(surah, _selectedVerseNumber) ??
          _firstJuzIndex(surah) ??
          _selectedJuzIndex;
    });
    _animateToSelections();
  }

  void _selectVerse(int verseNumber) {
    setState(() {
      _selectedVerseNumber = verseNumber;
      _selectedJuzIndex =
          _juzIndexForVerse(_selectedSurah, verseNumber) ?? _selectedJuzIndex;
    });
    _animateToSelections();
  }

  void _confirm() {
    Navigator.of(context).pop(
      QuranSelectionResult(
        juzIndex: _selectedJuzIndex,
        surah: _selectedSurah,
        verseNumber: _selectedVerseNumber,
      ),
    );
  }

  void _jumpToSelections() {
    if (widget.surahs.isEmpty) return;

    _scrollTo(_juzController, _selectedJuzListIndex(), animate: false);
    _scrollTo(_surahController, _selectedSurahListIndex(), animate: false);
    _scrollTo(_verseController, _selectedVerseNumber - 1, animate: false);
  }

  void _animateToSelections() {
    if (widget.surahs.isEmpty) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollTo(_juzController, _selectedJuzListIndex());
      _scrollTo(_surahController, _selectedSurahListIndex());
      _scrollTo(_verseController, _selectedVerseNumber - 1);
    });
  }

  void _scrollTo(
    ScrollController controller,
    int index, {
    bool animate = true,
  }) {
    if (index < 0 || !controller.hasClients) return;

    final centeredOffset =
        (index * _itemExtent) -
        ((controller.position.viewportDimension - _itemExtent) / 2);
    final offset = centeredOffset.clamp(
      controller.position.minScrollExtent,
      controller.position.maxScrollExtent,
    );

    if (!animate) {
      controller.jumpTo(offset);
      return;
    }

    unawaited(
      controller.animateTo(
        offset,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
      ),
    );
  }

  int _selectedJuzListIndex() {
    if (widget.juzList.isNotEmpty) {
      return widget.juzList.indexWhere((juz) => juz.index == _selectedJuzIndex);
    }

    return _juzIndexesFromSurahs().indexOf(_selectedJuzIndex);
  }

  int _selectedSurahListIndex() {
    return widget.surahs.indexWhere(
      (surah) => surah.index == _selectedSurah.index,
    );
  }

  SurahModel? _findSurah(String? surahIndex) {
    if (surahIndex == null) return null;
    for (final surah in widget.surahs) {
      if (surah.index == surahIndex) return surah;
    }
    return null;
  }

  SurahModel? _firstSurahInJuz(String juzIndex) {
    final juz = _findJuz(juzIndex);
    final surahFromJuz = _findSurah(juz?.start?.index);
    if (surahFromJuz != null) return surahFromJuz;

    for (final surah in widget.surahs) {
      if ((surah.juz ?? const <SurahJuz>[]).any(
        (item) => item.index == juzIndex,
      )) {
        return surah;
      }
    }
    return null;
  }

  JuzModel? _findJuz(String? juzIndex) {
    if (juzIndex == null) return null;
    for (final juz in widget.juzList) {
      if (juz.index == juzIndex) return juz;
    }
    return null;
  }

  int _firstVerseInJuz(String juzIndex, SurahModel surah) {
    final juz = _findJuz(juzIndex);
    if (juz?.start?.index == surah.index) {
      final startVerse = _verseNumberFromEndpoint(juz?.start?.verse);
      if (startVerse != null) return startVerse;
    }

    for (final item in surah.juz ?? const <SurahJuz>[]) {
      if (item.index == juzIndex) {
        return int.tryParse(item.verse?.start ?? '') ?? 1;
      }
    }
    return 1;
  }

  int? _verseStartFromJuz(String? juzIndex) {
    final juz = _findJuz(juzIndex);
    return _verseNumberFromEndpoint(juz?.start?.verse);
  }

  int? _verseNumberFromEndpoint(String? value) {
    if (value == null) return null;
    final parts = value.split('_');
    if (parts.length < 2) return null;
    return int.tryParse(parts[1]);
  }

  String? _juzIndexForVerse(SurahModel surah, int verseNumber) {
    for (final item in surah.juz ?? const <SurahJuz>[]) {
      final start = int.tryParse(item.verse?.start ?? '') ?? 1;
      final end = int.tryParse(item.verse?.end ?? '') ?? _verseCount(surah);
      if (verseNumber >= start && verseNumber <= end) {
        return item.index;
      }
    }
    return null;
  }

  String? _firstJuzIndex(SurahModel surah) {
    final juz = surah.juz;
    if (juz == null || juz.isEmpty) return null;
    return juz.first.index;
  }

  List<String> _juzIndexesFromSurahs() {
    final indexes = <String>{};
    for (final surah in widget.surahs) {
      for (final juz in surah.juz ?? const <SurahJuz>[]) {
        final index = juz.index;
        if (index != null) indexes.add(index);
      }
    }
    return indexes.toList()..sort((a, b) {
      return (int.tryParse(a) ?? 0).compareTo(int.tryParse(b) ?? 0);
    });
  }

  int _clampedVerse(int? value, SurahModel surah) {
    final verseCount = _verseCount(surah);
    return (value ?? 1).clamp(1, verseCount);
  }

  int _verseCount(SurahModel surah) {
    final count = surah.count ?? 0;
    return count > 0 ? count : 1;
  }

  String _readableIndex(String? value) {
    final parsed = int.tryParse(value ?? '');
    return parsed == null ? (value ?? '') : '$parsed';
  }

  String _cleanQuranText(String value) {
    return value
        .replaceAll('&#39;', "'")
        .replaceAll('&apos;', "'")
        .replaceAll('&quot;', '"')
        .replaceAll('&amp;', '&');
  }
}
