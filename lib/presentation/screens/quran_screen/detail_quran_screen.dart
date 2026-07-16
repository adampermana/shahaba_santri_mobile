import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/last_read_state.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_detail_cubit.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_detail_state.dart';
import 'package:sahaba_mobile/domains/quran/juz_model.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/infrastructure/helpers/helper.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/enum/enum_widget.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/bottom_sheet_widgets.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_dialogs_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

typedef _SurahGroup = ({
  String surahIndex,
  String surahName,
  String surahNameAr,
  List<QuranVerseModel> verses,
});

const _minArabicTextSize = 20.0;
const _defaultArabicTextSize = 28.0;
const _maxArabicTextSize = 48.0;
const _minLatinTextSize = 12.0;
const _defaultLatinTextSize = 16.0;
const _maxLatinTextSize = 20.0;
const _minArabicVerseNumberSize = 20.0;
const _defaultArabicVerseNumberSize = 28.0;
const _maxArabicVerseNumberSize = 34.0;
const _shareChannel = MethodChannel('sahaba/share');

double _arabicTextSize(double value) => _scaledTextSize(
  value,
  min: _minArabicTextSize,
  normal: _defaultArabicTextSize,
  max: _maxArabicTextSize,
);

double _latinTextSize(double value) => _scaledTextSize(
  value,
  min: _minLatinTextSize,
  normal: _defaultLatinTextSize,
  max: _maxLatinTextSize,
);

double _arabicVerseNumberSize(double value) => _scaledTextSize(
  value,
  min: _minArabicVerseNumberSize,
  normal: _defaultArabicVerseNumberSize,
  max: _maxArabicVerseNumberSize,
);

double _scaledTextSize(
  double value, {
  required double min,
  required double normal,
  required double max,
}) {
  final clamped = value.clamp(-1, 1).toDouble();
  if (clamped < 0) return normal + ((normal - min) * clamped);
  return normal + ((max - normal) * clamped);
}

String _cleanQuranText(String value) {
  return value
      .replaceAll('&#39;', "'")
      .replaceAll('&apos;', "'")
      .replaceAll('&quot;', '"')
      .replaceAll('&amp;', '&');
}

class DetailQuranScreen extends HookWidget {
  const DetailQuranScreen({super.key, this.args});

  final QuranDetailArgs? args;

  @override
  Widget build(BuildContext context) {
    final activeArgs = useState<QuranDetailArgs?>(args);
    final currentArgs = activeArgs.value;
    final surahs = _surahsFromArgs(currentArgs);
    final juzList = _juzListFromArgs(currentArgs);
    final isSurah = currentArgs?.type == QuranDetailType.surah;
    final itemCount = isSurah ? surahs.length : juzList.length;

    int initialIndex() {
      if (currentArgs == null) return 0;

      if (currentArgs.type == QuranDetailType.surah) {
        final index = surahs.indexWhere(
          (s) => s.index == currentArgs.surah?.index,
        );
        return index < 0 ? 0 : index;
      }

      final index = juzList.indexWhere(
        (j) => j.index == currentArgs.juz?.index,
      );
      return index < 0 ? 0 : index;
    }

    QuranDetailArgs? argsAt(int index) {
      if (currentArgs == null || index < 0 || index >= itemCount) return null;

      if (currentArgs.type == QuranDetailType.surah) {
        return QuranDetailArgs.surah(
          surahs[index],
          allSurahs: surahs,
          allJuz: juzList,
          initialVerseNumber: surahs[index].index == currentArgs.surah?.index
              ? currentArgs.initialVerseNumber
              : null,
          initialVerseKey: surahs[index].index == currentArgs.surah?.index
              ? currentArgs.initialVerseKey
              : null,
        );
      }

      return QuranDetailArgs.juz(
        juzList[index],
        allSurahs: surahs,
        allJuz: juzList,
        initialVerseKey: juzList[index].index == currentArgs.juz?.index
            ? currentArgs.initialVerseKey
            : null,
      );
    }

    int indexForArgs(QuranDetailArgs? value) {
      if (value == null || value.type != currentArgs?.type) return -1;

      if (value.type == QuranDetailType.surah) {
        return surahs.indexWhere((s) => s.index == value.surah?.index);
      }

      return juzList.indexWhere((j) => j.index == value.juz?.index);
    }

    final selectedIndex = useState(initialIndex());
    final details = useState(<int, QuranDetailModel>{});
    final errors = useState(<int, String>{});
    final requestedIndexes = useState(<int>{});
    final textSizeSetting = useState<double>(0);
    final pageController = usePageController(initialPage: selectedIndex.value);
    final tabScrollController = useScrollController();

    void openSettingDialog() {
      unawaited(
        showCustomDialog<void>(
          context: context,
          dialog: CustomDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 14),
            borderRadius: 8,
            content: _settingDialogContent(
              context,
              initialValue: textSizeSetting.value,
              onChanged: (value) => textSizeSetting.value = value,
            ),
          ),
        ),
      );
    }

    Future<void> openQuranSelectSheet() async {
      final selectedArgs = argsAt(selectedIndex.value) ?? currentArgs;
      final result = await showModalBottomSheet<QuranSelectionResult>(
        context: context,
        backgroundColor: ColorPalette.kWhite,
        barrierColor: ColorPalette.kBlack.withValues(alpha: 0.58),
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        builder: (context) => BottomSheetSelectQuran(
          surahs: surahs,
          juzList: juzList,
          initialJuzIndex: selectedArgs?.juz?.index,
          initialSurahIndex:
              selectedArgs?.surah?.index ?? selectedArgs?.juz?.start?.index,
          initialVerseNumber:
              selectedArgs?.initialVerseNumber ??
              _verseNumberFromVerseKey(selectedArgs?.initialVerseKey) ??
              _verseNumberFromJuz(selectedArgs?.juz),
        ),
      );

      if (result == null || !context.mounted) return;

      activeArgs.value = QuranDetailArgs.surah(
        result.surah,
        allSurahs: surahs,
        allJuz: juzList,
        initialVerseNumber: result.verseNumber,
      );
    }

    void scrollToSelected(int index, {bool animate = true}) {
      if (!tabScrollController.hasClients) return;

      final tabWidth = context.mediaQuerySize.width * 0.34;
      final viewportWidth = context.mediaQuerySize.width;
      final target = (index * tabWidth) - ((viewportWidth - tabWidth) / 2);
      final offset = target.clamp(
        tabScrollController.position.minScrollExtent,
        tabScrollController.position.maxScrollExtent,
      );

      if (!animate) {
        tabScrollController.jumpTo(offset);
        return;
      }

      unawaited(
        tabScrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
        ),
      );
    }

    void requestLoad(int index) {
      final nextArgs = argsAt(index);
      if (nextArgs == null) return;
      if (details.value.containsKey(index) ||
          requestedIndexes.value.contains(index)) {
        return;
      }

      requestedIndexes.value = {...requestedIndexes.value, index};
      if (!context.mounted) return;
      unawaited(context.read<QuranDetailCubit>().load(nextArgs));
    }

    void requestCurrentThenNearby(int index) {
      requestLoad(index);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        requestLoad(index - 1);
        requestLoad(index + 1);
      });
    }

    void setSelectedIndex(int index) {
      if (argsAt(index) == null) return;

      selectedIndex.value = index;
      scrollToSelected(index);
    }

    void selectIndex(int index) {
      if (index == selectedIndex.value || index < 0 || index >= itemCount) {
        return;
      }

      setSelectedIndex(index);
      unawaited(
        pageController
            .animateToPage(
              index,
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOut,
            )
            .then((_) {
              if (!context.mounted) return;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!context.mounted) return;
                requestCurrentThenNearby(index);
              });
            }),
      );
    }

    Widget pageAt(int index) {
      final detail = details.value[index];
      final currentArgs = argsAt(index);
      if (detail != null) {
        return detail.type == QuranDetailType.juz
            ? _juzContent(
                context,
                detail,
                textSizeSetting.value,
                detailArgs: currentArgs,
                initialVerseKey: currentArgs?.initialVerseKey,
              )
            : _surahContent(
                context,
                detail,
                textSizeSetting.value,
                detailArgs: currentArgs,
                initialVerseNumber: currentArgs?.initialVerseNumber,
                initialVerseKey: currentArgs?.initialVerseKey,
              );
      }

      final error = errors.value[index];
      if (error != null) return _errorState(context, error);

      return const Center(
        child: CircularProgressIndicator(
          color: ColorPalette.primaryColor,
        ),
      );
    }

    useEffect(
      () {
        activeArgs.value = args;
        return null;
      },
      [args],
    );

    useEffect(
      () {
        final index = initialIndex();
        details.value = <int, QuranDetailModel>{};
        errors.value = <int, String>{};
        requestedIndexes.value = <int>{};
        selectedIndex.value = index;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;
          if (pageController.hasClients) pageController.jumpToPage(index);
          scrollToSelected(index, animate: false);
          requestCurrentThenNearby(index);
        });
        return null;
      },
      [currentArgs, surahs, juzList],
    );

    final safeSelectedIndex = selectedIndex.value >= itemCount
        ? initialIndex()
        : selectedIndex.value;
    final selectedArgs = argsAt(safeSelectedIndex);

    if (currentArgs == null || selectedArgs == null || itemCount == 0) {
      return _detailScaffold(
        context,
        child: Center(
          child: Text(
            'Data Quran tidak valid',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }

    final tabLabels = isSurah
        ? surahs.map((s) => _cleanQuranText(s.title ?? '')).toList()
        : juzList.map((j) => 'Juz ${j.index}').toList();

    return _detailScaffold(
      context,
      onSettingTap: openSettingDialog,
      onQuranSelectTap: () => unawaited(openQuranSelectSheet()),
      tabBar: _scrollableTabBar(
        context,
        controller: tabScrollController,
        selectedIndex: safeSelectedIndex,
        labels: tabLabels,
        onTap: selectIndex,
      ),
      child: BlocListener<QuranDetailCubit, QuranDetailState>(
        listener: (context, state) {
          final index = switch (state) {
            QuranDetailLoaded(:final args) => indexForArgs(args),
            QuranDetailError(:final args) => indexForArgs(args),
            QuranDetailLoading(:final args) => indexForArgs(args),
            _ => -1,
          };
          if (index < 0) return;

          if (state is QuranDetailLoaded) {
            final nextErrors = {...errors.value}..remove(index);
            errors.value = nextErrors;
            details.value = {...details.value, index: state.detail};
          } else if (state is QuranDetailError) {
            final nextDetails = {...details.value}..remove(index);
            details.value = nextDetails;
            errors.value = {...errors.value, index: state.message};
          }
        },
        child: PageView.builder(
          controller: pageController,
          reverse: true,
          allowImplicitScrolling: true,
          itemCount: itemCount,
          onPageChanged: (index) {
            setSelectedIndex(index);
            requestCurrentThenNearby(index);
          },
          itemBuilder: (context, index) => pageAt(index),
        ),
      ),
    );
  }
}

Widget _settingDialogContent(
  BuildContext context, {
  required double initialValue,
  required ValueChanged<double> onChanged,
}) {
  final textTheme = Theme.of(context).textTheme;
  var value = initialValue;

  return StatefulBuilder(
    builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Ukuran Teks',
                    style: textTheme.titleSmall?.copyWith(
                      color: ColorPalette.contentSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    AppIcons.closeLine,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: ColorPalette.surfaceTertiary,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Text(
                    'A',
                    style: textTheme.titleSmall?.copyWith(
                      color: ColorPalette.contentSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: ColorPalette.primaryColor,
                        inactiveTrackColor: ColorPalette.contentTertiary,
                        trackHeight: 4,
                        thumbColor: ColorPalette.primaryColor,
                        overlayColor: ColorPalette.primaryColor.withValues(
                          alpha: 0.12,
                        ),
                      ),
                      child: Slider(
                        divisions: 2,
                        min: -1,
                        value: value.clamp(-1, 1).toDouble(),
                        onChanged: (nextValue) {
                          setState(() => value = nextValue);
                          onChanged(nextValue);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'A',
                    style: textTheme.displaySmall?.copyWith(
                      color: ColorPalette.contentSecondary,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

List<SurahModel> _surahsFromArgs(QuranDetailArgs? args) {
  if (args == null) return const [];
  if (args.allSurahs.isNotEmpty) return args.allSurahs;
  return args.surah == null ? const [] : [args.surah!];
}

List<JuzModel> _juzListFromArgs(QuranDetailArgs? args) {
  if (args == null) return const [];
  if (args.allJuz.isNotEmpty) return args.allJuz;
  return args.juz == null ? const [] : [args.juz!];
}

int? _verseNumberFromVerseKey(String? verseKey) {
  if (verseKey == null) return null;
  final parts = verseKey.split(':');
  if (parts.length < 2) return null;
  return int.tryParse(parts[1]);
}

int? _verseNumberFromJuz(JuzModel? juz) {
  if (juz == null) return null;
  return int.tryParse(juz.verseStartNumber);
}

Widget _detailScaffold(
  BuildContext context, {
  required Widget child,
  VoidCallback? onSettingTap,
  VoidCallback? onQuranSelectTap,
  Widget? tabBar,
}) {
  return Scaffold(
    backgroundColor: const Color(0xFFF3F3F3),
    appBar: _detailAppBar(
      context,
      onSettingTap: onSettingTap,
      onQuranSelectTap: onQuranSelectTap,
    ),
    body: Column(
      children: [
        ?tabBar,
        Expanded(child: child),
      ],
    ),
  );
}

PreferredSizeWidget _detailAppBar(
  BuildContext context, {
  VoidCallback? onSettingTap,
  VoidCallback? onQuranSelectTap,
}) {
  final textTheme = Theme.of(context).textTheme;

  return AppBar(
    toolbarHeight: 50,
    automaticallyImplyLeading: false,
    backgroundColor: ColorPalette.kWhite,
    elevation: 0,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    titleSpacing: 16,
    title: GestureDetector(
      onTap: () => context.pop(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
    actions: [
      GestureDetector(
        onTap: onQuranSelectTap,
        child: SvgPicture.asset(
          AppIcons.arrowGoForwardLine,
          width: 24,
          height: 24,
        ),
      ),
      const SizedBox(width: 16),
      GestureDetector(
        onTap: onSettingTap,
        child: SvgPicture.asset(
          AppIcons.settings4Line,
          width: 24,
          height: 24,
        ),
      ),
      const SizedBox(width: 16),
    ],
  );
}

Widget _scrollableTabBar(
  BuildContext context, {
  required ScrollController controller,
  required int selectedIndex,
  required List<String> labels,
  required ValueChanged<int> onTap,
}) {
  return ColoredBox(
    color: ColorPalette.kWhite,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            textDirection: TextDirection.rtl,
            children: List.generate(
              labels.length,
              (index) => _tabItem(
                context,
                label: labels[index],
                isActive: index == selectedIndex,
                onTap: () => onTap(index),
              ),
            ),
          ),
        ),
        Container(
          height: 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorPalette.kBlack.withValues(alpha: 0.14),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _tabItem(
  BuildContext context, {
  required String label,
  required bool isActive,
  required VoidCallback onTap,
}) {
  final textTheme = Theme.of(context).textTheme;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: context.mediaQuerySize.width * 0.34,
      decoration: BoxDecoration(
        color: ColorPalette.kWhite,
        border: Border(
          bottom: BorderSide(
            color: isActive ? ColorPalette.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
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
          const SizedBox(height: 16),
        ],
      ),
    ),
  );
}

Widget _surahContent(
  BuildContext context,
  QuranDetailModel detail,
  double textSizeSetting, {
  QuranDetailArgs? detailArgs,
  int? initialVerseNumber,
  String? initialVerseKey,
}) {
  final targetIndex = initialVerseKey == null
      ? initialVerseNumber == null
            ? -1
            : detail.verses.indexWhere(
                (v) => v.verseNumber == initialVerseNumber,
              )
      : detail.verses.indexWhere((v) => v.verseKey == initialVerseKey);
  bool isHighlighted(QuranVerseModel verse) {
    return initialVerseKey == null
        ? verse.verseNumber == initialVerseNumber
        : verse.verseKey == initialVerseKey;
  }

  if (targetIndex < 1) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _surahBanner(context, detail: detail)),
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
              final verse = detail.verses[index];
              return _verseRow(
                context,
                verse,
                textSizeSetting,
                detailArgs: detailArgs,
                isHighlighted: isHighlighted(verse),
              );
            },
          ),
        ),
      ],
    );
  }

  final centerKey = ValueKey('verse-$initialVerseNumber');
  return CustomScrollView(
    center: centerKey,
    slivers: [
      SliverList(
        delegate: SliverChildListDelegate.fixed([
          _surahBanner(context, detail: detail),
          ...detail.verses
              .take(targetIndex)
              .map(
                (verse) => Column(
                  children: [
                    _verseRow(
                      context,
                      verse,
                      textSizeSetting,
                      detailArgs: detailArgs,
                      isHighlighted: isHighlighted(verse),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: ColorPalette.borderTransparent,
                    ),
                  ],
                ),
              ),
        ]),
      ),
      SliverPadding(
        key: centerKey,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
        sliver: SliverList.separated(
          itemCount: detail.verses.length - targetIndex,
          separatorBuilder: (_, _) => const Divider(
            height: 1,
            thickness: 1,
            color: ColorPalette.borderTransparent,
          ),
          itemBuilder: (context, index) {
            final verse = detail.verses[targetIndex + index];
            return _verseRow(
              context,
              verse,
              textSizeSetting,
              detailArgs: detailArgs,
              isHighlighted: isHighlighted(verse),
            );
          },
        ),
      ),
    ],
  );
}

Widget _juzContent(
  BuildContext context,
  QuranDetailModel detail,
  double textSizeSetting, {
  QuranDetailArgs? detailArgs,
  String? initialVerseKey,
}) {
  final groups = _groupBySurah(detail.verses);

  return ListView.builder(
    padding: const EdgeInsets.only(bottom: 24),
    itemCount: groups.length,
    itemBuilder: (context, gi) {
      final group = groups[gi];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _surahBannerInJuz(
            context,
            surahName: group.surahName,
            surahNameAr: group.surahNameAr,
          ),
          ...group.verses.asMap().entries.map((e) {
            final isLast = e.key == group.verses.length - 1;
            return Column(
              children: [
                _verseRow(
                  context,
                  e.value,
                  textSizeSetting,
                  detailArgs: detailArgs,
                  isHighlighted: e.value.verseKey == initialVerseKey,
                ),
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

List<_SurahGroup> _groupBySurah(List<QuranVerseModel> verses) {
  final groups = <_SurahGroup>[];
  for (final v in verses) {
    if (groups.isEmpty || groups.last.surahIndex != v.surahIndex) {
      groups.add(
        (
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

Widget _surahBanner(
  BuildContext context, {
  required QuranDetailModel detail,
}) {
  final textTheme = Theme.of(context).textTheme;

  return Container(
    color: ColorPalette.kWhite,
    padding: const EdgeInsets.all(16),
    child: SizedBox(
      height: 49,
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
                    _cleanQuranText(detail.titleAr!),
                    style: textTheme.titleMedium?.copyWith(
                      fontFamily: 'Markazi Text',
                      color: ColorPalette.arabicText,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                else
                  Text(
                    _cleanQuranText(detail.title),
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
    ),
  );
}

Widget _surahBannerInJuz(
  BuildContext context, {
  required String surahName,
  required String surahNameAr,
}) {
  final textTheme = Theme.of(context).textTheme;

  return Container(
    color: ColorPalette.kWhite,
    padding: const EdgeInsets.all(16),
    child: SizedBox(
      height: 49,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/motif-header.png',
          ),
          Center(
            child: Text(
              _cleanQuranText(
                surahNameAr.trim().isNotEmpty ? surahNameAr : surahName,
              ),
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
    ),
  );
}

Widget _verseRow(
  BuildContext context,
  QuranVerseModel verse,
  double textSizeSetting, {
  QuranDetailArgs? detailArgs,
  bool isHighlighted = false,
}) {
  final textTheme = Theme.of(context).textTheme;

  return Material(
    color: ColorPalette.kWhite,
    child: InkWell(
      onTap: () => _openVerseDialog(context, verse, detailArgs),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<LastReadCubit, LastReadState>(
                  builder: (context, state) {
                    final isLastRead =
                        state is LastReadLoaded &&
                        state.lastRead?.verse.verseKey == verse.verseKey;
                    return _verseNumberBadge(
                      context,
                      verse.verseNumber,
                      isSelected: isHighlighted || isLastRead,
                    );
                  },
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: verse.arabic,
                          style: GoogleFonts.harmattan(
                            color: ColorPalette.kBlack,
                            fontSize: _arabicTextSize(textSizeSetting),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: _arabicVerseNumber(
                              context,
                              verse.verseNumber,
                              _arabicVerseNumberSize(textSizeSetting),
                            ),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: textTheme.displaySmall?.copyWith(
                      fontFamily: 'Markazi Text',
                      color: ColorPalette.kBlack,
                      fontSize: _arabicTextSize(textSizeSetting),
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
                _cleanQuranText(verse.transliteration),
                textAlign: TextAlign.justify,
                style: textTheme.titleMedium?.copyWith(
                  color: ColorPalette.primaryColor,
                  fontSize: _latinTextSize(textSizeSetting),
                  fontFamily: 'Synonym Variable',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
            if (verse.translation.trim().isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                _cleanQuranText(verse.translation),
                textAlign: TextAlign.justify,
                style: textTheme.bodyLarge?.copyWith(
                  color: ColorPalette.kBlack,
                  fontSize: _latinTextSize(textSizeSetting),
                  fontFamily: 'Synonym Variable',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}

void _openVerseDialog(
  BuildContext context,
  QuranVerseModel verse,
  QuranDetailArgs? detailArgs,
) {
  unawaited(
    showCustomDialog<void>(
      context: context,
      dialog: CustomDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 8),
        borderRadius: 8,
        content: _verseDialogContent(
          context,
          verse,
          onShare: () => unawaited(_shareQuranVerse(context, verse)),
          onCopy: () => unawaited(_copyQuranVerse(context, verse)),
          onBookmark: () =>
              unawaited(_saveLastRead(context, verse, detailArgs)),
        ),
      ),
    ),
  );
}

Widget _verseDialogContent(
  BuildContext context,
  QuranVerseModel verse, {
  VoidCallback? onShare,
  VoidCallback? onCopy,
  VoidCallback? onBookmark,
}) {
  final textTheme = Theme.of(context).textTheme;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _quranVerseTitle(verse),
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(
            color: ColorPalette.kBlack,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),
        _verseDialogOption(
          context,
          icon: AppIcons.shareLine,
          label: 'Bagikan Ayat',
          onTap: onShare,
        ),
        _verseDialogOption(
          context,
          icon: AppIcons.fileCopyLine,
          label: 'Salin Ayat',
          onTap: onCopy,
        ),
        _verseDialogOption(
          context,
          icon: AppIcons.flag2Line,
          label: 'Tandai terakhir baca',
          onTap: onBookmark,
        ),
      ],
    ),
  );
}

Widget _verseDialogOption(
  BuildContext context, {
  required String icon,
  required String label,
  VoidCallback? onTap,
}) {
  final textTheme = Theme.of(context).textTheme;

  return InkWell(
    hoverColor: ColorPalette.surfaceTertiary,
    highlightColor: ColorPalette.surfaceTertiary,
    splashColor: ColorPalette.surfaceTertiary,
    onTap: () {
      Navigator.of(context).pop();
      onTap?.call();
    },
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              ColorPalette.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: textTheme.titleMedium?.copyWith(
                color: ColorPalette.contentSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> _saveLastRead(
  BuildContext context,
  QuranVerseModel verse,
  QuranDetailArgs? detailArgs,
) async {
  final lastRead = QuranLastReadModel(
    verse: verse,
    type: detailArgs?.type ?? QuranDetailType.surah,
    juzIndex: detailArgs?.juz?.index,
  );
  await context.read<LastReadCubit>().save(lastRead);
  if (!context.mounted) return;

  _showQuranSnackBar(
    context,
    '${_quranVerseTitle(verse)} ditandai sebagai terakhir baca',
  );
}

Future<void> _copyQuranVerse(
  BuildContext context,
  QuranVerseModel verse,
) async {
  await Clipboard.setData(ClipboardData(text: _quranVerseText(verse)));
  if (!context.mounted) return;

  _showQuranSnackBar(
    context,
    '${_quranVerseTitle(verse)} berhasil disalin',
  );
}

Future<void> _shareQuranVerse(
  BuildContext context,
  QuranVerseModel verse,
) async {
  try {
    final bytes = await _quranVerseImageBytes(context, verse);
    await _shareChannel.invokeMethod<void>('shareImage', {
      'fileName': 'quran-${verse.verseKey.replaceAll(':', '-')}.png',
      'bytes': bytes,
      'text': _quranVerseText(verse),
    });
    if (!context.mounted) return;
    _showQuranSnackBar(
      context,
      '${_quranVerseTitle(verse)} berhasil dibagikan',
    );
  } on Object {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSnackBar.failure(message: 'Gagal membagikan ayat'),
    );
  }
}

void _showQuranSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      CustomSnackBar.quran(
        message: message,
        margin: const EdgeInsets.fromLTRB(6, 0, 6, 24),
      ),
    );
}

String _quranVerseTitle(QuranVerseModel verse) {
  return 'QS ${_cleanQuranText(verse.surahName)} ${verse.surahIndex} '
      ': Ayat ${verse.verseNumber}';
}

String _quranVerseText(QuranVerseModel verse) {
  final lines = <String>[
    _quranVerseTitle(verse),
    '',
    '${verse.arabic} ${toArabicNumber(verse.verseNumber)}',
  ];

  if (verse.transliteration.trim().isNotEmpty) {
    lines
      ..add('')
      ..add(_cleanQuranText(verse.transliteration.trim()));
  }

  if (verse.translation.trim().isNotEmpty) {
    lines
      ..add('')
      ..add(_cleanQuranText(verse.translation.trim()));
  }

  return lines.join('\n');
}

Future<Uint8List> _quranVerseImageBytes(
  BuildContext context,
  QuranVerseModel verse,
) async {
  final boundaryKey = GlobalKey();
  final overlay = OverlayEntry(
    builder: (context) => Positioned(
      left: -10000,
      top: 0,
      child: Material(
        color: Colors.transparent,
        child: RepaintBoundary(
          key: boundaryKey,
          child: _quranShareCard(context, verse),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlay);
  try {
    await WidgetsBinding.instance.endOfFrame;
    await WidgetsBinding.instance.endOfFrame;
    final boundary =
        boundaryKey.currentContext?.findRenderObject()
            as RenderRepaintBoundary?;
    final image = await boundary!.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    return byteData!.buffer.asUint8List();
  } finally {
    overlay.remove();
  }
}

Widget _quranShareCard(BuildContext context, QuranVerseModel verse) {
  final textTheme = Theme.of(context).textTheme;

  return Container(
    width: 360,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      color: ColorPalette.kWhite,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: ColorPalette.borderTransparent),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 0,
          left: -14,
          child: Image.asset(
            'assets/images/motif-share.png',
            width: 300,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _quranVerseTitle(verse),
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(
                  color: ColorPalette.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: verse.arabic),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: _arabicVerseNumber(
                                context,
                                verse.verseNumber,
                                28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.harmattan(
                        color: ColorPalette.kBlack,
                        fontSize: 32,
                        height: 1.4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              if (verse.transliteration.trim().isNotEmpty) ...[
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    _cleanQuranText(verse.transliteration.trim()),
                    textAlign: TextAlign.justify,
                    style: textTheme.titleMedium?.copyWith(
                      color: ColorPalette.primaryColor,
                      fontSize: 16,
                      fontFamily: 'Synonym Variable',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
              if (verse.translation.trim().isNotEmpty) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    _cleanQuranText(verse.translation.trim()),
                    textAlign: TextAlign.justify,
                    style: textTheme.bodyLarge?.copyWith(
                      color: ColorPalette.kBlack,
                      fontSize: 16,
                      fontFamily: 'Synonym Variable',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _arabicVerseNumber(BuildContext context, int number, double size) {
  final textTheme = Theme.of(context).textTheme;

  return SizedBox.square(
    dimension: size,
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

Widget _verseNumberBadge(
  BuildContext context,
  int number, {
  bool isSelected = false,
}) {
  final textTheme = Theme.of(context).textTheme;

  return SizedBox.square(
    dimension: 36,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          isSelected
              ? AppIcons.motifBorderSelected
              : AppIcons.motifBorderUnselected,
          width: 36,
          height: 36,
        ),
        Text(
          '$number',
          style: textTheme.labelSmall?.copyWith(
            color: isSelected ? ColorPalette.kWhite : ColorPalette.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

Widget _errorState(BuildContext context, String message) {
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
