import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:sahaba_mobile/business_logic/special_product/special_product_bloc.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/screens/product/widget/special_product_header_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/search_history.dart';

class ListDetailBrandByProductScreen extends StatelessWidget {
  const ListDetailBrandByProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
    );
  }
}

class BrandDetailPage extends StatelessWidget {
  const BrandDetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialProductBloc, SpecialProductState>(
      builder: (context, state) {
        final item = state.data.firstWhere((element) => element.id == id);
        return Scaffold(
          backgroundColor: ColorPalette.scaffoldBackground,
          body: Column(
            children: [
              SpecialProductHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Galeri Produk",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final text = item.campaignName;
                              const textStyle = TextStyle(
                                color: ColorPalette.kRed300,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              );

                              // Hitung apakah text overflow
                              final tp = TextPainter(
                                text: TextSpan(text: text, style: textStyle),
                                maxLines: 1,
                                textDirection: TextDirection.ltr,
                              )..layout(maxWidth: constraints.maxWidth);

                              final isOverflow = tp.didExceedMaxLines;

                              return SizedBox(
                                height: 35,
                                child: isOverflow
                                    ? Marquee(
                                        text: text ?? '-',
                                        style: textStyle,
                                        velocity: 35,
                                        blankSpace: 40,
                                        startPadding: 10,
                                      )
                                    : Text(
                                        text ?? '-',
                                        style: textStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorPalette.kTeal,
                            width: 6,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            4,
                          ), // beri jarak agar border tidak tertutup
                          child: ClipOval(
                            child: Image.network(
                              item.image ?? '-',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: state.isLoading == true
                      ? const Center(child: CircularProgressIndicator())
                      : state.errorMessage != null
                      ? Text(state.errorMessage!)
                      : ListView.builder(
                          itemCount: state.dataProdusenProduct.length,
                          itemBuilder: (context, index) {
                            final item = state.dataProdusenProduct[index];
                            return HistoryItems(
                              type: item.type ?? '-',
                              id: item.id ?? 0,
                              namaProduk: item.name ?? '',
                              status: item.status ?? '',
                              registerDate: item.expireDate ?? '',
                              imagePath: item.images?.isNotEmpty == true
                                  ? item.images![0].image
                                  : '',
                            );
                          },
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
