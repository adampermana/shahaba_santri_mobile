import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/city_search/city_search_bloc.dart';
import 'package:sahaba_mobile/business_logic/location/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/location/location_state.dart';
import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({super.key});

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<CitySearchBloc>()..add(const CitySearchEvent.getAllCities()),
      child: const _SelectCityView(),
    );
  }
}

class _SelectCityView extends StatefulWidget {
  const _SelectCityView();

  @override
  State<_SelectCityView> createState() => _SelectCityViewState();
}

class _SelectCityViewState extends State<_SelectCityView> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onCitySelected(CityModel city) {
    unawaited(context.read<LocationCubit>().selectCity(city));
  }

  void _onUseLocation() {
    unawaited(context.read<LocationCubit>().getCurrentLocation());
  }

  void _onLocationChanged(BuildContext context, LocationState state) {
    if (state is LocationLoaded) {
      context.pop(state.city);
      return;
    }

    if (state is LocationError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<LocationCubit, LocationState>(
      listener: _onLocationChanged,
      child: Scaffold(
        backgroundColor: ColorPalette.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: ColorPalette.scaffoldBackgroundAppBar,
          elevation: 0,
          centerTitle: false,
          leadingWidth: 0,
          titleSpacing: 16,
          leading: const SizedBox.shrink(),
          title: Text(
            'Pilih Kota',
            style: textTheme.titleLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorPalette.contentSecondary,
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
                  ColorPalette.kBlack,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: _SearchField(
                controller: _searchController,
                onChanged: (value) {
                  context.read<CitySearchBloc>().add(
                    CitySearchEvent.searchCity(value),
                  );
                },
                onClear: () {
                  _searchController.clear();
                  context.read<CitySearchBloc>().add(
                    const CitySearchEvent.clearSearch(),
                  );
                },
              ),
            ),
            const Divider(height: 1, color: ColorPalette.borderTransparent),
            _UseCurrentLocationRow(
              onTap: _onUseLocation,
            ),
            const Divider(height: 1, color: ColorPalette.borderTransparent),
            Expanded(
              child: BlocBuilder<CitySearchBloc, CitySearchState>(
                builder: (context, state) {
                  final isLoading =
                      state.getAllCitiesLoading || state.searchCityLoading;
                  final hasError =
                      state.getAllCitiesErrorMessage.isNotEmpty ||
                      state.searchCityErrorMessage.isNotEmpty;
                  final errorMessage = state.getAllCitiesErrorMessage.isNotEmpty
                      ? state.getAllCitiesErrorMessage
                      : state.searchCityErrorMessage;

                  final hasSearchQuery = _searchController.text
                      .trim()
                      .isNotEmpty;
                  final cities = hasSearchQuery
                      ? state.searchResults
                      : state.cities;

                  if (isLoading) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(
                            color: ColorPalette.primaryColor,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            hasSearchQuery
                                ? 'Sedang mencari kota'
                                : 'Sedang memuat kota',
                            style: textTheme.bodyMedium?.copyWith(
                              color: ColorPalette.contentTertiary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          errorMessage,
                          style: textTheme.bodyMedium?.copyWith(
                            color: ColorPalette.contentTertiary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  if (cities.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'Kota tidak ditemukan',
                          style: textTheme.bodyMedium?.copyWith(
                            color: ColorPalette.contentTertiary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: cities.length,
                    separatorBuilder: (_, _) => const Divider(
                      height: 1,
                      color: ColorPalette.borderTransparent,
                    ),
                    itemBuilder: (context, index) {
                      final city = cities[index];
                      return _CityTile(
                        city: city,
                        onTap: () => _onCitySelected(city),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: ColorPalette.surfaceTertiary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        style: const TextStyle(
          color: ColorPalette.kBlack,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintText: 'Cari Kota',
          hintStyle: const TextStyle(
            color: ColorPalette.kGrayHintText,
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(11),
            child: SvgPicture.asset(
              AppIcons.searchLine,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                ColorPalette.kGrayHintText,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (_, value, _) {
              if (value.text.isEmpty) return const SizedBox.shrink();
              return IconButton(
                onPressed: onClear,
                icon: SvgPicture.asset(
                  AppIcons.closeLine,
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                    ColorPalette.kGrayHintText,
                    BlendMode.srcIn,
                  ),
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _UseCurrentLocationRow extends StatelessWidget {
  const _UseCurrentLocationRow({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        final isLoading = state is LocationLoading;

        return InkWell(
          onTap: isLoading ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                if (isLoading)
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: ColorPalette.primaryColor,
                    ),
                  )
                else
                  SvgPicture.asset(
                    AppIcons.mapPin2Line,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      ColorPalette.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                const SizedBox(width: 8),
                Text(
                  'Gunakan lokasi saat ini',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: ColorPalette.contentSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CityTile extends StatelessWidget {
  const _CityTile({required this.city, required this.onTap});

  final CityModel city;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              city.lokasi ?? '-',
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: ColorPalette.contentSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
