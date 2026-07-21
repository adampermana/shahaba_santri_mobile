part of 'product_search_bloc.dart';

@freezed
abstract class ProductSearchState with _$ProductSearchState {
  const factory ProductSearchState({
    required List<ProductData> products,
    required ProductData? selectedProducts,
    required bool isLoading,
    required bool isLoadingClick,
    required String? errorMessage,
    required String search,
  }) = _ProductSearchState;
  factory ProductSearchState.initial() => const ProductSearchState(
    products: [],
    isLoading: false,
    isLoadingClick: false,
    errorMessage: null,
    selectedProducts: null,
    search: '',
  );
}
