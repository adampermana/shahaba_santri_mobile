import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';

import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/product/ad_log_payload/ad_log_payload.dart';
import 'package:sahaba_mobile/infrastructure/product/log_payload/product_log_payload.dart';
import 'package:sahaba_mobile/infrastructure/product/repository/i_product_repository.dart';
import 'package:sahaba_mobile/infrastructure/services/location_permission_service.dart';

part 'product_search_event.dart';
part 'product_search_state.dart';
part 'product_search_bloc.freezed.dart';

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  static const Map<String, double> _fallbackCoordinates = {
    'latitude': 0.0,
    'longitude': 0.0,
  };

  ProductSearchBloc(
    this._repo,
    this._localDataSource,
    this._locationInfoService,
  ) : super(ProductSearchState.initial()) {
    on<_Search>(_onSearch);
    on<_LoadingClick>(_onLoadingClick);
    on<_AdLog>(_onAdLog);
  }

  final IProductRepository _repo;
  final IAuthLocalDatasource _localDataSource;
  final LocationPermissionService _locationInfoService;

  Future<void> _onSearch(
    _Search event,
    Emitter<ProductSearchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _repo.getSearchProduct(event.val);
    var coordinates = _fallbackCoordinates;
    final locationResult = await _locationInfoService.getCurrentPosition();
    locationResult.fold(
      (_) {},
      (position) => coordinates = {
        'latitude': position.latitude,
        'longitude': position.longitude,
      },
    );
    result.fold(
      (l) => emit(state.copyWith(errorMessage: l.message, isLoading: false)),
      (r) {
        final ad = r
            .where((product) => product.type?.toLowerCase() == 'iklan')
            .toList();
        for (final e in ad) {
          add(
            ProductSearchEvent.adLog(
              r.indexOf(e),
              'Impression',
              e,
              coordinates,
            ),
          );
        }

        emit(state.copyWith(products: r, isLoading: false, search: event.val));
      },
    );
  }

  void _onLoadingClick(
    _LoadingClick event,
    Emitter<ProductSearchState> emit,
  ) async {
    emit(state.copyWith(isLoadingClick: true));
  }

  Future<void> _onAdLog(_AdLog event, Emitter<ProductSearchState> emit) async {
    final locationDetail = await _locationInfoService.getAddressFromCoordinates(
      event.coordinates,
    );
    final dataLocal = _localDataSource.authGuestDataHive;

    final response = ProductLogPayload(
      eventType: 'Search',
      deviceId: dataLocal?.phoneNumber ?? 'Guest',
      user: dataLocal?.name ?? 'Guest',
      brandId: event.item.brandId ?? 0,
      image:
          event.item.image ??
          (event.item.images?.isNotEmpty == true
              ? event.item.images!.first.image
              : ''),
      disctrict: locationDetail['district']!,
      kecamatan: locationDetail['locality']!,
      province: locationDetail['province']!,
      lat: event.coordinates['latitude']!,
      long: event.coordinates['longitude']!,
      categoryId: event.item.categoryId ?? 0,
      partnerId: event.item.partnerId ?? 0,
      productId: event.item.id ?? 0,
      statusHalal: event.item.status ?? '',
    );

    final payload = AdLogPayload(
      creativeId: event.item.creativeId,
      productId: event.item.id ?? 0,
      eventType: event.type,
      user: dataLocal?.name ?? 'Guest',
      phoneNumber: dataLocal?.phoneNumber ?? '',
      campaignId: event.index,
      kelurahan: locationDetail['district']!,
      kecamatan: locationDetail['locality']!,
      provinsi: locationDetail['province']!,
      lat: event.coordinates['latitude']!,
      long: event.coordinates['longitude']!,
    );

    await _repo.sendLog(response);
    if (event.item.type?.toLowerCase() == 'iklan') {
      await _repo.sendAdLog(payload);
    }
    emit(state.copyWith(selectedProducts: event.item, isLoadingClick: false));
  }
}
