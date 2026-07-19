import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/screens/product/product_page.dart';

// // Ini Existing dan nanti ga akan saya gunakan

// class SearchHistory extends StatelessWidget {
//   const SearchHistory({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ProductBloc>.value(
//       value: context.read<ProductBloc>()..add(const ProductEvent.getHistory()),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             BlocBuilder<ProductBloc, ProductState>(
//               builder: (context, state) {
//                 if (state.isLoading) {
//                   return Center(
//                     child: CircularProgressIndicator(color: Colors.grey[400]),
//                   );
//                 } else if (state.dataHistory.isEmpty) {
//                   return SizedBox(
//                     height: 64,
//                     child: const Center(
//                       child: Text('Belum ada riwayat pencarian'),
//                     ),
//                   );
//                 } else {
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: state.dataHistory.length,
//                     itemBuilder: (context, index) {
//                       final item = state.dataHistory[index];
//                       debugPrint('ini item ${item.name}');
//                       return HistoryItems(
//                         type: '',
//                         id: item.id ?? 0,
//                         namaProduk: item.name ?? '',
//                         status: item.status ?? '',
//                         expDate: item.expireDate ?? '',
//                         imagePath: item.images.isNotEmpty
//                             ? item.images.first.image
//                             : '',
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HistoryItems extends StatelessWidget {
  final String namaProduk;
  final String status;
  final String expDate;
  final String imagePath;
  final String type;
  final int id;
  final Function()? onTap;

  const HistoryItems({
    super.key,
    required this.namaProduk,
    required this.status,
    required this.expDate,
    required this.imagePath,
    required this.id,
    required this.type,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(100),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: type.toLowerCase() != 'iklan'
              ? Colors.transparent
              : ColorPalette.kPurple800.withValues(alpha: 0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap:
                    onTap ??
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailPage(id: id, isAds: type == 'Iklan'),
                        ),
                      );
                    },
                child: Row(
                  children: [
                    SizedBox(
                      width: 106,
                      height: 72,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(imagePath, fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (type.toLowerCase() != 'iklan')
                            const SizedBox.shrink()
                          else
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: ColorPalette.kPurple800,
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
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (status == 'Halal')
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$status ',
                                    style: const TextStyle(
                                      color: ColorPalette.primary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // TextSpan(
                                  //   text: '| ',
                                  //   style: TextStyle(
                                  //     color: ColorPalette.kGray200,
                                  //     fontSize: 12,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // TextSpan(
                                  //   text: 'Sampai $expDate',
                                  //   style: const TextStyle(
                                  //     color: ColorPalette.kGray600,
                                  //     fontSize: 12,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                ],
                              ),
                            )
                          else
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$status ',
                                    style: const TextStyle(
                                      color: ColorPalette.kGray200,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
