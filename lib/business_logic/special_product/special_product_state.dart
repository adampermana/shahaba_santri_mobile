part of 'special_product_bloc.dart';

@freezed
abstract class SpecialProductState with _$SpecialProductState {
  const factory SpecialProductState({
    required bool isLoading,
    required int page,
    required int lastPage,
    required String? errorMessage,
    required List<AdResponseData> data,
    required List<ProductData> dataProdusenProduct,
    required List<ProductData> dataAds,
    required bool isLoadingNextPage,
    required List<ProductData> dataAdsTop10,
    // Brand Data
    required bool getBrandDataLoading,
    required bool getBrandDataSuccess,
    required String getBrandDataErrorMessage,
    required List<Brand> dataBrand,
  }) = _SpecialProductState;
  factory SpecialProductState.initial() => const SpecialProductState(
    isLoading: false,
    isLoadingNextPage: false,
    lastPage: 2,
    errorMessage: null,
    data: [],
    dataProdusenProduct: [],
    dataAds: [],
    dataAdsTop10: [],
    page: 1,
    // Brand Data
    getBrandDataLoading: false,
    getBrandDataSuccess: false,
    getBrandDataErrorMessage: '',
    dataBrand: [],
  );
}
