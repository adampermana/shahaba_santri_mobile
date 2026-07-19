part of 'product_detail_bloc.dart';

@freezed
abstract class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.started(int id) = _Started;
}
