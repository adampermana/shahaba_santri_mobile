import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';

class HistoryItems extends StatelessWidget {
  const HistoryItems({
    required this.namaProduk,
    required this.status,
    required this.registerDate,
    required this.imagePath,
    required this.id,
    required this.type,
    super.key,
    this.lat,
    this.long,
    this.eventTime,
    this.productId,
    this.onTap,
  });
  final String namaProduk;
  final String status;
  final String registerDate;
  final String imagePath;
  final String type;
  final int id;
  final double? lat;
  final double? long;
  final String? eventTime;
  final int? productId;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isHalal = status == 'Halal';

    return InkWell(
      onTap:
          onTap ??
          () async {
            final location = GoRouterState.of(context).uri.toString();
            await context.push(
              '$location/${RouterPath.productDetailPath}',
              extra: {
                'id': productId,
                'lat': lat,
                'long': long,
                'eventTime': eventTime != null
                    ? DateFormat(
                        'dd MMM yyyy HH:mm',
                      ).format(DateTime.parse(eventTime!))
                    : null,
              },
            );
          },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: type.toLowerCase() != 'iklan'
              ? Colors.transparent
              : Colors.white.withValues(alpha: 0.08),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Row(
            children: [
              //  Gambar produk
              CacheImageOrSvg(
                source: imagePath,
                width: 106,
                height: 72,
                autoCache: true,
                errorBuilder: (_, _, _) => Container(
                  width: 106,
                  height: 72,
                  decoration: BoxDecoration(
                    color: ColorPalette.kGray100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.image_outlined,
                    color: ColorPalette.primary,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              //  Info produk
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (type.toLowerCase() == 'iklan')
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10000),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          child: Text(
                            type,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    Text(
                      namaProduk,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorPalette.kWhite,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      spacing: 4,
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

                        const SizedBox(
                          height: 12,
                          child: VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: ColorPalette.contentTertiary,
                          ),
                        ),
                        //  TAMBAHIN Devide HEight
                        if (!isHalal && registerDate.isNotEmpty)
                          const SizedBox(width: 6),
                        Text(
                          registerDate,
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

              //  Arrow
              Icon(
                Icons.keyboard_arrow_right,

                color: ColorPalette.kWhite,
                size: context.isTabletLarge
                    ? 20
                    : context.isTabletMedium
                    ? 20
                    : context.isTabletSmall
                    ? 20
                    : context.isPhoneLarge
                    ? 20
                    : context.isPhoneMedium
                    ? 18
                    : context.isPhoneSmall
                    ? 18
                    : 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
