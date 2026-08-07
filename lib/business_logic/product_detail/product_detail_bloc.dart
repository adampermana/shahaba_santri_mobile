import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/ads/ads_response.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';
import 'package:sahaba_mobile/infrastructure/product/repository/i_product_repository.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';
part 'product_detail_bloc.freezed.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(this._repo) : super(ProductDetailState.initial()) {
    on<_Started>(_onStarted);
  }

  final IProductRepository _repo;

  Future<void> _onStarted(
    _Started event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, product: null));
    final result = await _repo.getProduct(event.id);
    result.fold(
      (l) => emit(state.copyWith(errorMessage: l.message, isLoading: false)),
      (r) async {
        emit(state.copyWith(product: r, isLoading: true));

        // Use product_category_id from product to fetch ads by category
        final adsResult = await _repo.getAdsByCategory(r.categoryId ?? 0);
        adsResult.fold(
          (l) => emit(state.copyWith(errorMessage: l.message, isLoading: false)),
          (rAds) {
            if (rAds.isEmpty) {
              emit(state.copyWith(adsCarousel: null, isLoading: false));
              return;
            }
            final random = Random();
            final number = random.nextInt(rAds.length);
            emit(
              state.copyWith(
                adsCarousel: rAds.elementAt(number),
                isLoading: false,
              ),
            );
          },
        );
      },
    );
  }
}
