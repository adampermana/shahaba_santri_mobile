import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:sahaba_mobile/business_logic/product_detail/product_detail_bloc.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/search_history.dart';

class SingleItemSheet extends StatelessWidget {
  const SingleItemSheet({required this.id, super.key, this.ad});

  final ProductData? ad;

  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (context) =>
          sl<ProductDetailBloc>()..add(ProductDetailEvent.started(id)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hasil Pencocokan Produk',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorPalette.kWhite,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Daftar produk yang paling mirip',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorPalette.inverseOnSurface,
              ),
            ),
            const SizedBox(height: 14),
            BlocBuilder<ProductDetailBloc, ProductDetailState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.errorMessage != null) {
                  return Center(child: Text(state.errorMessage!));
                } else {
                  final product = state.product!;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.77,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.network(
                                            state.product!.images!.first.image,
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
                                      // product.status == 'Halal'
                                      //     ? 'Terdaftar Halal'
                                      //     : product.status == 'Halal' &&
                                      //           getDateLeft(
                                      //                 product.expireDate!,
                                      //               ) <
                                      //               0
                                      //     ? 'Expired'
                                      //     : 'Belum Terdaftar Halal',
                                      style: TextStyle(
                                        color: ColorPalette.kTeal, // color:
                                        //     product.status == 'Halal' &&
                                        //         getDateLeft(
                                        //               product.expireDate!,
                                        //             ) >
                                        //             0
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
                                              color:
                                                  ColorPalette.contentDisabled,
                                            ),
                                          ),
                                          Text(
                                            product.certificateNumber!,
                                            style: const TextStyle(
                                              color: ColorPalette.kGray200,
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
                                            'Terbit ${product.registerDate}',
                                            // - ${product.expireDate}',
                                            style: const TextStyle(
                                              color:
                                                  ColorPalette.inverseSecondary,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
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
                                    color: ColorPalette.contentDisabled,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product.description!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: ColorPalette.inverseSecondary,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // ✅ Kategori
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Kategori',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: ColorPalette.contentDisabled,
                                      ),
                                    ),
                                    Text(
                                      product.category ?? '-',
                                      style: const TextStyle(
                                        color: ColorPalette.inverseSecondary,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),

                                // ✅ Produsen
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Produsen',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: ColorPalette.contentDisabled,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          product.partner ?? '-',
                                          style: const TextStyle(
                                            color:
                                                ColorPalette.inverseSecondary,
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
                                  visible:
                                      ad != null ||
                                      product.type?.toLowerCase() == 'iklan',
                                  child: const Text(
                                    'Produk Yang Mungkin Anda Sukai',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: ColorPalette.contentDisabled,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                          if (ad != null ||
                              product.type?.toLowerCase() == 'iklan')
                            HistoryItems(
                              namaProduk: ad!.name!,
                              status: ad!.status!,
                              registerDate: ad!.expireDate!,
                              imagePath: ad!.image!,
                              id: ad!.id!,
                              type: 'Iklan',
                            )
                          else
                            const SizedBox.shrink(),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

int getDateLeft(String date) {
  final now = DateTime.now();
  final formatter = DateFormat('dd MMM yyyy');
  final targetDate = formatter.parse(date);

  final days = targetDate.difference(now).inDays;

  return days;
}
