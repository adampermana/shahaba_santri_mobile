part of 'product_bloc.dart';

@freezed
abstract class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.startLoading() = _StartLoading;
  const factory ProductEvent.stopLoading() = _StopLoading;
  const factory ProductEvent.startSaveLoading(ProductData val) =
      _StartSaveLoading;
  const factory ProductEvent.searchImage(
    String imagePath,
    Map<String, double> coordinates,
  ) = _SearchImage;
  const factory ProductEvent.addLocalData(
    ProductData val,
    bool isLoading,
    Map<String, double> coordinates,
  ) = _AddLocalData;
  const factory ProductEvent.logAd(
    int productId,
    int campaignId,
    int creativeId,
    Map<String, double> coordinates,
    String type,
  ) = _LogAd;
  // const factory ProductEvent.getHistory() = _GetHistory;
  const factory ProductEvent.filterData(String val) = _FilterData;

  // new event
  const factory ProductEvent.getHistoryProductLimit({required int userId}) =
      _GetHistoryProductLimit;

  // Paginated product multiple
  const factory ProductEvent.getProductMultiple({
    required int userId,
    String? ids,
    String? search,
    int? produsenId,
    int? brandId,
    int? categoryId,
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _GetProductMultiple;

  const factory ProductEvent.getProductLimitMultiple({
    required int userId,
    String? ids,
    String? search,
    int? produsenId,
    int? brandId,
    int? categoryId,
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _GetProductLimitMultiple;
}
