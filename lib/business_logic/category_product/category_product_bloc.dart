import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';

import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/product/ad_log_payload/ad_log_payload.dart';
import 'package:sahaba_mobile/infrastructure/product/category/category.dart';
import 'package:sahaba_mobile/infrastructure/product/repository/i_product_repository.dart';
import 'package:sahaba_mobile/infrastructure/services/location_permission_service.dart';

part 'category_product_event.dart';
part 'category_product_state.dart';
part 'category_product_bloc.freezed.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  CategoryProductBloc(
    this._repo,
    this._localDataSource,
    this._locationPermissionService,
  ) : super(CategoryProductState.initial()) {
    on<_Started>(_onStarted);
    on<_StartedCategory>(_onStartedCategory);
    on<_Search>(_onSearch);
    on<_AdLog>(_onAdLog);
  }

  final IProductRepository _repo;
  final IAuthLocalDatasource _localDataSource;
  final LocationPermissionService _locationPermissionService;

  Future<void> _onStarted(
    _Started event,
    Emitter<CategoryProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _repo.getProductByCategory(event.id);
    result.fold(
      (l) => emit(state.copyWith(errorMessage: l.message, isLoading: false)),
      (r) => emit(state.copyWith(products: r, data: r, isLoading: false)),
    );
  }

  Future<void> _onStartedCategory(
    _StartedCategory event,
    Emitter<CategoryProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _repo.getCategory();
    result.fold(
      (l) => emit(state.copyWith(errorMessage: l.message, isLoading: false)),
      (r) => emit(state.copyWith(category: r.data, isLoading: false)),
    );
  }

  Future<void> _onSearch(
    _Search event,
    Emitter<CategoryProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, search: event.val));
    final List<ProductData> filtered = event.val.isEmpty
        ? state.data
        : state.data
              .where(
                (p) => p.name!.toLowerCase().contains(event.val.toLowerCase()),
              )
              .toList();
    emit(state.copyWith(products: filtered, isLoading: false));
  }

  Future<void> _onAdLog(
    _AdLog event,
    Emitter<CategoryProductState> emit,
  ) async {
    final locationDetail = await _locationPermissionService
        .getAddressFromCoordinates(event.coordinates);
    final dataLocal = _localDataSource.authGuestDataHive;

    final payload = AdLogPayload(
      creativeId: event.id.creativeId,
      productId: event.id.id,
      user: dataLocal?.name ?? 'Guest',
      phoneNumber: dataLocal?.phoneNumber ?? '',
      campaignId: event.id.campaignId,
      eventType: 'Click',
      kelurahan: locationDetail['district']!,
      kecamatan: locationDetail['locality']!,
      provinsi: locationDetail['province']!,
      lat: event.coordinates['latitude']!,
      long: event.coordinates['longitude']!,
    );
    await _repo.sendAdLog(payload);
  }
}
