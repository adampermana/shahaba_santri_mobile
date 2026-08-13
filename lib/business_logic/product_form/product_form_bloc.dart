import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/product/report/product_report.dart';

import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/product/dropdown_data/dropdown_data.dart';
import 'package:sahaba_mobile/infrastructure/product/repository/i_product_repository.dart';
import 'package:sahaba_mobile/infrastructure/services/location_permission_service.dart';
import 'package:sahaba_mobile/infrastructure/services/ocr_service.dart';

part 'product_form_bloc.freezed.dart';
part 'product_form_event.dart';
part 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  ProductFormBloc(this._repo, this._local, this._locationPermissionService)
    : super(ProductFormState.initial()) {
    on<_Started>(_onStarted);
    on<_Submit>(_onSubmit);
    on<_NameChange>(_onNameChange);
    on<_DescriptionChange>(_onDescriptionChange);
    on<_ImageChange>(_onImageChange);
    on<_BrandChange>(_onBrandChange);
    on<_ProdusenChange>(_onProdusenChange);
  }
  final IProductRepository _repo;
  final IAuthLocalDatasource _local;
  final LocationPermissionService _locationPermissionService;
  // final DeviceInfoService _deviceInfoService;

  Future<void> _onStarted(
    _Started event,
    Emitter<ProductFormState> emit,
  ) async {
    emit(state.copyWith(isLoadingInitiate: true));
    // final dataCategory = await _repo.getCategories();
    final dataProdusen = await _repo.getProdusen();
    final name = await OcrService.extractBigText(event.imagePath);
    emit(state.copyWith(image: event.imagePath, name: name));
    dataProdusen.fold(
      (l) => emit(
        state.copyWith(isLoadingInitiate: false, errorMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(
          isLoadingInitiate: false,
          // dataCategory: r,
          dataProdusen: r,
          isSuccess: true,
        ),
      ),
    );
  }

  Future<void> _onSubmit(_Submit event, Emitter<ProductFormState> emit) async {
    final isValid = (state.formKey.currentState!).validate();
    if (isValid) {
      emit(state.copyWith(isLoading: true));
      final data = _local.authUserDataHive ?? _local.authGuestDataHive;
      final locationDetail = await _locationPermissionService
          .getAddressFromCoordinates(event.coordinates);
      // final device = await _deviceInfoService.deviceInfo();

      final payload = ProductReport(
        person: data?.name ?? 'Guest',
        deviceId: data?.phoneNumber ?? '',
        lat: event.coordinates['latitude']!,
        long: event.coordinates['longitude']!,
        kelurahan: locationDetail['district']!,
        kecamatan: locationDetail['locality']!,
        provinsi: locationDetail['province']!,
        brandId: state.brandId!,
        image: state.image,
        name: state.name,
        description: state.description,
        partner: state.produsen!,
      );
      final result = await _repo.postReport(payload);
      result.fold(
        (l) => emit(state.copyWith(errorMessage: l.message, isLoading: false)),
        (r) => emit(state.copyWith(isSuccess: r, isLoading: false)),
      );
    }
  }

  void _onNameChange(_NameChange event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(name: event.val));
  }

  void _onDescriptionChange(
    _DescriptionChange event,
    Emitter<ProductFormState> emit,
  ) {
    emit(state.copyWith(description: event.val));
  }

  void _onImageChange(_ImageChange event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(image: event.val));
  }

  void _onBrandChange(_BrandChange event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(brandId: event.val));
  }

  Future<void> _onProdusenChange(
    _ProdusenChange event,
    Emitter<ProductFormState> emit,
  ) async {
    final data = await _repo.getBrand(event.val);

    data.fold(
      (l) => emit(state.copyWith(errorMessage: l.message)),
      (r) => emit(
        state.copyWith(dataBrand: r, produsen: event.val, brandId: null),
      ),
    );
  }
}
