import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/kisah_bloc/kisah_bloc.dart';
import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

// --- Konstanta ukuran teks (mengikuti pola detail_quran_screen) ---
const _minBodyTextSize = 12.0;
const _defaultBodyTextSize = 14.0;
const _maxBodyTextSize = 20.0;

double _bodyTextSize(double value) => _scaledTextSize(
  value,
  min: _minBodyTextSize,
  normal: _defaultBodyTextSize,
  max: _maxBodyTextSize,
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

class DetailKisahScreen extends StatefulWidget {
  const DetailKisahScreen({super.key, this.kisahId});

  final int? kisahId;

  @override
  State<DetailKisahScreen> createState() => _DetailKisahScreenState();
}

class _DetailKisahScreenState extends State<DetailKisahScreen> {
  double _textSizeSetting = 0;
  bool _showTextSizeBar = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _dispatchLoad();
  // }

  // void _dispatchLoad() {
  //   final id = widget.kisahId;
  //   if (id != null && id > 0) {
  //     context.read<KisahBloc>().add(KisahEvent.fetchKisahDetail(id));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<KisahBloc>()
            ..add(KisahEvent.fetchKisahDetail(widget.kisahId ?? 0)),
      child: AppScaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

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
        onPressed: () => context.pop(),
        // onPressed: () => Navigator.of(context).maybePop(),
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: ColorPalette.kWhite,
          size: 22,
        ),
        padding: const EdgeInsets.only(left: 16),
        constraints: const BoxConstraints.tightFor(width: 40, height: 40),
        splashRadius: 20,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<KisahBloc, KisahState>(
      builder: (context, state) {
        if (state.fetchDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorPalette.primaryColor,
            ),
          );
        }

        if (state.fetchDetailErrorMessage.isNotEmpty) {
          return _buildErrorState(context, state.fetchDetailErrorMessage);
        }

        final detail = state.kisahDetail;
        if (detail == null) {
          return const SizedBox.shrink();
        }

        return Stack(
          children: [
            _buildScrollableContent(context, detail),
            if (_showTextSizeBar)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildTextSizeBar(context),
              ),
          ],
        );
      },
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorPalette.kWhite,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                final id = widget.kisahId;
                if (id != null && id > 0) {
                  context.read<KisahBloc>().add(
                    KisahEvent.fetchKisahDetail(id),
                  );
                }
              },
              child: Text(
                'Coba lagi',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorPalette.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableContent(BuildContext context, KisahData detail) {
    return SingleChildScrollView(
      // Beri padding bawah agar konten tidak tertutup bottom bar
      padding: _showTextSizeBar
          ? const EdgeInsets.only(bottom: 100)
          : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Hero image — 240px sesuai Figma (node 594:5290)
          _buildHeroImage(detail.pictureUrl),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Judul — Playpen Sans Bold 24px, center, line-height 40px
                _buildTitle(context, detail.title),
                const SizedBox(height: 32),
                // Konten HTML dari API
                if (detail.content != null && detail.content!.isNotEmpty)
                  Html(
                    data: detail.content!,
                    style: {
                      'body': Style(
                        color: ColorPalette.inverseSecondary,
                        fontSize: FontSize(_bodyTextSize(_textSizeSetting)),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Playpen Sans',
                        textAlign: TextAlign.justify,
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                      ),
                      'p': Style(
                        margin: Margins.only(bottom: 16),
                      ),
                    },
                  )
                else
                  _buildBodyText(
                    context,
                    'Tidak ada konten tersedia.',
                  ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage(String? pictureUrl) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CacheImageOrSvg(
            source: pictureUrl ?? '',
            width: double.infinity,
            errorBuilder: (_, _, _) => Container(
              color: ColorPalette.surfaceTranslucent,
            ),
          ),
          // Gradient overlay bawah supaya transisi ke background halus
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    ColorPalette.scaffoldBackground,
                  ],
                ),
              ),
            ),
          ),
          // Tombol ukuran teks — pojok kanan atas
          Positioned(
            top: 12,
            right: 16,
            child: GestureDetector(
              onTap: () => setState(() => _showTextSizeBar = !_showTextSizeBar),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.format_size_rounded,
                  color: ColorPalette.kWhite,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String? title) {
    return Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: ColorPalette.kWhite,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Playpen Sans',
        height: 40 / 24,
      ),
    );
  }

  Widget _buildBodyText(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: ColorPalette.inverseSecondary, // #DDDDDD sesuai Figma
        fontSize: _bodyTextSize(_textSizeSetting),
        fontWeight: FontWeight.w400,
        fontFamily: 'Playpen Sans',
        height: 28 / 14,
        // text-indent 24px — simulasi dengan leading spaces (Flutter tidak support indent native)
      ),
    );
  }

  Widget _buildTextSizeBar(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        // Background: linear-gradient sesuai Figma (node 627:1954)
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: 0.1),
            Colors.white.withValues(alpha: 0.1),
          ],
        ),
        color: ColorPalette.scaffoldBackground,
        border: const Border(
          top: BorderSide(
            color: Color(0x33E8E8E8), // rgba(232,232,232,0.2)
            width: 1,
          ),
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Baris header: label + tombol close
          Row(
            children: [
              Expanded(
                child: Text(
                  'Ukuran Teks',
                  style: textTheme.bodyMedium?.copyWith(
                    color: ColorPalette.inverseSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Synonym Variable',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _showTextSizeBar = false),
                child: const Icon(
                  Icons.close,
                  color: ColorPalette.inverseSecondary,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Baris slider: A kecil — slider — A besar
          Row(
            children: [
              Text(
                'A',
                style: textTheme.bodyMedium?.copyWith(
                  color: ColorPalette.inverseSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Synonym Variable',
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
                    max: 1,
                    value: _textSizeSetting.clamp(-1, 1).toDouble(),
                    onChanged: (value) {
                      setState(() => _textSizeSetting = value);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'A',
                style: textTheme.displaySmall?.copyWith(
                  color: ColorPalette.inverseSecondary,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Synonym Variable',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
