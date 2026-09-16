import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sahaba_mobile/business_logic/ai_chat_bloc/ai_chat_bloc.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';

class SahabaAiScreen extends StatefulWidget {
  const SahabaAiScreen({super.key});

  @override
  State<SahabaAiScreen> createState() => _SahabaAiScreenState();
}

class _SahabaAiScreenState extends State<SahabaAiScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  late final AiChatBloc _aiChatBloc;

  @override
  void initState() {
    super.initState();
    _aiChatBloc = context.read<AiChatBloc>();
  }

  @override
  void dispose() {
    _aiChatBloc.add(const AiChatEvent.clearChat());
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSend(String text) {
    final message = text.trim();
    if (message.isEmpty) return;

    context.read<AiChatBloc>().add(AiChatEvent.postAiChat(message: message));
    _textController.clear();
  }

  void _onChipTap(String chip) {
    _onSend(chip);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AiChatBloc, AiChatState>(
      listenWhen: (previous, current) =>
          previous.postAiChatErrorMessage != current.postAiChatErrorMessage &&
          current.postAiChatErrorMessage.isNotEmpty,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            CustomSnackBar.failure(message: state.postAiChatErrorMessage),
          );
      },
      builder: (context, state) {
        return AppScaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, AiChatState state) {
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
          Expanded(child: _buildContent(state)),
          _inputBar(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildContent(AiChatState state) {
    if (state.messages.isEmpty && !state.postAiChatLoading) {
      return _emptyState();
    }

    return _chatState(state);
  }

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
              'Asisten AI siap membantumu belajar seputar ibadah, doa, '
              'sejarah, dan wawasan Islam lainnya. Pilih topik di bawah '
              'atau ketik pertanyaanmu sendiri.',
              style: TextStyle(
                color: Color(0xFFDDDDDD),
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

  Widget _chatState(AiChatState state) {
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
            ...state.messages.map(_messageItem),
            if (state.postAiChatLoading) ...[
              const SizedBox(height: 16),
              _aiLoadingRow(),
            ],
          ],
        ),
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

  Widget _aiAvatar({bool isBackground = false}) {
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

  Widget _aiAvatarHeader() {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],

                  shape: BoxShape.circle,
                ),
                child: const Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      child: CacheImageOrSvg(
                        source: 'assets/svg/tanya-sahaba.svg',
                        // width: 57.61,
                        // height: 55.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _messageItem(AiChatMessage message) {
    if (message.isUser) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: _userBubble(message.content),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: _aiAnswerCard(message.content),
    );
  }

  Widget _aiAnswerCard(String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _aiAvatar(),
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
        MarkdownBody(
          data: answer,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            p: const TextStyle(
              color: Color(0xFFDDDDDD),
              fontSize: 12,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w400,
              height: 1.60,
            ),
            strong: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w700,
              height: 1.60,
            ),
            listBullet: const TextStyle(
              color: Color(0xFFDDDDDD),
              fontSize: 12,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w400,
              height: 1.60,
            ),
            blockquote: const TextStyle(
              color: Color(0xFFDDDDDD),
              fontSize: 12,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w400,
              height: 1.60,
            ),
            a: const TextStyle(
              color: Color(0xFF8EC5FF),
              fontSize: 12,
              fontFamily: 'Synonym Variable',
              fontWeight: FontWeight.w500,
              height: 1.60,
            ),
            blockquoteDecoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(8),
              border: const Border(
                left: BorderSide(color: Color(0xFF1B8354), width: 3),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _disclaimerBox(),
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
        glassBorderColor: Colors.white,
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar.buildAppBarSimple(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 24,
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
        spacing: 2,
        children: [
          _aiAvatarHeader(),
          Text(
            'Sahaba AI',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorPalette.kWhite,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
