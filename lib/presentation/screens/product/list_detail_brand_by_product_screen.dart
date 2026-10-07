// import 'package:dartz/dartz.dart' show Either;
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahaba_mobile/business_logic/special_product/special_product_bloc.dart';
// import 'package:sahaba_mobile/domains/product/product_response.dart';
// import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
// import 'package:sahaba_mobile/infrastructure/product/produsen/produsen.dart';
// import 'package:sahaba_mobile/infrastructure/product/repository/i_product_repository.dart';
// import 'package:sahaba_mobile/injector.dart';
// import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
// import 'package:sahaba_mobile/presentation/routers/router_path.dart';
// import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
// import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
// import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

// class ListDetailBrandByProductScreen extends StatelessWidget {
//   const ListDetailBrandByProductScreen({
//     required this.id,
//     this.brandId,
//     this.partnerName,
//     this.imageUrl,
//     super.key,
//   });

//   final int id;
//   final int? brandId;
//   final String? partnerName;
//   final String? imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     final headerTitle = partnerName?.trim().isNotEmpty == true
//         ? partnerName!.trim()
//         : '-';
//     final headerImage = imageUrl?.trim() ?? '';

//     return BlocProvider(
//       create: (context) =>
//           sl<SpecialProductBloc>()..add(SpecialProductEvent.getProduct(id)),
//       child: BlocBuilder<SpecialProductBloc, SpecialProductState>(
//         builder: (context, state) {
//           return AppScaffold(
//             appBar: CustomAppBar.buildAppBarSimple(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               leadingWidth: 40,
//               bottom: const PreferredSize(
//                 preferredSize: Size.fromHeight(30),
//                 child: SizedBox.shrink(),
//               ),
//               leading: IconButton(
//                 onPressed: () => Navigator.of(context).maybePop(),
//                 icon: const Icon(
//                   Icons.arrow_back_rounded,
//                   color: ColorPalette.kWhite,
//                   size: 22,
//                 ),
//                 padding: const EdgeInsets.only(left: 16),
//                 constraints: const BoxConstraints.tightFor(
//                   width: 40,
//                   height: 40,
//                 ),
//                 splashRadius: 20,
//               ),
//               titleWidget: Text(
//                 'Brand Pilihan',
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   color: ColorPalette.kWhite,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             body: Column(
//               children: [
//                 _buildHeaderSection(
//                   context,
//                   headerTitle: headerTitle,
//                   headerImage: headerImage,
//                 ),
//                 Expanded(
//                   child: _buildContent(
//                     context,
//                     state,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildHeaderSection(
//     BuildContext context, {
//     required String headerTitle,
//     required String headerImage,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(bottom: 16),
//                 decoration: const BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: ColorPalette.rowDividerOnDark,
//                     ),
//                   ),
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           child: Text(
//                             'Galeri Produk',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context).textTheme.headlineSmall
//                                 ?.copyWith(
//                                   color: ColorPalette.inverseSecondary,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 20,
//                                   height: 1.2,
//                                 ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: _BrandName(
//                             id: brandId,
//                             fallback: headerTitle,
//                             style: Theme.of(context).textTheme.headlineSmall
//                                 ?.copyWith(
//                                   color: ColorPalette.inverseSecondary,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 20,
//                                   height: 1.2,
//                                 ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     _buildBrandAvatar(headerImage),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             right: 84,
//             top: 18,
//             child: IgnorePointer(
//               child: Opacity(
//                 opacity: 0.9,
//                 child: Image.asset(
//                   'assets/images/product-halal2.png',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBrandAvatar(String headerImage) {
//     return Container(
//       width: 64,
//       height: 64,
//       decoration: BoxDecoration(
//         color: ColorPalette.surfaceTertiary,
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: const Color(0xFFB39164),
//           width: 4,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(6),
//         child: ClipOval(
//           child: headerImage.isEmpty
//               ? const Icon(
//                   Icons.image_not_supported_outlined,
//                   color: Colors.black38,
//                 )
//               : CacheImageOrSvg(
//                   source: headerImage,
//                   width: 52,
//                   height: 52,
//                   isCircle: true,
//                   autoCache: true,
//                   errorBuilder: (context, error, stackTrace) {
//                     return const Icon(
//                       Icons.image_not_supported_outlined,
//                       color: Colors.black38,
//                     );
//                   },
//                 ),
//         ),
//       ),
//     );
//   }

//   Widget _buildContent(
//     BuildContext context,
//     SpecialProductState state,
//   ) {
//     if (state.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (state.errorMessage != null) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 state.errorMessage!,
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   color: ColorPalette.kWhite,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               OutlinedButton(
//                 onPressed: () {
//                   context.read<SpecialProductBloc>().add(
//                     SpecialProductEvent.getProduct(id),
//                   );
//                 },
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(
//                     color: ColorPalette.surfaceTranslucent,
//                   ),
//                 ),
//                 child: const Text(
//                   'Coba Lagi',
//                   style: TextStyle(color: ColorPalette.kWhite),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     if (state.dataProdusenProduct.isEmpty) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Text(
//             'Belum ada produk tersedia',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//               color: ColorPalette.contentDisabled,
//             ),
//           ),
//         ),
//       );
//     }

//     return ListView.separated(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       itemCount: state.dataProdusenProduct.length,
//       separatorBuilder: (context, index) => const SizedBox.shrink(),
//       itemBuilder: (context, index) {
//         final product = state.dataProdusenProduct[index];
//         return _buildProductItem(context, product);
//       },
//     );
//   }

//   Widget _buildProductItem(BuildContext context, ProductData product) {
//     final isHalal = (product.status ?? '').toLowerCase() == 'halal';
//     final detailId = product.productId ?? product.id ?? 0;
//     final imageSource = product.images?.isNotEmpty == true
//         ? product.images!.first.image
//         : (product.image ?? '');
//     final currentLocation = GoRouterState.of(context).uri.toString();

//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: detailId == 0
//             ? () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Detail produk tidak tersedia'),
//                   ),
//                 );
//               }
//             : () async {
//                 await context.push(
//                   '$currentLocation/${RouterPath.productDetailPath}',
//                   extra: {
//                     'id': detailId,
//                   },
//                 );
//               },
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             children: [
//               Container(
//                 width: 117,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4),
//                   border: Border.all(
//                     color: const Color(0xFFE1E1E1),
//                   ),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(4),
//                   child: CacheImageOrSvg(
//                     source: imageSource,
//                     width: 117,
//                     height: 80,
//                     autoCache: true,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         color: ColorPalette.kGray100,
//                         alignment: Alignment.center,
//                         child: const Icon(
//                           Icons.image_outlined,
//                           color: ColorPalette.primary,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       product.name ?? '-',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                         color: ColorPalette.kWhite,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700,
//                         height: 1.35,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Text(
//                           isHalal ? 'Halal' : 'Belum Terdaftar',
//                           style: Theme.of(context).textTheme.bodySmall
//                               ?.copyWith(
//                                 color: isHalal
//                                     ? ColorPalette.kTeal
//                                     : ColorPalette.kRed400,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                                 height: 1.33,
//                               ),
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           '|',
//                           style: Theme.of(context).textTheme.bodySmall
//                               ?.copyWith(
//                                 color: ColorPalette.contentTertiary,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                                 height: 1.33,
//                               ),
//                         ),
//                         const SizedBox(width: 4),
//                         Expanded(
//                           child: Text(
//                             _buildDateLabel(product.expireDate ?? ''),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context).textTheme.bodySmall
//                                 ?.copyWith(
//                                   color: ColorPalette.contentDisabled,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   height: 1.33,
//                                 ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 8),
//               const SizedBox(
//                 width: 32,
//                 height: 32,
//                 child: Icon(
//                   Icons.keyboard_arrow_right_rounded,
//                   color: ColorPalette.kWhite,
//                   size: 24,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String _buildDateLabel(String value) {
//     final date = value.trim();
//     if (date.isEmpty) {
//       return '-';
//     }

//     if (date.toLowerCase().startsWith('terbit')) {
//       return date;
//     }

//     return 'Terbit $date';
//   }
// }

// class _BrandName extends StatefulWidget {
//   const _BrandName({
//     required this.id,
//     required this.fallback,
//     required this.style,
//   });

//   final int? id;
//   final String fallback;
//   final TextStyle? style;

//   @override
//   State<_BrandName> createState() => _BrandNameState();
// }

// class _BrandNameState extends State<_BrandName> {
//   Future<Either<ServerFailures, Brand>>? _brandFuture;

//   @override
//   void initState() {
//     super.initState();
//     final brandId = widget.id;
//     if (brandId != null && brandId > 0) {
//       _brandFuture = sl<IProductRepository>().getBrandById(brandId);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final brandFuture = _brandFuture;
//     if (brandFuture == null) {
//       return Text(
//         widget.fallback,
//         maxLines: 2,
//         overflow: TextOverflow.ellipsis,
//         style: widget.style,
//       );
//     }

//     return FutureBuilder<Either<ServerFailures, Brand>>(
//       future: brandFuture,
//       builder: (context, snapshot) {
//         var title = widget.fallback;
//         snapshot.data?.fold((_) {}, (brand) => title = brand.name);
//         return Text(
//           title,
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//           style: widget.style,
//         );
//       },
//     );
//   }
// }
