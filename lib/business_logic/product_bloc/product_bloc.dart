import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sahaba_mobile/domains/ads/ads_response.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';
import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
import 'package:sahaba_mobile/infrastructure/product/ad_log_payload/ad_log_payload.dart';
import 'package:sahaba_mobile/infrastructure/product/body/product_body.dart';
import 'package:sahaba_mobile/infrastructure/product/history/history_product_limit.dart';
import 'package:sahaba_mobile/infrastructure/product/history/history_product_pagination.dart';
import 'package:sahaba_mobile/infrastructure/product/log_payload/product_log_payload.dart';

import 'package:sahaba_mobile/infrastructure/product/repository/i_product_repository.dart';
import 'package:sahaba_mobile/infrastructure/services/location_permission_service.dart';
import 'package:sahaba_mobile/infrastructure/services/ocr_service.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductRepository _repo;
  final IAuthLocalDatasource _localDataSource;
  final LocationPermissionService _locationPermissionService;

  ProductBloc(
    this._repo,
    this._localDataSource,
    this._locationPermissionService,
  ) : super(ProductState.initial()) {
    on<ProductEvent>((event, emit) async {
      await event.map(
        // Search Image
        searchImage: (value) async {
          debugPrint(
            '========================Searching product by image: ${value.imagePath}',
          );
          emit(state.copyWith(imagePath: value.imagePath));
          final dataLocal =
              _localDataSource.authUserDataHive ??
              _localDataSource.authGuestDataHive;
          final locationDetail = await _locationPermissionService
              .getAddressFromCoordinates(value.coordinates);
          debugPrint("================== $locationDetail");
          final payload = ProductBody(
            person: dataLocal?.name ?? 'Guest',
            deviceId: dataLocal?.phoneNumber ?? '',
            image: state.imagePath,
            kelurahan: locationDetail['district']!,
            kecamatan: locationDetail['locality']!,
            provinsi: locationDetail['province']!,
            lat: value.coordinates['latitude']!,
            long: value.coordinates['longitude']!,
          );

          final result = await _repo.postSearchProductByImage(
            payload,
          ); // Post scan

          await result.fold<Future<void>>(
            (l) async {
              final ocrText = await OcrService.extractBigText(state.imagePath);

              final resultSearch = await _repo.getSearchProduct(ocrText);
              debugPrint('==== error scan by image');
              resultSearch.fold(
                (l) => emit(state.copyWith(errorMessage: l.message)),
                (r) {
                  final res = r
                      .where(
                        (product) => product.type?.toLowerCase() == 'iklan',
                      )
                      .toList();
                  debugPrint('==== running by ocr');
                  debugPrint('==== res ocr length ${res.length}');
                  res
                      .where((e) => e.id != null)
                      .map(
                        (e) => add(
                          ProductEvent.logAd(
                            e.id!,
                            e.campaignId!,
                            e.creativeId!,
                            value.coordinates,
                            'Impression',
                          ),
                        ),
                      )
                      .toList();

                  emit(
                    state.copyWith(
                      isLoading: false,
                      data: r.sublist(0, r.length > 4 ? 4 : r.length),
                      imagePath: state.imagePath,
                      productBody: payload,
                    ),
                  );
                },
              );
            },
            (r) async {
              debugPrint('==== success scan by image');
              debugPrint('res image ${r.data?.length}');
              final res = r.data
                  ?.where(
                    (product) => product.type?.toLowerCase() == 'iklan',
                  )
                  .toList();
              // final res = r
              //     .where((product) => product.type.toLowerCase() == 'iklan')
              //     .toList();

              emit(
                state.copyWith(
                  isLoading: false,
                  data: r.data ?? [],
                  productBody: payload,
                ),
              );
              res
                  ?.where((e) => e.id != null)
                  .map(
                    (e) => add(
                      ProductEvent.logAd(
                        e.id!,
                        e.campaignId!,
                        e.creativeId!,
                        value.coordinates,
                        'Impression',
                      ),
                    ),
                  )
                  .toList();
            },
          );
        },
        startLoading: (value) async {
          emit(
            state.copyWith(
              errorMessage: null,
              isCamera: true,
              data: [],
              tempProduct: null,
              isLoading: true,
              isLoadingSaveData: false,
            ),
          );
        },
        startSaveLoading: (value) async {
          emit(state.copyWith(isLoadingSaveData: true, tempProduct: value.val));
        },
        addLocalData: (value) async {
          emit(state.copyWith(errorMessage: null, isCamera: false));
          if (value.val.type?.toLowerCase() == 'iklan') {
            add(
              ProductEvent.logAd(
                value.val.id!,
                value.val.campaignId!,
                value.val.creativeId!,
                value.coordinates,
                'Click',
              ),
            );
          }
          final response = ProductLogPayload(
            eventType: 'Scan',
            brandId: state.tempProduct!.brandId!,
            deviceId: state.productBody!.deviceId,
            user: state.productBody!.person,
            image:
                value.val.image ??
                (value.val.images?.isNotEmpty == true
                    ? value.val.images!.first.image
                    : state.productBody!.image),
            disctrict: state.productBody!.kelurahan,
            kecamatan: state.productBody!.kecamatan,
            lat: state.productBody!.lat,
            long: state.productBody!.long,
            categoryId: state.tempProduct!.categoryId!,
            partnerId: state.tempProduct!.partnerId!,
            productId: state.tempProduct!.id!,
            statusHalal: state.tempProduct!.status!,
            province: state.productBody!.provinsi,
          );
          // await _localDataSource.updateLocalData(value.val.id!);
          final result = await _repo.sendLog(response);
          result.fold(
            (l) => emit(
              state.copyWith(
                errorMessage: l.message,
                isLoading: false,
                isLoadingSaveData: false,
              ),
            ),
            (r) {
              debugPrint('==== nih isinya $r');
              emit(state.copyWith(isLoadingSaveData: false));
              // add(ProductEvent.getHistory());
            },
          );
        },
        logAd: (value) async {
          final lat = value.coordinates['latitude'] ?? 0.0;
          final long = value.coordinates['longitude'] ?? 0.0;

          final locationDetail = await _locationPermissionService
              .getAddressFromCoordinates(value.coordinates);
          final dataLocal =
              _localDataSource.authUserDataHive ??
              _localDataSource.authGuestDataHive;

          final payload = AdLogPayload(
            creativeId: value.creativeId,
            productId: value.productId,
            campaignId: value.campaignId,
            user: dataLocal?.name ?? 'Guest',
            phoneNumber: dataLocal?.phoneNumber ?? '',
            eventType: value.type,
            kelurahan: locationDetail['district']!,
            kecamatan: locationDetail['locality']!,
            provinsi: locationDetail['province']!,
            lat: lat,
            long: long,
          );
          await _repo.sendAdLog(payload);
        },
        // getHistory: (value) async {
        //   emit(
        //     state.copyWith(
        //       isLoading: true,
        //       errorMessage: null,
        //       isCamera: false,
        //     ),
        //   );
        //   final result = await _repo.getHistory();
        //   result.fold(
        //     (l) =>
        //         emit(state.copyWith(errorMessage: l.message, isLoading: false)),
        //     (r) => emit(
        //       state.copyWith(
        //         masterDataHistory: r,
        //         dataHistory: r,
        //         isLoading: false,
        //         isLoadingSaveData: false,
        //       ),
        //     ),
        //   );
        // },
        filterData: (value) {
          final result = state.masterDataHistory
              .where(
                (e) => e.name!.toLowerCase().contains(value.val.toLowerCase()),
              )
              .toList();
          emit(state.copyWith(dataHistory: result));
        },
        started: (value) async {
          // Ensure auth token available before API calls
          final authData =
              _localDataSource.authUserDataHive ??
              _localDataSource.authGuestDataHive;
          if (authData == null) {
            debugPrint(
              '=== ProductBloc.started: No auth data, waiting for auth...',
            );
          }
          final result = await _repo.getAds('5');
          final carousel = await _repo.getAds('6');
          result.fold((l) => emit(state.copyWith(isLoading: false)), (r) {
            emit(state.copyWith(addSplash: r.isEmpty ? null : r.first));
          });

          carousel.fold((l) => emit(state.copyWith(isLoading: false)), (r) {
            emit(state.copyWith(isLoading: false, adsCarousel: r));
          });
          // add(ProductEvent.getHistoryProductLimit(userId: value.userId));
        },
        getHistoryProductLimit: (value) async {
          emit(
            state.copyWith(
              isLoadingHistoryProductLimit: true,
              errorMessage: null,
            ),
          );
          final result = await _repo.getHistoryProductLimit(
            userId: value.userId,
          );
          result.fold(
            (l) => emit(
              state.copyWith(
                isLoadingHistoryProductLimit: false,
                errorMessage: l.message,
              ),
            ),
            (r) => emit(
              state.copyWith(
                isLoadingHistoryProductLimit: false,
                historyProductLimit: r,
              ),
            ),
          );
        },
        getProductMultiple: (value) async {
          emit(
            state.copyWith(
              isLoadingProductMultiple: true,
              errorMessage: null,
              // isRetry: false,
            ),
          );
          final params = ProductMultipleParams(
            userId: value.userId,
            ids: value.ids,
            search: value.search,
            produsenId: value.produsenId,
            brandId: value.brandId,
            categoryId: value.categoryId,
            page: value.page,
            pageSize: value.pageSize,
          );
          final result = await _repo.getProductMultiple(params);
          result.fold(
            (l) => emit(
              state.copyWith(
                isLoadingProductMultiple: false,
                // isRetry: true,
                errorMessage: l.message,
              ),
            ),
            (r) => emit(
              state.copyWith(
                // isRetry: false,
                isLoadingProductMultiple: false,
                productMultipleList: r.data ?? [],
                paginationMeta: r.pagination,
                errorMessage: null,
              ),
            ),
          );
        },
        getProductLimitMultiple: (value) async {
          emit(
            state.copyWith(isLoadingProductMultiple: true, errorMessage: null),
          );
          final params = ProductMultipleParams(
            userId: value.userId,
            ids: value.ids,
            search: value.search,
            produsenId: value.produsenId,
            brandId: value.brandId,
            categoryId: value.categoryId,
            page: value.page,
            pageSize: value.pageSize,
          );
          final result = await _repo.getProductLimitMultiple(params);
          result.fold(
            (l) => emit(
              state.copyWith(
                isLoadingProductMultiple: false,
                errorMessage: l.message,
              ),
            ),
            (r) => emit(
              state.copyWith(
                isLoadingProductMultiple: false,
                productMultipleList: r.data ?? [],
                paginationMeta: r.pagination,
              ),
            ),
          );
        },
      );
    });
  }
}
