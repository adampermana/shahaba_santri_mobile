// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:intl/intl.dart';
// import 'package:sahaba_mobile/business_logic/product_detail/product_detail_bloc.dart';
// import 'package:sahaba_mobile/domains/product/product_response.dart';
// import 'package:sahaba_mobile/injector.dart';
// import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
// import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
// import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';
// import 'package:sahaba_mobile/presentation/widgets/search_history.dart';

// class DetailProductScreen extends StatelessWidget {
//   const DetailProductScreen({
//     required this.id,
//     super.key,
//     this.ad,
//     this.isAds = false,
//   });
//   final int id;
//   final ProductData? ad;
//   final bool isAds;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ProductDetailBloc>(
//       create: (context) =>
//           sl<ProductDetailBloc>()..add(ProductDetailEvent.started(id)),
//       child: AppScaffold(
//         appBar: CustomAppBar.buildAppBarSimple(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leadingWidth: 40,
//           bottom: const PreferredSize(
//             preferredSize: Size.fromHeight(30),
//             child: SizedBox.shrink(),
//           ),
//           leading: IconButton(
//             onPressed: () => Navigator.of(context).maybePop(),
//             icon: const Icon(
//               Icons.arrow_back_rounded,
//               color: ColorPalette.kWhite,
//               size: 22,
//             ),
//             padding: const EdgeInsets.only(left: 16),
//             constraints: const BoxConstraints.tightFor(width: 40, height: 40),
//             splashRadius: 20,
//           ),
//           titleWidget: Text(
//             'Detail Produk',
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//               color: ColorPalette.kWhite,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
//           builder: (context, state) {
//             if (state.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state.errorMessage != null) {
//               return Center(child: Text(state.errorMessage!));
//             } else if (state.product == null) {
//               return const Center(child: Text('Product not found'));
//             } else {
//               final product = state.product;
//               debugPrint('==== Data Product partner: ${product?.partnerId}');
//               debugPrint('==== Data Product: ${product?.name}');
//               return SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Stack(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: SizedBox(
//                                   width: double.infinity,
//                                   height: 300,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.network(
//                                       state.product?.images?.isEmpty ?? true
//                                           ? ''
//                                           : state.product!.images!.first.image,
//                                       fit: BoxFit.contain,
//                                       // width: double.infinity,
//                                       // height: 140,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),

//                           const Row(
//                             children: [
//                               Text(
//                                 'Terdaftar Halal',
//                                 // product.status == 'Halal' &&
//                                 //         getDateLeft(product.expireDate!) < 0
//                                 //     ? 'Expired'
//                                 //     : product.status == 'Halal'
//                                 //     ? 'Terdaftar Halal'
//                                 //     : 'Belum Terdaftar Halal',
//                                 style: TextStyle(
//                                   color: ColorPalette.kTeal,
//                                   // color:
//                                   //     product.status == 'Halal' &&
//                                   //         getDateLeft(product.expireDate!)>0
//                                   //     ? ColorPalette.kTealLight
//                                   //     : Colors.red,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 24,
//                                 ),
//                               ),
//                               Spacer(),
//                             ],
//                           ),
//                           const SizedBox(height: 8),

//                           Text(
//                             product?.name ?? '-',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: ColorPalette.kWhite,
//                             ),
//                           ),

//                           const SizedBox(height: 16),
//                           Visibility(
//                             visible: product?.status == 'Halal',
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const Text(
//                                       'No Sertifikat',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700,
//                                         color: ColorPalette.contentDisabled,
//                                       ),
//                                     ),
//                                     Text(
//                                       product?.certificateNumber ?? '-',
//                                       style: const TextStyle(
//                                         color: ColorPalette.inverseSecondary,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Terbit tanggal ${product?.registerDate}',
//                                       //  - ${product.expireDate}',
//                                       style: const TextStyle(
//                                         color: ColorPalette.inverseSecondary,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           const Divider(),
//                           const Text(
//                             'Deskripsi Produk',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                               color: ColorPalette.contentDisabled,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             product?.description ?? '-',
//                             style: const TextStyle(
//                               color: ColorPalette.inverseSecondary,
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(height: 16),

//                           const Divider(),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Kategori',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                   color: ColorPalette.contentDisabled,
//                                 ),
//                               ),
//                               Text(
//                                 product?.category ?? '-',
//                                 style: const TextStyle(
//                                   color: ColorPalette.inverseSecondary,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           const Divider(),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Produsen',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                   color: ColorPalette.contentDisabled,
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: Text(
//                                     product?.partner ?? '-',
//                                     style: const TextStyle(
//                                       color: ColorPalette.inverseSecondary,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Divider(),

//                           const SizedBox(height: 20),
//                           Visibility(
//                             visible: !isAds && state.adsCarousel != null,
//                             child: const Text(
//                               'Produk Yang Mungkin Anda Sukai',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                                 color: ColorPalette.contentDisabled,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                         ],
//                       ),
//                     ),
//                     Visibility(
//                       visible: !isAds && state.adsCarousel != null,
//                       child: HistoryItems(
//                         namaProduk: ad?.name ?? state.adsCarousel?.name ?? '-',
//                         status: ad != null ? ad!.status! : 'Halal',
//                         registerDate: ad != null ? ad!.expireDate! : '-',
//                         imagePath: ad?.image ?? state.adsCarousel?.image ?? '',
//                         id: ad?.id ?? state.adsCarousel?.productId ?? 0,
//                         type: 'Iklan',
//                         // namaProduk: ad != null
//                         //     ? ad!.name!
//                         //     : state.adsCarousel!.name,

//                         // imagePath: ad != null
//                         //     ? ad!.image!
//                         //     : state.adsCarousel!.image,
//                         // id: ad != null
//                         //     ? ad!.id!
//                         //     : state.adsCarousel!.productId,
//                       ),
//                     ),
//                     const SizedBox(height: 50),
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// int getDateLeft(String date) {
//   final now = DateTime.now();
//   final formatter = DateFormat('dd MMM yyyy');
//   final targetDate = formatter.parse(date);

//   final days = targetDate.difference(now).inDays;
//   debugPrint('days left: ${days < 0}');
//   return days;
// }
