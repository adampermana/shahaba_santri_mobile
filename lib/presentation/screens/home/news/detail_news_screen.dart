import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sahaba_mobile/business_logic/news_bloc/news_bloc.dart';
import 'package:sahaba_mobile/domains/news/news_response.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({required this.newsId, this.initialData, super.key});

  final int newsId;
  final NewsData? initialData;

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar.buildAppBarSimple(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 40,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(40),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<NewsBloc, NewsState>(
        buildWhen: (prev, cur) =>
            prev.fetchDetailLoading != cur.fetchDetailLoading ||
            prev.fetchDetailSuccess != cur.fetchDetailSuccess ||
            prev.newsDetail != cur.newsDetail,
        builder: (context, state) {
          if (state.fetchDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.fetchDetailErrorMessage.isNotEmpty &&
              !state.fetchDetailSuccess) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  state.fetchDetailErrorMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ),
            );
          }

          final detail = state.newsDetail ?? initialData;
          if (detail == null) return const SizedBox.shrink();

          return _buildContent(context, detail);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, NewsData detail) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Image
          SizedBox(
            height: 240,
            width: double.infinity,
            child: CacheImageOrSvg(
              source: detail.pictureUrl ?? '',
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xFFDDDDDD),
                      size: 16,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      detail.createdAt ?? '',
                      style: textTheme.bodySmall?.copyWith(
                        color: const Color(0xFFDDDDDD),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Title
                Text(
                  detail.title ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Synonym Variable',
                    fontWeight: FontWeight.w700,
                    height: 1.75,
                  ),
                ),
                const SizedBox(height: 16),

                // Content (HTML)
                if (detail.content != null && detail.content!.isNotEmpty)
                  Html(
                    data: detail.content,
                    style: {
                      'body': Style(
                        color: const Color(0xFFDDDDDD),
                        fontSize: FontSize(12),
                        fontFamily: 'Synonym Variable',
                        // lineHeight: const LineHeight(1.67),
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                      ),
                      'p': Style(
                        color: const Color(0xFFDDDDDD),
                        fontSize: FontSize(14),
                        fontFamily: 'Synonym Variable',
                        lineHeight: const LineHeight(1.67),
                        margin: Margins.only(bottom: 8),
                      ),
                      'h3': Style(
                        color: Colors.white,
                        fontSize: FontSize(14),
                        fontFamily: 'Synonym Variable',
                        fontWeight: FontWeight.w700,
                        lineHeight: const LineHeight(1.5),
                        margin: Margins.only(top: 12, bottom: 8),
                      ),
                    },
                  ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
