import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
import 'package:sahaba_mobile/business_logic/product_bloc/product_bloc.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/screens/camera_screen/widget/form_sheet.dart';

class NotFoundSheet extends StatelessWidget {
  const NotFoundSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final locationBloc = context.read<LocationBloc>();
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(34, 13, 34, 34),
          decoration: const BoxDecoration(
            color: ColorPalette.scaffoldBackground,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 31,
                height: 4,
                decoration: BoxDecoration(
                  color: ColorPalette.kGray200,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              const SizedBox(height: 42),

              // const SizedBox(height: 14),
              const Text(
                'Data Belum Tersedia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.kWhite,
                ),
              ),

              const SizedBox(height: 9),

              const Text(
                'Kami belum menemukan informasi untuk produk ini. Bantu '
                'kami melengkapi database dengan melaporkan produk ini!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: ColorPalette.kGray200,
                  height: 1.25,
                ),
              ),

              const SizedBox(height: 27),

              SizedBox(
                width: 175,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // kembali ke camera
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalette.primary,
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Coba Lagi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: 175,
                height: 44,
                child: ElevatedButton(
                  onPressed: () async {
                    final draggableController = DraggableScrollableController();

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
                      builder: (_) => PopScope(
                        canPop: false,
                        child: DraggableScrollableSheet(
                          initialChildSize: 0.9,
                          minChildSize: 0.5,
                          controller: draggableController,
                          maxChildSize: 0.9,
                          expand: false,
                          shouldCloseOnMinExtent: false,
                          // snapSizes: [0.33, 0.45],
                          builder: (_, scrollController) => BlocProvider.value(
                            value: locationBloc,
                            child: FormSheet(image: state.imagePath),
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB39164),
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
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
            ],
          ),
        );
      },
    );
  }
}
