import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_detail_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_detail_state.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/infrastructure/helpers/helper.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/enum_widget/enum_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

// const double _tabItemWidth = 130;

class DetailQuranScreen extends StatefulWidget {
  const DetailQuranScreen({super.key, this.args});

  final QuranDetailArgs? args;

  @override
  State<DetailQuranScreen> createState() => _DetailQuranScreenState();
}

class _DetailQuranScreenState extends State<DetailQuranScreen> {
  late final PageController _pageController;
  final _tabKeys = <GlobalKey>[];
  final _tabScrollController = ScrollController();
  final _details = <int, QuranDetailModel>{};
  final _errors = <int, String>{};
  final _requestedIndexes = <int>{};
  late QuranDetailArgs? _selectedArgs;
  late int _selectedIndex;

  List<SurahModel> get _surahs {
    final args = widget.args;
    if (args == null) return const [];
    if (args.allSurahs.isNotEmpty) return args.allSurahs;
    return args.surah == null ? const [] : [args.surah!];
  }

  List<JuzModel> get _juzList {
    final args = widget.args;
    if (args == null) return const [];
    if (args.allJuz.isNotEmpty) return args.allJuz;
    return args.juz == null ? const [] : [args.juz!];
  }

  bool get _isSurah => widget.args?.type == QuranDetailType.surah;

  int get _itemCount => _isSurah ? _surahs.length : _juzList.length;

  @override
  void initState() {
    super.initState();
    _selectedIndex = _initialIndex();
    _selectedArgs = _argsAt(_selectedIndex);
    _pageController = PageController(initialPage: _selectedIndex);
    _syncTabKeys();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _scrollToSelected(animate: false);
      _requestNearby(_selectedIndex);
    });
  }

  @override
  void didUpdateWidget(covariant DetailQuranScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.args != widget.args) {
      _details.clear();
      _errors.clear();
      _requestedIndexes.clear();
      _selectedIndex = _initialIndex();
      _selectedArgs = _argsAt(_selectedIndex);
      _syncTabKeys();
      _pageController.jumpToPage(_selectedIndex);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _scrollToSelected(animate: false);
        _requestNearby(_selectedIndex);
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabScrollController.dispose();
    super.dispose();
  }

  int _initialIndex() {
    final args = widget.args;
    if (args == null) return 0;

    if (args.type == QuranDetailType.surah) {
      final index = _surahs.indexWhere((s) => s.index == args.surah?.index);
      return index < 0 ? 0 : index;
    }

    final index = _juzList.indexWhere((j) => j.index == args.juz?.index);
    return index < 0 ? 0 : index;
  }

  QuranDetailArgs? _argsAt(int index) {
    final args = widget.args;
    if (args == null || index < 0 || index >= _itemCount) return null;

    if (args.type == QuranDetailType.surah) {
      return QuranDetailArgs.surah(
        _surahs[index],
        allSurahs: _surahs,
      );
    }

    return QuranDetailArgs.juz(
      _juzList[index],
      allJuz: _juzList,
    );
  }

  int _indexForArgs(QuranDetailArgs? args) {
    if (args == null || args.type != widget.args?.type) return -1;

    if (args.type == QuranDetailType.surah) {
      return _surahs.indexWhere((s) => s.index == args.surah?.index);
    }

    return _juzList.indexWhere((j) => j.index == args.juz?.index);
  }

  void _syncTabKeys() {
    while (_tabKeys.length < _itemCount) {
      _tabKeys.add(GlobalKey());
    }
    if (_tabKeys.length > _itemCount) {
      _tabKeys.removeRange(_itemCount, _tabKeys.length);
    }
  }

  void _selectIndex(int index) {
    if (index == _selectedIndex || index < 0 || index >= _itemCount) return;
    _loadIndex(index);
    unawaited(
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      ),
    );
  }

  void _loadIndex(int index) {
    final nextArgs = _argsAt(index);
    if (nextArgs == null) return;

    setState(() {
      _selectedIndex = index;
      _selectedArgs = nextArgs;
    });
    _scrollToSelected();
    _requestNearby(index);
  }

  void _onPageChanged(int index) => _loadIndex(index);

  void _requestNearby(int index) {
    _requestLoad(index);
    _requestLoad(index - 1);
    _requestLoad(index + 1);
  }

  void _requestLoad(int index) {
    final args = _argsAt(index);
    if (args == null) return;
    if (_details.containsKey(index) || !_requestedIndexes.add(index)) return;

    unawaited(context.read<QuranDetailCubit>().load(args));
  }

  void _scrollToSelected({bool animate = true}) {
    final selectedContext = _tabKeys
        .elementAtOrNull(_selectedIndex)
        ?.currentContext;
    if (selectedContext == null) return;

    final duration = animate
        ? const Duration(milliseconds: 220)
        : Duration.zero;
    unawaited(
      Scrollable.ensureVisible(
        selectedContext,
        duration: duration,
        curve: Curves.easeOut,
        alignment: 0.5,
      ),
    );
  }

  Widget _pageAt(int index) {
    final detail = _details[index];
    if (detail != null) return _DetailContent(detail: detail);

    final error = _errors[index];
    if (error != null) return _ErrorState(message: error);

    return const Center(
      child: CircularProgressIndicator(
        color: ColorPalette.primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.args == null || _selectedArgs == null || _itemCount == 0) {
      return _DetailScaffold(
        tabBar: null,
        child: Center(
          child: Text(
            'Data Quran tidak valid',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }

    return _DetailScaffold(
      tabBar: _ScrollableTabBar(
        controller: _tabScrollController,
        itemKeys: _tabKeys,
        selectedIndex: _selectedIndex,
        labels: _tabLabels(),
        onTap: _selectIndex,
      ),
      child: BlocListener<QuranDetailCubit, QuranDetailState>(
        listener: (context, state) {
          final index = switch (state) {
            QuranDetailLoaded(:final args) => _indexForArgs(args),
            QuranDetailError(:final args) => _indexForArgs(args),
            QuranDetailLoading(:final args) => _indexForArgs(args),
            _ => -1,
          };
          if (index < 0) return;

          setState(() {
            if (state is QuranDetailLoaded) {
              _errors.remove(index);
              _details[index] = state.detail;
            } else if (state is QuranDetailError) {
              _details.remove(index);
              _errors[index] = state.message;
            }
          });
        },
        child: PageView.builder(
          controller: _pageController,
          reverse: true,
          allowImplicitScrolling: true,
          itemCount: _itemCount,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) => _pageAt(index),
        ),
      ),
    );
  }

  List<String> _tabLabels() {
    if (_isSurah) return _surahs.map((s) => s.title ?? '').toList();
    return _juzList.map((j) => 'Juz ${j.index}').toList();
  }
}

class _DetailScaffold extends StatelessWidget {
  const _DetailScaffold({required this.child, required this.tabBar});

  final Widget child;
  final Widget? tabBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: Column(
        children: [
          const _AppBarSection(),
          ?tabBar,
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget {
  const _AppBarSection();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      bottom: false,
      child: Container(
        color: ColorPalette.kWhite,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Row(
                spacing: 8,
                children: [
                  SvgPicture.asset(
                    AppIcons.arrowLeftLine,
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'Kembali',
                    style: textTheme.titleSmall?.copyWith(
                      color: ColorPalette.contentSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              spacing: 16,
              children: [
                SvgPicture.asset(
                  AppIcons.arrowGoForwardLine,
                  width: 24,
                  height: 24,
                ),
                SvgPicture.asset(
                  AppIcons.settings4Line,
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ScrollableTabBar extends StatelessWidget {
  const _ScrollableTabBar({
    required this.controller,
    required this.itemKeys,
    required this.selectedIndex,
    required this.labels,
    required this.onTap,
  });

  final ScrollController controller;
  final List<GlobalKey> itemKeys;
  final int selectedIndex;
  final List<String> labels;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorPalette.kWhite,
        border: Border(
          bottom: BorderSide(color: ColorPalette.borderTransparent),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 3,
            offset: Offset(0, 5),
          ),
          BoxShadow(
            color: Color(0x03000000),
            blurRadius: 4,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          textDirection: TextDirection.rtl,
          children: List.generate(labels.length, (index) {
            return _TabItem(
              key: itemKeys[index],
              label: labels[index],
              isActive: index == selectedIndex,
              onTap: () => onTap(index),
            );
          }),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.mediaQuerySize.width * 0.34,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: isActive
            ? const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorPalette.primaryColor,
                    width: 2,
                  ),
                ),
              )
            : null,
        alignment: Alignment.center,
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.labelSmall?.copyWith(
            color: isActive
                ? ColorPalette.primaryColor
                : ColorPalette.onSurface,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({required this.detail});

  final QuranDetailModel detail;

  @override
  Widget build(BuildContext context) {
    if (detail.type == QuranDetailType.juz) {
      return _JuzContent(detail: detail);
    }
    return _SurahContent(detail: detail);
  }
}

class _SurahContent extends StatelessWidget {
  const _SurahContent({required this.detail});

  final QuranDetailModel detail;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _SurahBanner(detail: detail)),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
          sliver: SliverList.separated(
            itemCount: detail.verses.length,
            separatorBuilder: (_, _) => const Divider(
              height: 1,
              thickness: 1,
              color: ColorPalette.borderTransparent,
            ),
            itemBuilder: (context, index) {
              return _VerseRow(
                verse: detail.verses[index],
                showSurahName: false,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _JuzContent extends StatelessWidget {
  const _JuzContent({required this.detail});

  final QuranDetailModel detail;

  List<_SurahGroup> _groupBySurah(List<QuranVerseModel> verses) {
    final groups = <_SurahGroup>[];
    for (final v in verses) {
      if (groups.isEmpty || groups.last.surahIndex != v.surahIndex) {
        groups.add(
          _SurahGroup(
            surahIndex: v.surahIndex,
            surahName: v.surahName,
            surahNameAr: v.surahNameAr,
            verses: [v],
          ),
        );
      } else {
        groups.last.verses.add(v);
      }
    }
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    final groups = _groupBySurah(detail.verses);

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: groups.length,
      itemBuilder: (context, gi) {
        final group = groups[gi];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SurahBannerInJuz(
              surahName: group.surahName,
              surahNameAr: group.surahNameAr,
            ),
            ...group.verses.asMap().entries.map((e) {
              final isLast = e.key == group.verses.length - 1;
              return Column(
                children: [
                  _VerseRow(verse: e.value, showSurahName: true),
                  if (!isLast || gi < groups.length - 1)
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: ColorPalette.borderTransparent,
                    ),
                ],
              );
            }),
          ],
        );
      },
    );
  }
}

class _SurahGroup {
  _SurahGroup({
    required this.surahIndex,
    required this.surahName,
    required this.surahNameAr,
    required this.verses,
  });

  final String surahIndex;
  final String surahName;
  final String surahNameAr;
  final List<QuranVerseModel> verses;
}

class _SurahBanner extends StatelessWidget {
  const _SurahBanner({required this.detail});

  final QuranDetailModel detail;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 49,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/motif-header.png',
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (detail.titleAr != null && detail.titleAr!.trim().isNotEmpty)
                  Text(
                    detail.titleAr!,
                    style: textTheme.titleMedium?.copyWith(
                      fontFamily: 'Markazi Text',
                      color: ColorPalette.arabicText,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                else
                  Text(
                    detail.title,
                    style: textTheme.titleSmall?.copyWith(
                      color: ColorPalette.kWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SurahBannerInJuz extends StatelessWidget {
  const _SurahBannerInJuz({
    required this.surahName,
    required this.surahNameAr,
  });

  final String surahName;
  final String surahNameAr;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 49,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/motif-header.png',
          ),
          Center(
            child: Text(
              surahNameAr.trim().isNotEmpty ? surahNameAr : surahName,
              style: textTheme.titleMedium?.copyWith(
                fontFamily: 'Markazi Text',
                color: ColorPalette.arabicText,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VerseRow extends StatelessWidget {
  const _VerseRow({required this.verse, required this.showSurahName});

  final QuranVerseModel verse;
  final bool showSurahName;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: ColorPalette.kWhite,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _VerseNumberBadge(number: verse.verseNumber),
              const SizedBox(width: 12),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: verse.arabic,
                        style: const TextStyle(
                          color: ColorPalette.kBlack,
                          fontSize: 24,
                          fontFamily: 'Markazi Text',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 8)),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: _ArabicVerseNumber(number: verse.verseNumber),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: textTheme.displaySmall?.copyWith(
                    fontFamily: 'Markazi Text',
                    color: ColorPalette.kBlack,
                    fontSize: 24,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          if (verse.transliteration.trim().isNotEmpty) ...[
            const SizedBox(height: 22),
            Text(
              verse.transliteration,
              style: textTheme.titleMedium?.copyWith(
                color: ColorPalette.primaryColor,
                fontSize: 14,
                fontFamily: 'Synonym Variable',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
          if (verse.translation.trim().isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              verse.translation,
              style: textTheme.bodyLarge?.copyWith(
                color: ColorPalette.kBlack,
                fontSize: 14,
                fontFamily: 'Synonym Variable',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ArabicVerseNumber extends StatelessWidget {
  const _ArabicVerseNumber({required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox.square(
      dimension: 28,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorPalette.arabicText),
        ),
        child: Center(
          child: Text(
            toArabicNumber(number),
            style: textTheme.labelSmall?.copyWith(
              color: ColorPalette.arabicText,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _VerseNumberBadge extends StatelessWidget {
  const _VerseNumberBadge({required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox.square(
      dimension: 36,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.motifBorderUnselected,
            width: 36,
            height: 36,
          ),
          Text(
            '$number',
            style: textTheme.labelSmall?.copyWith(
              color: ColorPalette.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            SubmitButtonStylesWidget(
              textButton: 'Kembali',
              height: 48,
              primaryColor: ColorPalette.primaryColor,
              style: SubmitButtonStyle.elevated,
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ],
        ),
      ),
    );
  }
}
