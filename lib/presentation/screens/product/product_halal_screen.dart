import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
import 'package:sahaba_mobile/business_logic/special_product/special_product_bloc.dart';
import 'package:sahaba_mobile/domains/ads/ads_response.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
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
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push(
            '$currentLocation/${RouterPath.cameraPath}',
          ),
          backgroundColor: ColorPalette.primary,
          shape: const CircleBorder(),
          child: const CacheImageOrSvg(
            source: AppIcons.searchScan,
          ),
        ),
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
            children: [
              SearchBarWidget(
                hintText: 'Cari produk disini',
                readOnly: true,
                onTap: () => context.push(
                  '$currentLocation/${RouterPath.searchProductHalalPath}',
                ),
              ),
              const SizedBox(height: 24),

              // Brand Pilihan
              _brandPilihanSection(context),
              _menuBrand(context),
              const SizedBox(height: 16),
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

              const SizedBox(height: 24),

              // Riwayat Produk
              const HistoryProductLimitWidget(),
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
          prev.data != curr.data,
      builder: (context, state) {
        if (state.getBrandDataLoading) {
          return const SizedBox(
            height: 176,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return _BrandMenuPager(
          brands: state.data,
          currentLocation: currentLocation,
          onBrandTap: (brand) async {
            final loc = context.read<LocationBloc>().state;
            if (loc.latitude != 0.0 || loc.longitude != 0.0) {
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
                'brand_id': brand.brandId,
                'partner_name': brand.partnerName,
                'image': brand.image,
              },
            );
          },
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
        'icon': 'assets/images/icon-images/icon-makanan.webp',
        'iconRatio': 0.78,
        'onTap': onMakananTap,
      },
      {
        'label': 'Minuman',
        'icon': 'assets/images/icon-images/icon-minuman.webp',
        'iconRatio': 0.85,
        'onTap': onMinumanJSolatTap,
      },
      {
        'label': 'Obat',
        'icon': 'assets/images/icon-images/icon-obat.webp',
        'iconRatio': 0.75,
        'onTap': onObatTap,
      },
      {
        'label': 'Kosmetik',
        'icon': 'assets/images/icon-images/icon-kosmetik.webp',
        'iconRatio': 0.9,
        'onTap': onProdukCosmeticTap,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            'Kategori Produk',
            style: textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.75,
            ),
          ),
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            final itemCount = items.length;
            final rawItemWidth = constraints.maxWidth / itemCount;
            final boxSize = (rawItemWidth * 0.75).clamp(48.0, 64.0);
            final labelFontSize = (boxSize * 0.21).clamp(10.5, 13.0);

            return GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 100, // Adjust as needed to fit icon + text
                crossAxisSpacing: 24,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                final label = item['label']! as String;
                final iconPath = item['icon']! as String;
                final iconRatio = item['iconRatio']! as double;
                final onTap = item['onTap'] as VoidCallback?;
                final iconSize = boxSize * iconRatio;

                return Center(
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
                                        opacity: 0.48,
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
              },
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

class _BrandMenuPager extends StatefulWidget {
  const _BrandMenuPager({
    required this.brands,
    required this.currentLocation,
    required this.onBrandTap,
  });

  final List<AdResponseData> brands;
  final String currentLocation;
  final Future<void> Function(AdResponseData brand) onBrandTap;

  @override
  State<_BrandMenuPager> createState() => _BrandMenuPagerState();
}

class _BrandMenuPagerState extends State<_BrandMenuPager> {
  final PageController _pageController = PageController();
  int _page = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brands = widget.brands.isEmpty
        ? List<AdResponseData?>.filled(8, null)
        : widget.brands.map<AdResponseData?>((brand) => brand).toList();
    final pages = <List<AdResponseData?>>[];
    for (var i = 0; i < brands.length; i += 8) {
      pages.add(brands.sublist(i, (i + 8).clamp(0, brands.length)));
    }
    final showIndicator = widget.brands.length > 8;

    return Column(
      spacing: 4,
      children: [
        SizedBox(
          height: 176,
          child: PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (value) => setState(() => _page = value),
            itemBuilder: (context, pageIndex) {
              final page = pages[pageIndex];
              return GridView.builder(
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 80,
                ),
                itemBuilder: (context, index) {
                  final brand = index < page.length ? page[index] : null;

                  if (brand?.image == null || brand!.image!.isEmpty) {
                    return const CacheImageOrSvg(
                      source: 'assets/svg/icon-brand.svg',
                      width: 52,
                      height: 52,
                      isCircle: true,
                    );
                  }
                  return Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(80),
                      onTap: () => widget.onBrandTap(brand),
                      child: Container(
                        width: 64,
                        height: 64,
                        padding: const EdgeInsets.all(6),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE8E8E8),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 4,
                              color: Color(0xFFB39164),
                            ),
                            borderRadius: BorderRadius.circular(80),
                          ),
                        ),

                        child: CacheImageOrSvg(
                          source: brand.image ?? '',
                          width: 52,
                          height: 52,
                          isCircle: true,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        if (showIndicator)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: index == _page ? 12 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: index == _page ? Colors.white : Colors.white38,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
