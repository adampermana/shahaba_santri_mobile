import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/dialog_setting_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

typedef _SurahGroup = ({
  String surahIndex,
  String surahName,
  String surahNameAr,
  List<QuranVerseModel> verses,
});

class DetailQuranScreen extends HookWidget {
  const DetailQuranScreen({super.key, this.args});

  final QuranDetailArgs? args;

  @override
  Widget build(BuildContext context) {
    final surahs = _surahsFromArgs(args);
    final juzList = _juzListFromArgs(args);
    final isSurah = args?.type == QuranDetailType.surah;
    final itemCount = isSurah ? surahs.length : juzList.length;

    int initialIndex() {
      if (args == null) return 0;

      if (args!.type == QuranDetailType.surah) {
        final index = surahs.indexWhere((s) => s.index == args!.surah?.index);
        return index < 0 ? 0 : index;
      }

      final index = juzList.indexWhere((j) => j.index == args!.juz?.index);
      return index < 0 ? 0 : index;
    }

    QuranDetailArgs? argsAt(int index) {
      if (args == null || index < 0 || index >= itemCount) return null;

      if (args!.type == QuranDetailType.surah) {
        return QuranDetailArgs.surah(
          surahs[index],
          allSurahs: surahs,
          initialVerseNumber: surahs[index].index == args!.surah?.index
              ? args!.initialVerseNumber
              : null,
        );
      }

      return QuranDetailArgs.juz(
        juzList[index],
        allJuz: juzList,
      );
    }

    int indexForArgs(QuranDetailArgs? value) {
      if (value == null || value.type != args?.type) return -1;

      if (value.type == QuranDetailType.surah) {
        return surahs.indexWhere((s) => s.index == value.surah?.index);
      }

      return juzList.indexWhere((j) => j.index == value.juz?.index);
    }

    final selectedIndex = useState(initialIndex());
    final details = useState(<int, QuranDetailModel>{});
    final errors = useState(<int, String>{});
    final requestedIndexes = useState(<int>{});
    final textSizeSetting = useState(QuranTextSizeSetting.initial);
    final pageController = usePageController(initialPage: selectedIndex.value);
    final tabScrollController = useScrollController();

    void openSettingDialog() {
      unawaited(
        showDialog<void>(
          context: context,
          builder: (_) => DialogSettingWidget(
            initialSetting: textSizeSetting.value,
            onChanged: (setting) => textSizeSetting.value = setting,
          ),
        ),
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
      if (detail != null) {
        return detail.type == QuranDetailType.juz
            ? _juzContent(context, detail, textSizeSetting.value)
            : _surahContent(
                context,
                detail,
                textSizeSetting.value,
                initialVerseNumber: argsAt(index)?.initialVerseNumber,
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
      [args],
    );

    final safeSelectedIndex = selectedIndex.value >= itemCount
        ? initialIndex()
        : selectedIndex.value;
    final selectedArgs = argsAt(safeSelectedIndex);

    if (args == null || selectedArgs == null || itemCount == 0) {
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
        ? surahs.map((s) => s.title ?? '').toList()
        : juzList.map((j) => 'Juz ${j.index}').toList();

    return _detailScaffold(
      context,
      onSettingTap: openSettingDialog,
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

Widget _detailScaffold(
  BuildContext context, {
  required Widget child,
  VoidCallback? onSettingTap,
  Widget? tabBar,
}) {
  return Scaffold(
    backgroundColor: const Color(0xFFF3F3F3),
    appBar: _detailAppBar(context, onSettingTap: onSettingTap),
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
      SvgPicture.asset(
        AppIcons.arrowGoForwardLine,
        width: 24,
        height: 24,
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
  return Container(
    decoration: const BoxDecoration(
      color: ColorPalette.kWhite,
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
  QuranTextSizeSetting textSizeSetting, {
  int? initialVerseNumber,
}) {
  final targetIndex = initialVerseNumber == null
      ? -1
      : detail.verses.indexWhere((v) => v.verseNumber == initialVerseNumber);
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
            itemBuilder: (context, index) => _verseRow(
              context,
              detail.verses[index],
              textSizeSetting,
            ),
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
                    _verseRow(context, verse, textSizeSetting),
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
          itemBuilder: (context, index) => _verseRow(
            context,
            detail.verses[targetIndex + index],
            textSizeSetting,
          ),
        ),
      ),
    ],
  );
}

Widget _juzContent(
  BuildContext context,
  QuranDetailModel detail,
  QuranTextSizeSetting textSizeSetting,
) {
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
                _verseRow(context, e.value, textSizeSetting),
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

Widget _surahBannerInJuz(
  BuildContext context, {
  required String surahName,
  required String surahNameAr,
}) {
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

Widget _verseRow(
  BuildContext context,
  QuranVerseModel verse,
  QuranTextSizeSetting textSizeSetting,
) {
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
            _verseNumberBadge(context, verse.verseNumber),
            const SizedBox(width: 12),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: verse.arabic,
                      style: TextStyle(
                        color: ColorPalette.kBlack,
                        fontSize: textSizeSetting.arabic,
                        fontFamily: 'Markazi Text',
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
                          textSizeSetting.arabicVerseNumber,
                        ),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: textTheme.displaySmall?.copyWith(
                  fontFamily: 'Markazi Text',
                  color: ColorPalette.kBlack,
                  fontSize: textSizeSetting.arabic,
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
              fontSize: textSizeSetting.latin,
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
              fontSize: textSizeSetting.translation,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
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

Widget _verseNumberBadge(BuildContext context, int number) {
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
