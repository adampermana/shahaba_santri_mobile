import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/business_logic/city_search_bloc/city_search_bloc.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_cubit.dart';
import 'package:sahaba_mobile/business_logic/location_cubit/location_state.dart';
import 'package:sahaba_mobile/domains/city_model/city_model.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

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
      _showLocationErrorSnackBar(context, state.message);
    }
  }

  void _showLocationErrorSnackBar(BuildContext context, String message) {
    final textTheme = Theme.of(context).textTheme;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: ColorPalette.kWhite,
          padding: EdgeInsets.zero,
          elevation: 0.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Padding(
            padding: const EdgeInsets.fromLTRB(14, 16, 14, 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _locationSnackBarTitle(message),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: ColorPalette.kBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _locationSnackBarDescription(message),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorPalette.contentTertiary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  String _locationSnackBarTitle(String message) {
    if (_isPermissionDeniedMessage(message)) {
      return 'Akses lokasi ditolak';
    }

    return 'Tidak bisa mendapatkan lokasi saat ini';
  }

  String _locationSnackBarDescription(String message) {
    if (_isPermissionDeniedMessage(message)) {
      return 'Aktifkan di pengaturan agar jadwal lebih akurat.';
    }

    return message;
  }

  bool _isPermissionDeniedMessage(String message) {
    final normalizedMessage = message.toLowerCase();
    return normalizedMessage.contains('izin lokasi ditolak') ||
        normalizedMessage.contains('akses lokasi ditolak');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<LocationCubit, LocationState>(
      listener: _onLocationChanged,
      child: AppScaffold(
        appBar: _buildAppBar(context, textTheme),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GlassContainer.clearGlass(
                height: 56,
                width: double.infinity,
                blur: 18,
                borderRadius: BorderRadius.circular(24),
                borderColor: Colors.white,
                borderWidth: 1,
                shadowColor: Colors.black.withValues(alpha: .1),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: .10),
                    Colors.white.withValues(alpha: .08),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 18),
                    SvgPicture.asset(
                      AppIcons.searchLine,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        Colors.white.withValues(alpha: .85),
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        textInputAction: TextInputAction.search,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Cari Kota',
                          hintStyle: TextStyle(
                            color: Color(0xFFA6A6A6),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onChanged: (value) {
                          context.read<CitySearchBloc>().add(
                            CitySearchEvent.searchCity(value),
                          );
                        },
                      ),
                    ),
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _searchController,
                      builder: (_, value, _) {
                        if (value.text.isEmpty) {
                          return const SizedBox(width: 18);
                        }

                        return IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            _searchController.clear();
                            context.read<CitySearchBloc>().add(
                              const CitySearchEvent.clearSearch(),
                            );
                          },
                          icon: SvgPicture.asset(
                            AppIcons.closeLine,
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              Colors.white.withValues(alpha: .75),
                              BlendMode.srcIn,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            _UseCurrentLocationRow(
              onTap: _onUseLocation,
            ),
            const Divider(height: 1, color: Color(0x28E8E8E8)),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    TextTheme textTheme,
  ) {
    return CustomAppBar.buildAppBarSimple(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 0,
      leading: const SizedBox.shrink(),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: SizedBox.shrink(),
      ),
      titleWidget: Text(
        'Pilih Kota',
        style: textTheme.titleLarge?.copyWith(
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
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
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
                    color: ColorPalette.kWhite,
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
                color: ColorPalette.kWhite,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
