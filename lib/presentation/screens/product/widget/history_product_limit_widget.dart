import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:intl/intl.dart';
import 'package:sahaba_mobile/business_logic/auth/auth_bloc.dart';
import 'package:sahaba_mobile/business_logic/product_bloc/product_bloc.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/infrastructure/product/history/history_product_limit.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';

class HistoryProductLimitWidget extends HookWidget {
  const HistoryProductLimitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final guestId =
        context.watch<AuthBloc>().state.authDataHive?.id ??
        sl<AuthBloc>().state.authDataHive?.id;

    final currentLocation = GoRouterState.of(context).uri.toString();

    useEffect(() {
      debugPrint('==== GuestId: $guestId');
      if (guestId != null) {
        context.read<ProductBloc>().add(
          ProductEvent.getHistoryProductLimit(userId: guestId),
        );
      }
      // else if (guestId != null) {
      //   context.read<ProductBloc>().add(
      //     ProductEvent.getHistoryProductLimit(userId: guestId),
      //   );
      // }
      return null;
    }, []);

    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (prev, curr) =>
          prev.historyProductLimit != curr.historyProductLimit ||
          prev.isLoadingHistoryProductLimit !=
              curr.isLoadingHistoryProductLimit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Header (fixed, tidak ikut scroll)
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Text(
                'Riwayat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.kWhite,
                ),
              ),
            ),

            //  List (yang scroll)
            if (state.isLoadingHistoryProductLimit)
              const Center(child: CircularProgressIndicator())
            else if (state.historyProductLimit.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Center(
                  child: Text(
                    'Belum ada riwayat',
                    style: TextStyle(
                      color: ColorPalette.kGray100,
                      fontSize: 13,
                    ),
                  ),
                ),
              )
            else
              ListView.separated(
                padding: const EdgeInsets.only(bottom: 120),
                shrinkWrap:
                    true, // Enable shrinkWrap to let ListView size to its children
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling here, parent should scroll if needed
                itemCount: state.historyProductLimit.length,
                separatorBuilder: (_, _) => const SizedBox.shrink(),
                itemBuilder: (context, index) {
                  final item = state.historyProductLimit[index];
                  return _HistoryItemTile(item: item);
                },
              ),
          ],
        );
      },
    );
  }
}

//  Item tile

class _HistoryItemTile extends StatelessWidget {
  const _HistoryItemTile({required this.item});

  final FetchHistoryDataProductLimit item;

  @override
  Widget build(BuildContext context) {
    debugPrint('==== Image${item.assetUrl}');
    final isHalal = item.halalStatus == 'Halal';

    return InkWell(
      onTap: () async {
        final location = GoRouterState.of(context).uri.toString();
        await context.push(
          '$location/${RouterPath.historyProductPath}',
          extra: {
            'id': item.productId,
            'lat': item.lat,
            'long': item.long,
            'eventTime': item.eventTime != null
                ? DateFormat('dd MMM yyyy HH:mm').format(item.eventTime!)
                : null,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            //  Gambar produk
            CacheImageOrSvg(
              source: item.assetUrl!,
              width: 106,
              height: 72,
              autoCache: true,
              errorBuilder: (_, _, _) => _imagePlaceholder(),
            ),
            const SizedBox(width: 12),

            //  Info produk
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName ?? '-',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorPalette.kWhite,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      // Badge halal / belum terdaftar
                      Text(
                        isHalal ? 'Halal' : 'Belum Terdaftar',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isHalal
                              ? ColorPalette.kTeal
                              : ColorPalette.kRed400,
                        ),
                      ),
                      const SizedBox(width: 6),
                      //  TAMBAHIN Devide HEight
                      const SizedBox(
                        height: 12,
                        child: VerticalDivider(
                          width: 1,
                          thickness: 1,
                          color: ColorPalette.contentTertiary,
                        ),
                      ),
                      const SizedBox(width: 6),
                      //  TAMBAHIN Devide HEight
                      if (!isHalal && item.registerDate!.isNotEmpty)
                        const SizedBox(width: 6),
                      Text(
                        item.registerDate ?? '-',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.contentTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            //  Arrow
            Icon(
              Icons.arrow_left,
              color: ColorPalette.kBlack,
              size: context.isTabletLarge
                  ? 14
                  : context.isTabletMedium
                  ? 14
                  : context.isTabletSmall
                  ? 14
                  : context.isPhoneLarge
                  ? 10
                  : context.isPhoneMedium
                  ? 10
                  : context.isPhoneSmall
                  ? 10
                  : 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      width: 106,
      height: 72,
      decoration: BoxDecoration(
        color: ColorPalette.kGray100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.image_outlined, color: ColorPalette.primary),
    );
  }
}
