import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
import 'package:sahaba_mobile/business_logic/product_bloc/product_bloc.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/screens/camera_screen/widget/form_sheet.dart';

class ProductSearchResultSheet extends StatelessWidget {
  const ProductSearchResultSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // indikator kecil di atas
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
          const SizedBox(height: 16),

          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.data.length > 4
                            ? 4
                            : state.data.length,
                        itemBuilder: (context, index) {
                          final item = state.data[index];
                          return Column(
                            children: [
                              Visibility(
                                visible: item.type?.toLowerCase() == 'iklan',
                                child: const Column(
                                  children: [
                                    SizedBox(height: 8),
                                    Divider(),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      item.type?.toLowerCase() == 'iklan'
                                      ? 0
                                      : 16,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    try {
                                      final coordinates = context
                                          .read<LocationBloc>()
                                          .state
                                          .locations;
                                      if (coordinates == null) {
                                        context.read<LocationBloc>().add(
                                          const LocationEvent.getCurrentLocation(
                                            isGetPosition: true,
                                          ),
                                        );
                                        return;
                                      }
                                      context.read<ProductBloc>().add(
                                        ProductEvent.startSaveLoading(item),
                                      );
                                      context.read<ProductBloc>().add(
                                        ProductEvent.addLocalData(
                                          item,
                                          true,
                                          coordinates,
                                        ),
                                      );
                                    } catch (e) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text(e.toString())),
                                      );
                                    }
                                  },
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: item.type?.toLowerCase() == 'iklan'
                                          ? const Color(
                                              0xff670075,
                                            ).withValues(alpha: 0.2)
                                          : Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal:
                                            item.type?.toLowerCase() == 'iklan'
                                            ? 16
                                            : 0,
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 60,
                                            height: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                item.image ?? '',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (item.type?.toLowerCase() !=
                                                    'iklan')
                                                  const SizedBox.shrink()
                                                else
                                                  DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: Colors.deepPurple,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10000,
                                                          ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 2,
                                                          ),
                                                      child: Text(
                                                        item.type ?? '',
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  item.name ?? '',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorPalette.kWhite,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                if (item.status == 'Halal')
                                                  Row(
                                                    children: [
                                                      Text(
                                                        item.status ?? '',
                                                        style: const TextStyle(
                                                          color: ColorPalette
                                                              .kTeal,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      const Text(
                                                        '|',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Text(
                                                        item.expireDate ?? '',
                                                        style: const TextStyle(
                                                          color: ColorPalette
                                                              .inverseOnSurface,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                else
                                                  Text(
                                                    item.status ?? '',
                                                    style: const TextStyle(
                                                      color:
                                                          ColorPalette.kRed500,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 16,
                                            color: ColorPalette.kWhite,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Visibility(
                              //   visible: item.type.toLowerCase() == 'iklan',
                              //   child: Column(
                              //     children: [
                              //       const SizedBox(height: 8),
                              //       const Divider(),
                              //       const SizedBox(height: 8),
                              //     ],
                              //   ),
                              // ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Tidak Ditemukan Produk yang cocok?',
                        style: TextStyle(
                          color: ColorPalette.inverseOnSurface,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final draggableController =
                                  DraggableScrollableController();
                              final locationBloc = context.read<LocationBloc>();

                              Navigator.pop(context); // kembali ke camera
                              await showModalBottomSheet<void>(
                                isDismissible: false,
                                isScrollControlled: true,
                                enableDrag: false,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                context: context,
                                builder: (_) => BlocProvider.value(
                                  value: locationBloc,
                                  child: PopScope(
                                    canPop: false,
                                    child: DraggableScrollableSheet(
                                      initialChildSize: 0.9,
                                      minChildSize: 0.5,
                                      controller: draggableController,
                                      maxChildSize: 0.9,
                                      expand: false,
                                      shouldCloseOnMinExtent: false,
                                      // snapSizes: [0.33, 0.45],
                                      builder: (_, scrollController) =>
                                          FormSheet(image: state.imagePath),
                                    ),
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPalette.primary,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Laporkan Produk',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
