import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/quran_bloc/quran_bloc.dart';
import 'package:sahaba_mobile/domains/quran/quran_detail_model.dart';
import 'package:sahaba_mobile/domains/quran/surah_model.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';

class QuranBookmarkItem {
  const QuranBookmarkItem({
    required this.surahId,
    required this.verseNumber,
    required this.title,
    required this.snippet,
  });

  final int surahId;
  final int verseNumber;
  final String title;
  final String snippet;
}

class QuranNoteItem {
  const QuranNoteItem({
    required this.surahId,
    required this.verseNumber,
    required this.title,
    required this.note,
  });

  final int surahId;
  final int verseNumber;
  final String title;
  final String note;
}

class HistoryCollectionScreen extends StatefulWidget {
  const HistoryCollectionScreen({
    super.key,
    this.initialTabIndex = 0,
    this.bookmarks = defaultBookmarks,
    this.notes = defaultNotes,
  });

  final int initialTabIndex;
  final List<QuranBookmarkItem> bookmarks;
  final List<QuranNoteItem> notes;

  static const defaultBookmarks = [
    QuranBookmarkItem(
      surahId: 3,
      verseNumber: 2,
      title: 'Al - Imran Ayat 2',
      snippet:
          'Allah, tidak ada tuhan selain Dia, Yang Mahahidup lagi Maha '
          'Mengurus (makhluk-Nya) secara terus-menerus.',
    ),
    QuranBookmarkItem(
      surahId: 4,
      verseNumber: 5,
      title: 'An-Nisa Ayat 5',
      snippet:
          'Janganlah kamu serahkan kepada orang-orang yang belum sempurna '
          'akalnya harta (mereka yang ada dalam kekuasaan)-mu yang Allah '
          'jadikan sebagai pokok kehidupanmu. Berilah mereka belanja dan '
          'pakaian dari (hasil harta) itu dan ucapkanlah kepada mereka '
          'perkataan yang baik.',
    ),
    QuranBookmarkItem(
      surahId: 4,
      verseNumber: 6,
      title: 'An-Nisa',
      snippet:
          'Ujilah anak-anak yatim itu (dalam hal mengatur harta) sampai ketika '
          'mereka cukup umur untuk menikah. Lalu, jika menurut penilaianmu '
          'mereka telah pandai (mengatur harta), serahkanlah kepada mereka '
          'hartanya...',
    ),
  ];

  static const defaultNotes = [
    QuranNoteItem(
      surahId: 3,
      verseNumber: 2,
      title: 'Al - Imran Ayat 2',
      note:
          'Membahas keesaan Allah SWT serta penegasan bahwa hanya Dialah '
          'Tuhan yang berhak disembah.',
    ),
    QuranNoteItem(
      surahId: 4,
      verseNumber: 5,
      title: 'An-Nisa Ayat 5',
      note: 'DIbaca saat solat',
    ),
  ];

  @override
  State<HistoryCollectionScreen> createState() =>
      _HistoryCollectionScreenState();
}

class _HistoryCollectionScreenState extends State<HistoryCollectionScreen> {
  late int _currentTab;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentTab = widget.initialTabIndex;
    _pageController = PageController(initialPage: _currentTab);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    if (_currentTab == index) return;
    setState(() => _currentTab = index);
    if (_pageController.hasClients) {
      unawaited(
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _CollectionTabBar(
            currentIndex: _currentTab,
            onTabChanged: _onTabChanged,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                if (_currentTab != index) {
                  setState(() => _currentTab = index);
                }
              },
              children: [
                _BookmarkTabView(
                  bookmarks: widget.bookmarks,
                  onItemTap: (item) => _navigateToVerse(
                    context,
                    item.surahId,
                    item.verseNumber,
                  ),
                ),
                _CatatanTabView(
                  notes: widget.notes,
                  onItemTap: (item) => _navigateToVerse(
                    context,
                    item.surahId,
                    item.verseNumber,
                  ),
                ),
              ],
            ),
          ),
        ],
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).maybePop(),
                child: SvgPicture.asset(
                  AppIcons.arrowLeftLine,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Koleksi Saya',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToVerse(BuildContext context, int surahId, int verseNumber) {
    final quranState = context.read<QuranBloc>().state;
    final allSurahs = quranState.surahs;
    final allJuz = quranState.juzList;
    final surah = allSurahs.firstWhere(
      (s) => int.tryParse(s.index ?? '') == surahId,
      orElse: () => SurahModel(index: surahId.toString()),
    );

    unawaited(
      context.push(
        '${RouterPath.mainPath}/${RouterPath.quranPath}/'
        '${RouterPath.detailQuranPath}',
        extra: QuranDetailArgs.surah(
          surah,
          allSurahs: allSurahs,
          allJuz: allJuz,
          initialVerseNumber: verseNumber,
        ),
      ),
    );
  }
}

class _CollectionTabBar extends StatelessWidget {
  const _CollectionTabBar({
    required this.currentIndex,
    required this.onTabChanged,
  });

  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  static const _tabs = ['Bookmark', 'Catatan'];
  static const _activeColor = Color(0xFF007D56);
  static const _inactiveColor = Color(0xFFA6A6A6);
  static const _borderColor = Color(0x33E8E8E8);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _borderColor,
          ),
        ),
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final isActive = index == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: isActive
                      ? const Border(
                          bottom: BorderSide(
                            color: _activeColor,
                            width: 2,
                          ),
                        )
                      : null,
                ),
                child: Center(
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 14,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                      color: isActive ? _activeColor : _inactiveColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _BookmarkTabView extends StatelessWidget {
  const _BookmarkTabView({
    required this.bookmarks,
    required this.onItemTap,
  });

  final List<QuranBookmarkItem> bookmarks;
  final ValueChanged<QuranBookmarkItem> onItemTap;

  @override
  Widget build(BuildContext context) {
    if (bookmarks.isEmpty) {
      return const Center(
        child: Text(
          'Belum ada bookmark tersimpan',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 14,
            color: Color(0xFFA6A6A6),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: bookmarks.length,
      separatorBuilder: (_, _) => const Divider(
        height: 1,
        thickness: 1,
        color: Color(0x29E8E8E8),
      ),
      itemBuilder: (context, index) {
        final item = bookmarks[index];
        return _BookmarkCard(
          item: item,
          onTap: () => onItemTap(item),
        );
      },
    );
  }
}

class _BookmarkCard extends StatelessWidget {
  const _BookmarkCard({
    required this.item,
    this.onTap,
  });

  final QuranBookmarkItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 72),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 44,
                  child: Text(
                    '${item.surahId}',
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF00C6BF),
                      letterSpacing: 0.60,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.snippet,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFA6A6A6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                SvgPicture.asset(
                  AppIcons.arrowRightLine,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CatatanTabView extends StatelessWidget {
  const _CatatanTabView({
    required this.notes,
    required this.onItemTap,
  });

  final List<QuranNoteItem> notes;
  final ValueChanged<QuranNoteItem> onItemTap;

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return const Center(
        child: Text(
          'Belum ada catatan tersimpan',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 14,
            color: Color(0xFFA6A6A6),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: notes.length,
      separatorBuilder: (_, _) => const Divider(
        height: 1,
        thickness: 1,
        color: Color(0x29E8E8E8),
      ),
      itemBuilder: (context, index) {
        final item = notes[index];
        return _CatatanCard(
          item: item,
          onTap: () => onItemTap(item),
        );
      },
    );
  }
}

class _CatatanCard extends StatelessWidget {
  const _CatatanCard({
    required this.item,
    this.onTap,
  });

  final QuranNoteItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 72),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 44,
                  child: Center(
                    child: SvgPicture.asset(
                      AppIcons.pencilLine,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFA6A6A6),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.note,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFA6A6A6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                SvgPicture.asset(
                  AppIcons.arrowRightLine,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
