import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
import 'package:sahaba_mobile/business_logic/special_product/special_product_bloc.dart';
import 'package:sahaba_mobile/domains/ads/ads_response.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/screens/product/widget/history_product_limit_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/search_bar_widget.dart';

class ProductHalalScreen extends HookWidget {
  const ProductHalalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    return MultiBlocProvider(
      providers: [
        BlocProvider<SpecialProductBloc>(
          create: (context) =>
              sl<SpecialProductBloc>()
                ..add(const SpecialProductEvent.started()),
        ),
        BlocProvider<LocationBloc>(
          create: (context) => sl<LocationBloc>()
            ..add(const LocationEvent.getCurrentLocation(isGetPosition: true)),
        ),
      ],
      child: AppScaffold(
        appBar: CustomAppBar.buildAppBarSimple(
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
            'Produk Halal',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorPalette.kWhite,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              // Search sementara
              SearchBarWidget(
                readOnly: true,
                onTap: () => context.push(
                  '$currentLocation/${RouterPath.searchProductHalalPath}',
                ),
              ),
              // searchCard(
              //   context,
              //   onTap: () {},
              // ),
              // Brand Pilihan
              _brandPilihanSection(context),
              _menuBrand(context),
              // Kategori Produk
              _featureSection(
                context,
                onMakananTap: () async => context.push(
                  '$currentLocation/${RouterPath.categoryProductPath}',
                  extra: {
                    'id': 15,
                    'name': 'Makanan',
                  },
                ),
                onMinumanJSolatTap: () async => context.push(
                  '$currentLocation/${RouterPath.categoryProductPath}',
                  extra: {
                    'id': 16,
                    'name': 'Minuman',
                  },
                ),
                onObatTap: () async => context.push(
                  '$currentLocation/${RouterPath.categoryProductPath}',
                  extra: {'id': 17, 'name': 'Obat'},
                ),
                onProdukCosmeticTap: () async => context.push(
                  '$currentLocation/${RouterPath.categoryProductPath}',
                  extra: {
                    'id': 18,
                    'name': 'Kosmetik',
                  },
                ),
              ),

              // Riwayat Produk
              const HistoryProductLimitWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchCard(
    BuildContext context, {
    String title = 'Cari produk disini',
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: const Color(0xFF4A5163),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white.withValues(alpha: .18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .18),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                size: 34,
                color: Colors.white.withValues(alpha: .55),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white.withValues(alpha: .55),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuBrand(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    return BlocBuilder<SpecialProductBloc, SpecialProductState>(
      buildWhen: (prev, curr) =>
          prev.getBrandDataLoading != curr.getBrandDataLoading ||
          prev.dataBrand != curr.dataBrand,
      builder: (context, state) {
        if (state.getBrandDataLoading) {
          return const SizedBox(
            height: 176,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.dataBrand.isEmpty) return const SizedBox.shrink();

        // Chunk: baris 1 = index 0–3, baris 2 = index 4–7
        final data = state.data;
        final rows = <List<AdResponseData>>[
          data.take(4).toList(),
          if (data.length > 4) data.skip(4).take(4).toList(),
        ];

        return Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rows
                .map(
                  (row) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: row
                        .map<Widget>(
                          (brand) => Expanded(
                            child: SizedBox(
                              height: 80,
                              child: Center(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(80),
                                    onTap: () async {
                                      final loc = context
                                          .read<LocationBloc>()
                                          .state;
                                      // Skip jika GPS belum ready
                                      if (loc.latitude != 0.0 ||
                                          loc.longitude != 0.0) {
                                        context.read<SpecialProductBloc>().add(
                                          SpecialProductEvent.adLog(
                                            brand.productId,
                                            brand.campaignId,
                                            brand.id,
                                            'Click',
                                          ),
                                        );
                                      }
                                      await context.push(
                                        '$currentLocation/${RouterPath.listDetailBrandByProductPath}',
                                        extra: {
                                          'id': brand.id,
                                          'campaignName': brand.campaignName,
                                          'image': brand.image,
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFE8E8E8),
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            width: 4,
                                            color: Color(0xFFB39164),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            80,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: CacheImageOrSvg(
                                          source:
                                              data
                                                  .firstWhere(
                                                    (element) =>
                                                        element.id == brand.id,
                                                  )
                                                  .image ??
                                              '',
                                          width: 52,
                                          height: 52,
                                          isCircle: true,
                                          autoCache: true,
                                          errorBuilder: (context, error, stackTrace) {
                                            debugPrint(
                                              'Gagal load image brand: $error',
                                            );
                                            return const Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              color: Colors.black38,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _featureSection(
    BuildContext context, {
    VoidCallback? onMakananTap,
    VoidCallback? onMinumanJSolatTap,
    VoidCallback? onObatTap,
    VoidCallback? onProdukCosmeticTap,
  }) {
    final textTheme = Theme.of(context).textTheme;

    final items = [
      {
        'label': 'Makanan',
        'icon': 'assets/images/icon-images/icon-makanan.png',
        'iconRatio': 0.78,
        'onTap': onMakananTap,
      },
      {
        'label': 'Minuman',
        'icon': 'assets/images/icon-images/icon-minuman.png',
        'iconRatio': 0.85,
        'onTap': onMinumanJSolatTap,
      },
      {
        'label': 'Obat',
        'icon': 'assets/images/icon-images/icon-obat.png',
        'iconRatio': 0.75,
        'onTap': onObatTap,
      },
      {
        'label': 'Kosmetik',
        'icon': 'assets/images/icon-images/icon-kosmetik.png',
        'iconRatio': 0.9,
        'onTap': onProdukCosmeticTap,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kategori Produk',
          style: textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            final itemCount = items.length;
            final rawItemWidth = constraints.maxWidth / itemCount;
            final boxSize = (rawItemWidth * 0.72).clamp(44.0, 64.0);
            final labelFontSize = (boxSize * 0.21).clamp(10.5, 13.0);

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((item) {
                final label = item['label']! as String;
                final iconPath = item['icon']! as String;
                final iconRatio = item['iconRatio']! as double;
                final onTap = item['onTap'] as VoidCallback?;
                final iconSize = boxSize * iconRatio;

                return Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onTap,
                      borderRadius: BorderRadius.circular(14),
                      splashColor: Colors.white.withValues(alpha: 0.06),
                      highlightColor: Colors.white.withValues(alpha: 0.04),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: boxSize + 10,
                              height: boxSize + 6,
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/motif-menu.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    foregroundDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      gradient: RadialGradient(
                                        radius: 0.72,
                                        colors: [
                                          Colors.white.withValues(alpha: 0.32),
                                          Colors.white.withValues(alpha: 0.08),
                                          Colors.transparent,
                                        ],
                                        stops: const [0, 0.48, 1],
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        iconPath,
                                        width: iconSize,
                                        height: iconSize,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: textTheme.bodySmall?.copyWith(
                                color: const Color(0xFFDDDDDD),
                                fontSize: labelFontSize,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _brandPilihanSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 37,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(999)),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(179, 145, 100, 0),
            Color(0xFFB39164),
            Color.fromRGBO(179, 145, 100, 0),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Logo kiri (rotated 180°)
          Positioned(
            left: 16,
            top: -5,
            child: Transform.rotate(
              angle: 0, // 180° in radians
              child: Image.asset(
                'assets/images/icon-images/product-halal.png',
                width: 65,
                height: 53,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Logo kanan
          Positioned(
            right: 16,
            bottom: -10,
            child: Image.asset(
              'assets/images/icon-images/product-halal1.png',
              width: 65,
              height: 53,
              fit: BoxFit.contain,
            ),
          ),

          // Text centered
          const Center(
            child: Text(
              'BRAND PILIHAN',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
