import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/kisah_bloc/kisah_bloc.dart';
import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

class KisahScreen extends StatelessWidget {
  const KisahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
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
        'Kisah Islami',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ColorPalette.kWhite,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Synonym Variable',
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<KisahBloc, KisahState>(
      builder: (context, state) {
        if (state.fetchKisahLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorPalette.primaryColor,
            ),
          );
        }

        if (state.fetchKisahErrorMessage.isNotEmpty) {
          return _buildErrorState(context, state.fetchKisahErrorMessage);
        }

        final list = state.kisahResponse?.data ?? [];

        if (list.isEmpty) {
          return _buildEmptyState(context);
        }

        return _buildGrid(context, list);
      },
    );
  }

  Widget _buildGrid(BuildContext context, List<KisahData> list) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // sesuai Figma: item height ~253px, width ~half screen
        childAspectRatio: 0.68,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) => _kisahCard(context, list[index]),
    );
  }

  Widget _kisahCard(BuildContext context, KisahData item) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    return InkWell(
      onTap: () => context.push(
        '$currentLocation/${RouterPath.detailKisahPath}',
        extra: item,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar — height 186px sesuai Figma
            Expanded(
              flex: 186,
              child: _buildCardImage(item.pictureUrl),
            ),
            const SizedBox(height: 8),
            // Judul — max 2 baris sesuai Figma
            Expanded(
              flex: 67,
              child: Text(
                item.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorPalette.kWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Synonym Variable',
                  height: 28 / 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardImage(String? url) {
    return CacheImageOrSvg(
      source: url ?? '',
      width: double.infinity,
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
              onPressed: () => context.read<KisahBloc>().add(
                const KisahEvent.fetchKisahList(),
              ),
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

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Text(
        'Belum ada kisah tersedia',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ColorPalette.inverseSecondary,
        ),
      ),
    );
  }
}
