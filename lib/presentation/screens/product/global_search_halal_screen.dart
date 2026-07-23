import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:lottie/lottie.dart';
import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
import 'package:sahaba_mobile/business_logic/product_search/product_search_bloc.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/product/detail_product_screen.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_dialogs_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/loading_screen.dart';
import 'package:sahaba_mobile/presentation/widgets/search_bar_widget.dart';
import 'package:sahaba_mobile/presentation/widgets/search_history.dart';

class SearchProductHalalScreen extends StatelessWidget {
  const SearchProductHalalScreen({super.key});

  // static const Map<String, double> _fallbackCoordinates = {
  //   'latitude': 0.0,
  //   'longitude': 0.0,
  // };

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductSearchBloc>(
          create: (context) => sl<ProductSearchBloc>(),
        ),
        BlocProvider<LocationBloc>(
          create: (context) => sl<LocationBloc>()
            ..add(const LocationEvent.getCurrentLocation(isGetPosition: true)),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ProductSearchBloc, ProductSearchState>(
            listenWhen: (previous, current) =>
                previous.isLoadingClick != current.isLoadingClick,
            listener: (context, state) {
              if (state.isLoadingClick == true) {
                LoadingOverlay.show(
                  context,
                  barrierOpacity: 0.7,
                  message: 'Memproses...',
                  content: Lottie.asset(
                    width: 80,
                    fit: BoxFit.contain,
                    'assets/animation/loading.json',
                  ),
                );
              } else {
                LoadingOverlay.hide();
                if (Navigator.of(context, rootNavigator: true).canPop()) {
                  Navigator.of(context, rootNavigator: true).pop();
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailProductScreen(
                      id: state.selectedProducts!.id!,
                      isAds:
                          state.selectedProducts!.type?.toLowerCase() ==
                          'iklan',
                    ),
                  ),
                );
              }
            },
          ),
          BlocListener<LocationBloc, LocationState>(
            listenWhen: (previous, current) => previous.alert != current.alert,
            listener: (context, state) {
              if (state.alert != null) {
                showAlertDialog(
                  context,
                  alert: state.alert,
                  title: state.titleError,
                  message: state.messageError,
                  onRefresh: () => context.read<LocationBloc>().add(
                    const LocationEvent.getCurrentLocation(isGetPosition: true),
                  ),
                );
              }
            },
          ),
        ],
        child: AppScaffold(
          appBar: CustomAppBar.buildAppBarSimple(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 0,
            leading: const SizedBox.shrink(),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: SizedBox.shrink(),
            ),
            titleWidget: Text(
              'Pencarian',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorPalette.kWhite,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => context.pop(),
                icon: SvgPicture.asset(
                  AppIcons.closeLine,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    ColorPalette.kWhite,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          body: BlocBuilder<ProductSearchBloc, ProductSearchState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBarWidget(
                      controller: controller,
                      hintText: 'Cari produk disini',
                      onChanged: (v) {
                        context.read<ProductSearchBloc>().add(
                          ProductSearchEvent.search(v),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: state.search == ''
                          ? const SizedBox.shrink()
                          : Text.rich(
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              TextSpan(
                                text: 'Hasil Pencarian ',
                                children: [
                                  TextSpan(
                                    text: '"${state.search}"',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),

                    // Bagian scrollable harus memakai Expanded
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: state.isLoading == true
                            ? const Center(child: CircularProgressIndicator())
                            : state.errorMessage != null
                            ? Text(state.errorMessage!)
                            : ListView.builder(
                                itemCount: state.products.length,
                                itemBuilder: (context, index) {
                                  final item = state.products[index];
                                  return HistoryItems(
                                    onTap: () async {
                                      try {
                                        final locationState = context
                                            .read<LocationBloc>()
                                            .state;
                                        final coordinates =
                                            locationState.locations;
                                        if (coordinates == null) {
                                          context.read<LocationBloc>().add(
                                            const LocationEvent.getCurrentLocation(
                                              isGetPosition: true,
                                            ),
                                          );
                                          return;
                                        }
                                        context.read<ProductSearchBloc>().add(
                                          const ProductSearchEvent.loadingClick(),
                                        );
                                        // if (item.type == 'Iklan') {
                                        context.read<ProductSearchBloc>().add(
                                          ProductSearchEvent.adLog(
                                            item.campaignId ?? 0,
                                            'Click',
                                            item,
                                            coordinates,
                                          ),
                                        );
                                        // }
                                      } on Exception catch (e) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(content: Text(e.toString())),
                                        );
                                      }
                                    },
                                    type: item.type ?? '-',
                                    id: item.id ?? 0,
                                    namaProduk: item.name ?? '',
                                    status: item.status ?? '',
                                    registerDate: item.registerDate ?? '',
                                    imagePath: item.image ?? '',
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
