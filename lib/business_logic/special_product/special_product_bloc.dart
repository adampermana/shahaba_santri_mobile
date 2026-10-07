// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:sahaba_mobile/domains/ads/ads_response.dart';
// import 'package:sahaba_mobile/domains/product/product_response.dart';

// import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
// import 'package:sahaba_mobile/infrastructure/product/ad_log_payload/ad_log_payload.dart';
// import 'package:sahaba_mobile/infrastructure/product/produsen/produsen.dart';
// import 'package:sahaba_mobile/infrastructure/product/repository/i_product_repository.dart';
// import 'package:sahaba_mobile/infrastructure/services/location_permission_service.dart';

// part 'special_product_event.dart';
// part 'special_product_state.dart';
// part 'special_product_bloc.freezed.dart';

// class SpecialProductBloc
//     extends Bloc<SpecialProductEvent, SpecialProductState> {
//   SpecialProductBloc(
//     this._repo,
//     this._localDataSource,
//     this._locationInfoService,
//   ) : super(SpecialProductState.initial()) {
//     on<_Started>(_onStarted);
//     on<_GetProduct>(_onGetProduct);
//     on<_NextPageSponsored>(_onNextPageSponsored);
//     on<_GetBrandData>(_onGetBrandData);
//     on<_AdLog>(_onAdLog);
//   }
//   final IProductRepository _repo;
//   final IAuthLocalDatasource _localDataSource;
//   final LocationPermissionService _locationInfoService;

//   Future<void> _onStarted(
//     _Started event,
//     Emitter<SpecialProductState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true, getBrandDataLoading: true));
//     final result = await _repo.getAds('2');

//     final resultTopTen = await _repo.getAdsTopTen();

//     result.fold((l) => emit(state.copyWith(errorMessage: l.message)), (r) {
//       for (final e in r) {
//         add(
//           SpecialProductEvent.adLog(
//             e.productId ?? 0,
//             e.campaignId ?? 0,
//             e.id ?? 0,
//             'Impression',
//           ),
//         );
//       }
//       emit(state.copyWith(data: r));
//     });

//     resultTopTen.fold(
//       (l) => emit(state.copyWith(errorMessage: l.message, isLoading: false)),
//       (r) {
//         for (final e in r) {
//           add(
//             SpecialProductEvent.adLog(
//               e.id,
//               e.campaignId,
//               e.creativeId,
//               'Impression',
//             ),
//           );
//         }

//         emit(state.copyWith(dataAdsTop10: r, isLoading: false));
//       },
//     );

//     add(const SpecialProductEvent.getBrandData());
//   }

//   Future<void> _onNextPageSponsored(
//     _NextPageSponsored event,
//     Emitter<SpecialProductState> emit,
//   ) async {
//     emit(state.copyWith(isLoadingNextPage: true));
//     final result = await _repo.getAdsSponsored(state.page, 5);
//     result.fold((l) => emit(state.copyWith(isLoadingNextPage: false)), (r) {
//       // final newDataAds = [...state.dataAds, ...r];
//       emit(
//         state.copyWith(
//           // dataAds: newDataAds,
//           isLoadingNextPage: false,
//           page: state.page + 1,
//         ),
//       );
//     });
//   }

//   Future<void> _onGetProduct(
//     _GetProduct event,
//     Emitter<SpecialProductState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));
//     final result = await _repo.getProdusenProduct(event.val);
//     result.fold(
//       (l) => emit(state.copyWith(errorMessage: l.message, isLoading: false)),
//       (r) => emit(state.copyWith(dataProdusenProduct: r, isLoading: false)),
//     );
//   }

//   Future<void> _onGetBrandData(
//     _GetBrandData event,
//     Emitter<SpecialProductState> emit,
//   ) async {
//     emit(
//       state.copyWith(
//         getBrandDataLoading: true,
//         getBrandDataSuccess: false,
//         getBrandDataErrorMessage: '',
//       ),
//     );
//     final result = await _repo.getBrandData();
//     result.fold(
//       (l) => emit(
//         state.copyWith(
//           getBrandDataLoading: false,
//           getBrandDataSuccess: false,
//           getBrandDataErrorMessage: l.message,
//         ),
//       ),
//       (r) => emit(
//         state.copyWith(
//           getBrandDataLoading: false,
//           getBrandDataSuccess: true,
//           dataBrand: r,
//         ),
//       ),
//     );
//   }

//Future<void> _onAdLog(_AdLog event, Emitter<SpecialProductState> emit) async {
//     final result = await _locationInfoService.getCurrentPosition();
//     await result.fold((_) async {}, (position) async {
//       final location = {
//         'latitude': position.latitude,
//         'longitude': position.longitude,
//       };
//       final locationDetail = await _locationInfoService
//           .getAddressFromCoordinates(location);
//       final dataLocal = _localDataSource.authGuestDataHive;

//       final payload = AdLogPayload(
//         creativeId: event.creativeId,
//         productId: event.productId,
//         campaignId: event.campaignId,
//         user: dataLocal?.name ?? 'Guest',
//         phoneNumber: dataLocal?.phoneNumber ?? '',
//         eventType: event.type,
//         kelurahan: locationDetail['district']!,
//         kecamatan: locationDetail['locality']!,
//         provinsi: locationDetail['province']!,
//         lat: location['latitude']!,
//         long: location['longitude']!,
//       );
//       await _repo.sendAdLog(payload);
//     });
//   }
// }
