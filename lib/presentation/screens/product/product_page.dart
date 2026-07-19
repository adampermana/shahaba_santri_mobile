import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sahaba_mobile/business_logic/product_detail/product_detail_bloc.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/search_history.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
    required this.id,
    this.ad,
    this.isAds = false,
  });
  final int id;
  final ProductData? ad;
  final bool isAds;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (context) =>
          sl<ProductDetailBloc>()..add(ProductDetailEvent.started(id)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorPalette.primaryColor,
          elevation: 0,
          titleSpacing: 0,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Kembali',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocListener<ProductDetailBloc, ProductDetailState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          listener: (context, state) async {
            if (state.isLoading == false) {
              await showDialog<void>(
                context: context,
                barrierDismissible: false, // <- Tidak bisa di close manual
                builder: (_) {
                  // Tutup otomatis setelah 2 detik
                  Future.delayed(const Duration(seconds: 2), () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  });

                  return PopScope(
                    canPop: false, // <- Tidak bisa di pop dengan tombol back
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: LottieBuilder.asset(
                          fit: BoxFit.contain,
                          'assets/animation/success.json',
                          // state.product!.status == 'Halal' &&
                          //         getDateLeft(state.product!.expireDate!) > 0
                          //     ? 'assets/animation/success.json'
                          //     : 'assets/animation/failed.json',
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.errorMessage != null) {
                return Center(child: Text(state.errorMessage!));
              } else {
                final product = state.product!;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 300,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        state.product!.images!.isEmpty
                                            ? ''
                                            : state
                                                  .product!
                                                  .images!
                                                  .first
                                                  .image,
                                        fit: BoxFit.contain,
                                        // width: double.infinity,
                                        // height: 140,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            const Row(
                              children: [
                                Text(
                                  'Terdaftar Halal',
                                  // product.status == 'Halal' &&
                                  //         getDateLeft(product.expireDate!) < 0
                                  //     ? 'Expired'
                                  //     : product.status == 'Halal'
                                  //     ? 'Terdaftar Halal'
                                  //     : 'Belum Terdaftar Halal',
                                  style: TextStyle(
                                    color: ColorPalette.primary,
                                    // color:
                                    //     product.status == 'Halal' &&
                                    //         getDateLeft(product.expireDate!) > 0
                                    //     ? ColorPalette.kTealLight
                                    //     : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            const SizedBox(height: 8),

                            Text(
                              product.name!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 16),
                            Visibility(
                              visible: product.status == 'Halal',
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'No Sertifikat',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        product.certificateNumber!,
                                        style: const TextStyle(
                                          color: ColorPalette.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Berlaku ${product.registerDate}',
                                        //  - ${product.expireDate}',
                                        style: const TextStyle(
                                          color: ColorPalette.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // Visibility(
                                      //   visible:
                                      //       getDateLeft(product.expireDate!) <
                                      //           30 &&
                                      //       getDateLeft(product.expireDate!) >
                                      //           0,
                                      //   child: Text(
                                      //     '*Berlaku ${getDateLeft(product.expireDate!)} hari lagi',
                                      //     style: TextStyle(
                                      //       fontWeight: FontWeight.w500,
                                      //       color: ColorPalette.kRedDanger,
                                      //       fontSize: 12,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Divider(),
                            const Text(
                              'Deskripsi Produk',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.description!,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 16),

                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Kategori',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  product.category ?? '-',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Produsen',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      product.partner ?? '-',
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),

                            const SizedBox(height: 20),
                            Visibility(
                              visible: isAds == false,
                              child: const Text(
                                'Produk Yang Mungkin Anda Sukai',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isAds == false,
                        child: HistoryItems(
                          namaProduk:
                              ad?.name ?? state.adsCarousel!.name ?? '-',
                          status: ad != null ? ad!.status! : 'Halal',
                          expDate: ad != null ? ad!.expireDate! : '-',
                          imagePath:
                              ad?.image ?? state.adsCarousel!.image ?? '-',
                          id: ad?.id ?? state.adsCarousel!.productId!,
                          type: 'Iklan',
                          // namaProduk: ad != null
                          //     ? ad!.name!
                          //     : state.adsCarousel!.name,

                          // imagePath: ad != null
                          //     ? ad!.image!
                          //     : state.adsCarousel!.image,
                          // id: ad != null
                          //     ? ad!.id!
                          //     : state.adsCarousel!.productId,
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

int getDateLeft(String date) {
  final now = DateTime.now();
  final formatter = DateFormat("dd MMM yyyy");
  final targetDate = formatter.parse(date);

  final days = targetDate.difference(now).inDays;
  debugPrint('days left: ${days < 0}');
  return days;
}
