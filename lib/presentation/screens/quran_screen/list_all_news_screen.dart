import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/news_bloc/news_bloc.dart';
import 'package:sahaba_mobile/domains/news/news_response.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

class ListAllNewsScreen extends StatelessWidget {
  const ListAllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    return BlocProvider(
      create: (context) => sl<NewsBloc>()..add(const NewsEvent.fetchNewsList()),
      child: AppScaffold(
        appBar: _buildAppBar(context),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            final newsList = state.newsResponse?.data ?? [];
            final isLoading = state.fetchNewsLoading;

            if (isLoading) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (newsList.isEmpty) {
              return const SizedBox.shrink();
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 4,
                    ),
                    child: Text(
                      'Terbaru',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ColorPalette.kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ...List.generate(newsList.length, (index) {
                    final item = newsList[index];
                    final isLast = index == newsList.length - 1;
                    return Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            await context.push(
                              '$currentLocation/${RouterPath.detailNewsPath}',
                              extra: item,
                            );
                          },
                          splashColor: Colors.white.withValues(alpha: 0.06),
                          highlightColor: Colors.white.withValues(alpha: 0.04),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: _buildNewsCard(
                              context: context,
                              item: item,
                            ),
                          ),
                        ),
                        if (!isLast)
                          const SizedBox(
                            width: double.infinity,
                            height: 4,
                            child: Divider(
                              color: Color(0x33E8E8E8),
                              thickness: 2,
                            ),
                          ),
                      ],
                    );
                  }),
                ],
              ),
            );
          },
        ),
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
      titleWidget: Text(
        'Berita Islami',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ColorPalette.kWhite,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNewsCard({
    required BuildContext context,
    required NewsData item,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CacheImageOrSvg(
            source: item.pictureUrl ?? '',
            width: double.infinity,
            height: 160,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          item.title ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              color: Color(0xFFDDDDDD),
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              item.createdAt ?? '',
              style: textTheme.bodySmall?.copyWith(
                color: const Color(0xFFDDDDDD),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
