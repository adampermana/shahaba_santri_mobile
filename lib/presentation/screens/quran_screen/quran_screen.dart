import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
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
    return AppBar(
      toolbarHeight: 88,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: SizedBox.shrink(),
      ),
      surfaceTintColor: Colors.transparent,
      titleSpacing: 16,
      title: QuranSearchBar(
        readOnly: true,
        onTap: () => _openSearch(context),
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
        color: Color(0x33E8E8E8),
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
        color: Color(0x33E8E8E8),
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
