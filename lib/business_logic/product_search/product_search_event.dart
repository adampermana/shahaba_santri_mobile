part of 'product_search_bloc.dart';

@freezed
class ProductSearchEvent with _$ProductSearchEvent {
  const factory ProductSearchEvent.search(String val) = _Search;
  const factory ProductSearchEvent.loadingClick() = _LoadingClick;
  const factory ProductSearchEvent.adLog(
    int index,
    String type,
    ProductData item,
    Map<String, double> coordinates,
  ) = _AdLog;
}
