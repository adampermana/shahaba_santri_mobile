import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/search_quran_screen.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/juz_card.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/quran_search_bar.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/quran_tab_bar.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/surah_card.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _QuranView();
  }
}

class _QuranView extends StatefulWidget {
  const _QuranView();

  @override
  State<_QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<_QuranView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    final initialTab = context.read<QuranBloc>().state.currentTab;
    _pageController = PageController(initialPage: initialTab);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: _buildAppBar(context),
      body: BlocListener<QuranBloc, QuranState>(
        listenWhen: (prev, curr) => prev.currentTab != curr.currentTab,
        listener: (context, state) {
          if (_pageController.hasClients &&
              _pageController.page?.round() != state.currentTab) {
            unawaited(
              _pageController.animateToPage(
                state.currentTab,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
            );
          }
        },
        child: Column(
          children: [
            BlocBuilder<QuranBloc, QuranState>(
              buildWhen: (prev, curr) => prev.currentTab != curr.currentTab,
              builder: (context, state) {
                return QuranTabBar(
                  currentIndex: state.currentTab,
                  onTabChanged: (index) {
                    context.read<QuranBloc>().add(QuranEvent.changeTab(index));
                  },
                );
              },
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<QuranBloc>().add(QuranEvent.changeTab(index));
                },
                children: [
                  BlocBuilder<QuranBloc, QuranState>(
                    buildWhen: (prev, curr) =>
                        prev.surahsLoading != curr.surahsLoading ||
                        prev.surahsError != curr.surahsError ||
                        prev.surahs != curr.surahs,
                    builder: (context, state) => _SurahList(state: state),
                  ),
                  BlocBuilder<QuranBloc, QuranState>(
                    buildWhen: (prev, curr) =>
                        prev.juzLoading != curr.juzLoading ||
                        prev.juzError != curr.juzError ||
                        prev.juzList != curr.juzList,
                    builder: (context, state) => _JuzList(state: state),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return PreferredSize(
      preferredSize: Size.fromHeight(topPadding + 44),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: QuranSearchBar(
                  readOnly: true,
                  onTap: () => _openSearch(context),
                ),
              ),
              const SizedBox(width: 12),
              _BookmarkButton(
                onTap: () => _openBookmark(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openSearch(BuildContext context) {
    final state = context.read<QuranBloc>().state;

    unawaited(
      context.push(
        '${RouterPath.mainPath}/${RouterPath.quranPath}/'
        '${RouterPath.searchQuranPath}',
        extra: SearchQuranArgs(
          surahs: state.surahs,
          juzList: state.juzList,
        ),
      ),
    );
  }

  void _openBookmark(BuildContext context) {
    unawaited(
      context.push(
        '${RouterPath.mainPath}/${RouterPath.quranPath}/'
        '${RouterPath.historyCollectionPath}',
      ),
    );
  }
}

class _BookmarkButton extends StatelessWidget {
  const _BookmarkButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0x1FFFFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0x29E8E8E8),
              width: 0.9,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppIcons.bookmarkLine,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SurahList extends StatelessWidget {
  const _SurahList({required this.state});

  final QuranState state;

  @override
  Widget build(BuildContext context) {
    if (state.surahsLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.surahsError.isNotEmpty) {
      return Center(child: Text(state.surahsError));
    }

    final surahs = state.surahs;

    if (surahs.isEmpty) {
      return const Center(child: Text('Tidak ada surah ditemukan'));
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: surahs.length,
      separatorBuilder: (_, _) => const Divider(
        height: 1,
        thickness: 1,
        color: Color(0x29E8E8E8),
      ),
      itemBuilder: (context, index) {
        final surah = surahs[index];
        return SurahCard(
          surah: surah,
          onTap: () => unawaited(
            context.push(
              '${RouterPath.mainPath}/${RouterPath.quranPath}/'
              '${RouterPath.detailQuranPath}',
              extra: QuranDetailArgs.surah(
                surah,
                allSurahs: state.surahs,
                allJuz: state.juzList,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _JuzList extends StatelessWidget {
  const _JuzList({required this.state});

  final QuranState state;

  @override
  Widget build(BuildContext context) {
    if (state.juzLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.juzError.isNotEmpty) {
      return Center(child: Text(state.juzError));
    }

    final juzList = state.juzList;

    if (juzList.isEmpty) {
      return const Center(child: Text('Tidak ada juz ditemukan'));
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: juzList.length,
      separatorBuilder: (_, _) => const Divider(
        height: 1,
        thickness: 1,
        color: Color(0x29E8E8E8),
      ),
      itemBuilder: (context, index) {
        final juz = juzList[index];
        return JuzCard(
          juz: juz,
          onTap: () => unawaited(
            context.push(
              '${RouterPath.mainPath}/${RouterPath.quranPath}/'
              '${RouterPath.detailQuranPath}',
              extra: QuranDetailArgs.juz(
                juz,
                allSurahs: state.surahs,
                allJuz: state.juzList,
              ),
            ),
          ),
        );
      },
    );
  }
}
