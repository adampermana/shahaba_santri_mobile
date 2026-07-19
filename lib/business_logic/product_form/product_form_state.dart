part of 'product_form_bloc.dart';

@freezed
abstract class ProductFormState with _$ProductFormState {
  const factory ProductFormState({
    required GlobalKey<FormState> formKey,
    required String name,
    required String description,
    required int? produsen,
    required String image,
    required int? brandId,
    required bool isLoadingInitiate,
    required bool isLoading,
    required bool isSuccess,
    required bool isShowErrorMessage,
    required String? errorMessage,
    required List<DropdownItems> dataBrand,
    required List<DropdownItems> dataProdusen,
  }) = _ProductFormState;

  factory ProductFormState.initial() => ProductFormState(
    formKey: GlobalKey<FormState>(),
    name: '',
    description: '',
    produsen: null,
    dataProdusen: [],
    image: '',
    brandId: null,
    isLoadingInitiate: false,
    isSuccess: false,
    isLoading: false,
    errorMessage: null,
    dataBrand: [],
    isShowErrorMessage: false,
  );
}
