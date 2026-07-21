import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';

// --- Temporary data models ---

enum _ChatState { empty, loading, answered }

class _SourceItem {
  const _SourceItem({required this.title, required this.excerpt});

  final String title;
  final String excerpt;
}

class _ChatMessage {
  const _ChatMessage({
    required this.id,
    required this.isUser,
    this.query,
    this.content,
    this.sources,
    this.followUpChips,
  });

  final String id;
  final bool isUser;
  final String? query;
  final String? content;
  final List<_SourceItem>? sources;
  final List<String>? followUpChips;
}

// --- Screen ---

class SahabaAiScreen extends StatefulWidget {
  const SahabaAiScreen({super.key});

  @override
  State<SahabaAiScreen> createState() => _SahabaAiScreenState();
}

class _SahabaAiScreenState extends State<SahabaAiScreen> {
  _ChatState _chatState = _ChatState.empty;
  _ChatMessage? _currentMessage;
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSend(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _chatState = _ChatState.loading;
      _currentMessage = _ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        isUser: true,
        query: text.trim(),
      );
    });
    _textController.clear();

    // Simulate AI response after 2s
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _chatState = _ChatState.answered;
        _currentMessage = _ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          isUser: false,
          query: text.trim(),
          content:
              "Wa'alaikumussalam warahmatullahi wabarakatuh.\n\n"
              'Tahajud adalah sholat sunnah yang dikerjakan pada malam hari '
              'setelah tidur, meskipun hanya sebentar. Rasulullah ﷺ bersabda:\n\n'
              '> "Sebaik-baik puasa setelah Ramadhan adalah puasa di bulan '
              'Muharram, dan sebaik-baik sholat setelah sholat fardhu adalah '
              'sholat malam." **(HR. Muslim)**\n\n'
              '**Tata cara sholat tahajud:**\n'
              '1. Niat sholat tahajud\n'
              '2. Takbiratul ihram\n'
              '3. Membaca doa iftitah\n'
              '4. Membaca surat Al-Fatihah\n'
              '5. Membaca surat pendek\n'
              "6. Ruku' dengan tuma'ninah\n"
              "7. I'tidal\n"
              "8. Sujud dengan tuma'ninah\n"
              '9. Duduk di antara dua sujud\n'
              '10. Sujud kembali\n'
              '11. Bangun untuk rakaat kedua\n'
              '12. Tasyahud akhir\n'
              '13. Salam',
          sources: const [
            _SourceItem(
              title: 'Al-Baqarah, Ayat 194',
              excerpt:
                  'Lorem ipsum dolor sit amet consectetur. Sed lectus lorem id '
                  'cras aliquam porttitor. Egestas quam sit diam leo sed sit '
                  'purus duis. At quisque dictum id pellentesque.',
            ),
            _SourceItem(
              title: 'An-Nisa, Ayat 103',
              excerpt:
                  'Sesungguhnya sholat itu adalah kewajiban yang ditentukan '
                  'waktunya atas orang-orang yang beriman.',
            ),
          ],
          followUpChips: const [
            'Keutamaan sholat tahajud',
            'Doa setelah sholat tahajud',
            'Niat sholat tahajud',
          ],
        );
      });
    });
  }

  void _onChipTap(String chip) {
    _onSend(chip);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 16),
      top: false,
      child: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0x33E8E8E8),
          ),
          Expanded(child: _buildContent()),
          _inputBar(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (_chatState) {
      case _ChatState.empty:
        return _emptyState();
      case _ChatState.loading:
        return _loadingState();
      case _ChatState.answered:
        return _answeredState();
    }
  }

  // --- Empty State ---

  Widget _emptyState() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 34),
          _greetingHeader(),
          const SizedBox(height: 8),
          const SizedBox(
            width: 370,
            child: Text(
              'Asisten AI siap membantumu belajar seputar ibadah, doa, sejarah, dan wawasan Islam lainnya. Pilih topik di bawah atau ketik pertanyaanmu sendiri.',
              style: TextStyle(
                color: Color(
                  0xFFDDDDDD,
                ) /* semantic-content-inverse-secondary */,
                fontSize: 12,
                fontFamily: 'Synonym Variable',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
          ),
          const SizedBox(height: 32),
          _subtitleText('Mulai dengan topik di bawah ini'),
          const SizedBox(height: 12),
          _suggestionChip('🕌', 'Carikan doa sebelum tidur'),
          const SizedBox(height: 8),
          _suggestionChip('📖', 'Bagaimana niat puasa Ramadhan?'),
          const SizedBox(height: 8),
          _suggestionChip('🤲', 'Doa setelah sholat tahajud'),
          const SizedBox(height: 8),
          _suggestionChip('☪️', 'Keutamaan sholat dhuha'),
        ],
      ),
    );
  }

  Widget _greetingHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Assalamu'alaikum",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Synonym Variable',
            fontWeight: FontWeight.w700,
            height: 1.40,
          ),
        ),
        Text(
          'Ada yang ingin ditanyakan hari ini?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Synonym Variable',
            fontWeight: FontWeight.w700,
            height: 1.40,
          ),
        ),
      ],
    );
  }

  Widget _subtitleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFDDDDDD),
        fontSize: 12,
        fontFamily: 'Synonym Variable',
        fontWeight: FontWeight.w400,
        height: 1.50,
      ),
    );
  }

  Widget _suggestionChip(String emoji, String label) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onChipTap(label),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFFDDDDDD),
                  fontSize: 12,
                  fontFamily: 'Synonym Variable',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Loading State ---

  Widget _loadingState() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 32),
        _userBubble(_currentMessage?.query ?? ''),
        const SizedBox(height: 16),
        _aiLoadingRow(),
      ],
    );
  }

  Widget _userBubble(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFDDDDDD),
            fontSize: 12,
            fontFamily: 'Synonym Variable',
            fontWeight: FontWeight.w400,
            height: 1.40,
          ),
        ),
      ),
    );
  }

  Widget _aiLoadingRow() {
    return Row(
      children: [
        _aiAvatar(),
        const SizedBox(width: 12),
        const SpinKitThreeBounce(
          color: Colors.white70,
          size: 18,
        ),
      ],
    );
  }

  Widget _aiAvatar({
    bool isBackground = false,
  }) {
    const avatar = CacheImageOrSvg(
      source: 'assets/images/icon-images/icon-ai.png',
      width: 34,
      height: 34,
    );

    if (!isBackground) {
      return avatar;
    }

    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0x33FFFFFF),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: CacheImageOrSvg(
          source: 'assets/images/icon-images/icon-ai.png',
          width: 34,
          height: 34,
        ),
      ),
    );
  }

  // --- Answered State ---

  Widget _answeredState() {
    final msg = _currentMessage;
    if (msg == null) return const SizedBox.shrink();

    return Stack(
      children: [
        ListView(
          controller: _scrollController,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 32,
            bottom: 100,
          ),
          children: [
            _userBubble(msg.query ?? ''),
            const SizedBox(height: 16),
            _aiAnswerCard(msg),
          ],
        ),
        // Bottom fade gradient
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 188,
          child: IgnorePointer(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xFF0F172A)],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _aiAnswerCard(_ChatMessage msg) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _aiAvatar(),
            const SizedBox(width: 8),
            const Text(
              'Kata Sahaba',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Synonym Variable',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          msg.content ?? '',
          style: const TextStyle(
            color: Color(0xFFDDDDDD),
            fontSize: 12,
            fontFamily: 'Synonym Variable',
            fontWeight: FontWeight.w400,
            height: 1.60,
          ),
        ),
        const SizedBox(height: 16),
        _disclaimerBox(),
        const SizedBox(height: 24),
        if (msg.sources != null && msg.sources!.isNotEmpty) ...[
          const Text(
            "Qur'an Sources",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          ...msg.sources!.map(_sourceCard),
        ],
        if (msg.followUpChips != null && msg.followUpChips!.isNotEmpty) ...[
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: msg.followUpChips!.map(_followUpChip).toList(),
          ),
        ],
      ],
    );
  }

  Widget _disclaimerBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1B8354),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'Jawaban ini bersifat informatif. Untuk pemahaman lebih dalam, '
        'konsultasikan dengan ulama atau ahli tafsir.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontFamily: 'Synonym Variable',
          fontWeight: FontWeight.w400,
          height: 1.40,
        ),
      ),
    );
  }

  Widget _sourceCard(_SourceItem source) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0x33E8E8E8),
            // width: 1, (default)
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            source.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            source.excerpt,
            style: const TextStyle(
              color: Color(0xFFDDDDDD),
              fontSize: 10,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w400,
              height: 1.60,
            ),
          ),
        ],
      ),
    );
  }

  Widget _followUpChip(String label) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onChipTap(label),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w400,
              height: 1.40,
            ),
          ),
        ),
      ),
    );
  }

  // --- Input Bar ---

  Widget _inputBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomTextFormFieldGlassWidget(
        controller: _textController,
        useGlass: true,
        hintText: 'Tanyakan sesuatu...',
        hintStyle: const TextStyle(
          color: Color(0xFFA6A6A6),
          fontSize: 12,
          fontFamily: 'Synonym Variable',
          fontWeight: FontWeight.w400,
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Synonym Variable',
          fontWeight: FontWeight.w400,
        ),
        onsubmit: _onSend,
        textInputAction: TextInputAction.send,
        borderRadius: 24,
        glassHeight: 48,
        glassBlur: 10,
        glassColor: Colors.white.withValues(alpha: 0.2),
        glassBorderColor: Colors.white.withValues(alpha: 0.05),
        glassBorderWidth: 0.5,
        suffixIcon: IconButton(
          onPressed: () => _onSend(_textController.text),
          icon: const Icon(
            Icons.send_rounded,
            color: Colors.white,
            size: 20,
          ),
          splashRadius: 18,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints.tightFor(width: 36, height: 36),
        ),
      ),
    );
  }

  // --- AppBar ---

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar.buildAppBarSimple(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 40,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: SizedBox.shrink(),
      ),
      leading: IconButton(
        onPressed: () => Navigator.of(context).maybePop(),
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: ColorPalette.kWhite,
          size: 22,
        ),
        padding: const EdgeInsets.only(left: 16),
        constraints: const BoxConstraints.tightFor(width: 40, height: 40),
        splashRadius: 20,
      ),
      titleWidget: Row(
        spacing: 8,
        children: [
          _aiAvatar(),
          Text(
            'Sahaba AI',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorPalette.kWhite,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
