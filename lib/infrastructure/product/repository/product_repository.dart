// import 'package:dartz/dartz.dart';
// import 'package:sahaba_mobile/domains/ads/ads_response.dart';
// import 'package:sahaba_mobile/domains/product/product_response.dart';
// import 'package:sahaba_mobile/domains/product/report/product_report.dart';
// import 'package:sahaba_mobile/infrastructure/auth/datasources/auth_local_datasource.dart';
// import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
// import 'package:sahaba_mobile/infrastructure/product/ad_log_payload/ad_log_payload.dart';
// import 'package:sahaba_mobile/infrastructure/product/body/product_body.dart';
// import 'package:sahaba_mobile/infrastructure/product/category/category.dart';
// import 'package:sahaba_mobile/infrastructure/product/datasources/product_remote_datasources.dart';
// import 'package:sahaba_mobile/infrastructure/product/dropdown_data/dropdown_data.dart';
// import 'package:sahaba_mobile/infrastructure/product/history/history_product_limit.dart';
// import 'package:sahaba_mobile/infrastructure/product/history/history_product_pagination.dart';
// import 'package:sahaba_mobile/infrastructure/product/log_payload/product_log_payload.dart';
// import 'package:sahaba_mobile/infrastructure/product/produsen/produsen.dart';
// import 'package:sahaba_mobile/infrastructure/product/repository/i_product_repository.dart';

// class ProductRepository implements IProductRepository {
//   ProductRepository(this._remote, this._local);
//   final IProductRemoteDatasource _remote;
//   final IAuthLocalDatasource _local;

//   @override
//   Future<Either<String, ListProductResponse>> postSearchProductByImage(
//     ProductBody payload,
//   ) async {
//     try {
//       final result = await _remote.postSearchByImage(payload.image);
//       return Right(result);
//     } on ServerFailures catch (e) {
//       return Left(e.message);
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<DropdownItems>>> getBrand(int val) async {
//     try {
//       final result = await _remote.getBrand(val);
//       return Right(result.data);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<AdResponseData>>> getAds(
//     String target,
//   ) async {
//     try {
//       final result = await _remote.getAds(target);
//       return Right(result.data ?? []);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<AdResponseData>>> getAdsByCategory(
//     int categoryId,
//     String target,
//   ) async {
//     try {
//       final result = await _remote.getAdsByCategory(categoryId, target);
//       return Right(result.data ?? []);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     } on Exception catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: 500,
//           title: 'Error',
//           message: e.toString(),
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<AdResponseData>>> getAdsSponsored(
//     int page,
//     int limit,
//   ) async {
//     try {
//       final result = await _remote.getAdsSponsored(page, limit);
//       return Right(result.data ?? []);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<ProductData>>> getAdsTopTen() async {
//     try {
//       final result = await _remote.getAdsTopTen();
//       return Right(result.data ?? []);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, ProductData>> getProduct(int id) async {
//     try {
//       final result = await _remote.getProduct(id);
//       return Right(result);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, ListCategory>> getCategory() async {
//     try {
//       final result = await _remote.getCategory();
//       return Right(result);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<ProductData>>> getProdusenProduct(
//     int id,
//   ) async {
//     try {
//       final result = await _remote.getProdusenProduct(id);
//       return Right(result.data ?? []);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<ProductData>>> getSearchProduct(
//     String val,
//   ) async {
//     try {
//       final result = await _remote.getSearchProduct(val);
//       return Right(result.data ?? []);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<ProductData>>> getProductByCategory(
//     int id,
//   ) async {
//     try {
//       final result = await _remote.getProductByCategory(id);
//       return Right(result.data ?? []);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<ProductData>>> getHistory() async {
//     try {
//       final dataLocal =
//           _local.authUserDataHive?.accessToken ??
//           _local.authGuestDataHive?.accessToken;
//       final result = await _remote.getHistory([int.parse(dataLocal!)]);
//       return Right(result.data ?? []);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, bool>> postReport(ProductReport payload) async {
//     try {
//       final result = await _remote.postReport(payload);
//       return Right(result);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<DropdownItems>>> getProdusen() async {
//     try {
//       final result = await _remote.getProdusen();
//       return Right(result.data);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<Brand>>> getBrandData() async {
//     try {
//       final result = await _remote.getBrandData();
//       return Right(result.data);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, Brand>> getBrandById(int id) async {
//     try {
//       return Right(await _remote.getBrandById(id));
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, bool>> sendLog(
//     ProductLogPayload payload,
//   ) async {
//     try {
//       final result = await _remote.sendLog(payload);
//       return Right(result);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, bool>> sendAdLog(AdLogPayload payload) async {
//     try {
//       final result = await _remote.sendAddLog(payload);
//       return Right(result);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, List<FetchHistoryDataProductLimit>>>
//   getHistoryProductLimit({required int userId}) async {
//     try {
//       final result = await _remote.getHistoryProductLimit(userId: userId);
//       return Right(result.data ?? []);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, ProductMultipleResponse>>
//   getProductLimitMultiple(ProductMultipleParams params) async {
//     try {
//       final result = await _remote.getProductLimitMultiple(params);
//       return Right(result);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<ServerFailures, ProductMultipleResponse>> getProductMultiple(
//     ProductMultipleParams params,
//   ) async {
//     try {
//       final result = await _remote.getProductMultiple(params);
//       return Right(result);
//     } on ServerFailures catch (e) {
//       return Left(
//         ServerFailures(
//           statusCode: e.statusCode,
//           title: e.title,
//           message: e.message,
//         ),
//       );
//     }
//   }
// }
