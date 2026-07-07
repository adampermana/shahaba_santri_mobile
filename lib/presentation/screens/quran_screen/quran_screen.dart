import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/juz_card.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/quran_search_bar.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/quran_tab_bar.dart';
import 'package:sahaba_mobile/presentation/screens/quran_screen/widgets/surah_card.dart';

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
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: QuranSearchBar(
                controller: _searchController,
                onChanged: (keyword) {
                  context.read<QuranBloc>().add(QuranEvent.search(keyword));
                },
              ),
            ),
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
              child: BlocBuilder<QuranBloc, QuranState>(
                builder: (context, state) {
                  if (state.currentTab == 0) {
                    return _SurahList(state: state);
                  }
                  return _JuzList(state: state);
                },
              ),
            ),
          ],
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

    final surahs = state.filteredSurahs;

    if (surahs.isEmpty) {
      return const Center(child: Text('Tidak ada surat ditemukan'));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: surahs.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final surah = surahs[index];
        return SurahCard(
          surah: surah,
          onTap: () => context.push(
            '${RouterPath.mainPath}/${RouterPath.quranPath}/'
            '${RouterPath.detailQuranPath}',
            extra: QuranDetailArgs.surah(
              surah,
              allSurahs: state.surahs,
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

    final juzList = state.filteredJuz;

    if (juzList.isEmpty) {
      return const Center(child: Text('Tidak ada juz ditemukan'));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: juzList.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final juz = juzList[index];
        return JuzCard(
          juz: juz,
          onTap: () => context.push(
            '${RouterPath.mainPath}/${RouterPath.quranPath}/'
            '${RouterPath.detailQuranPath}',
            extra: QuranDetailArgs.juz(
              juz,
              allJuz: state.juzList,
            ),
          ),
        );
      },
    );
  }
}
