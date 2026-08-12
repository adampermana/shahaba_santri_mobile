import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sahaba_mobile/domains/ads/ads_response.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';
import 'package:sahaba_mobile/domains/product/report/product_report.dart';
import 'package:sahaba_mobile/infrastructure/core/converter.dart';

import 'package:sahaba_mobile/infrastructure/failures/exceptions.dart';
import 'package:sahaba_mobile/infrastructure/product/ad_log_payload/ad_log_payload.dart';
import 'package:sahaba_mobile/infrastructure/product/category/category.dart';
import 'package:sahaba_mobile/infrastructure/product/dropdown_data/dropdown_data.dart';
import 'package:sahaba_mobile/infrastructure/product/history/history_product_limit.dart';
import 'package:sahaba_mobile/infrastructure/product/history/history_product_pagination.dart';
import 'package:sahaba_mobile/infrastructure/product/log_payload/product_log_payload.dart';
import 'package:sahaba_mobile/infrastructure/product/produsen/produsen.dart';

abstract class IProductRemoteDatasource {
  Future<ListProductResponse> postSearchByImage(String image);
  Future<DropdownDataResponse> getBrand(int val);
  Future<DropdownDataResponse> getProdusen();
  Future<ProductData> getProduct(int id);
  Future<ListProductResponse> getHistory(List<int> val);
  Future<ListProductResponse> getSearchProduct(String val);
  Future<ListProductResponse> getProductByCategory(int id);
  Future<ListProductResponse> getProdusenProduct(int id);
  Future<ListBrand> getBrandData();
  Future<Brand> getBrandById(int id);
  Future<ListAdsResponse> getAds(String target);
  Future<ListAdsResponse> getAdsByCategory(int categoryId, String target);
  Future<ListCategory> getCategory();
  Future<ListAdsResponse> getAdsSponsored(int page, int limit);
  Future<ListProductResponse> getAdsTopTen();
  Future<bool> postReport(ProductReport payload);
  Future<bool> sendLog(ProductLogPayload payload);
  Future<bool> sendAddLog(AdLogPayload payload);

  // New method
  Future<FetchHistoryProductLimit> getHistoryProductLimit({
    required int userId,
  });

  Future<ProductMultipleResponse> getProductMultiple(
    ProductMultipleParams params,
  );
  Future<ProductMultipleResponse> getProductLimitMultiple(
    ProductMultipleParams params,
  );
}

class ProductRemoteDatasource implements IProductRemoteDatasource {
  ProductRemoteDatasource(this._dio);
  final Dio _dio;

  @override
  Future<ListProductResponse> postSearchByImage(String image) async {
    try {
      final encodedImage = parseToBase64(image) ?? '';
      final data = {'image': encodedImage};
      debugPrint('================Uploading image: $image');
      debugPrint(
        '===============Image base64 length: ${encodedImage.length} characters',
      );
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/product/scan',
        data: data,
      );

      debugPrint('========================Response data: ${response.data}');

      // CASE ADA DATA
      return ListProductResponse.fromJson(
        response.data!,
      );
    } on DioException catch (e) {
      throw ServerException.withError(e);
    } catch (e) {
      throw ServerException.withMessage(
        title: 'Scan product failed',
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> sendLog(ProductLogPayload payload) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/product/log',
        data: payload.toJson(),
      );

      final data = response.data;
      return data!['message'] == 'log created successfully';
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListProductResponse> getProdusenProduct(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/product/creative-product?creative_id=$id',
      );
      final data = response.data;
      return ListProductResponse.fromJson(data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<bool> sendAddLog(AdLogPayload payload) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/product/ad/log',
        data: payload.toJson(),
      );

      final data = response.data;
      return data!['message'] == 'log created successfully';
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  //  Detail Product
  @override
  Future<ProductData> getProduct(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/product/$id',
      );
      final data = response.data!['data'] as Map<String, dynamic>;
      return ProductData.fromJson(data);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListBrand> getBrandData() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/api/v1/brand');
      return ListBrand.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<Brand> getBrandById(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/brand/$id',
      );
      final data = response.data?['data'] as Map<String, dynamic>?;
      if (data == null) {
        throw ServerException.withMessage(
          title: 'Brand tidak ditemukan',
          message: 'Data brand kosong.',
        );
      }
      return Brand.fromJson(data);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListAdsResponse> getAds(String target) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/ad/creative/$target',
      );
      return ListAdsResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListAdsResponse> getAdsByCategory(
    int categoryId,
    String target,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/ad/creative/$target',
        queryParameters: {'category_id': categoryId},
      );
      return ListAdsResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListCategory> getCategory() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/category/sub',
      );
      return ListCategory.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListAdsResponse> getAdsSponsored(int page, int limit) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/ad/placement/SPONSORED?limit=$limit&page=$page',
      );
      return ListAdsResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListProductResponse> getAdsTopTen() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/product/placement?placement_id=8',
      );
      return ListProductResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<DropdownDataResponse> getBrand(int val) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/brand?partner_id=$val',
      );
      return DropdownDataResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListProductResponse> getHistory(List<int> val) async {
    try {
      if (val.isEmpty) return ListProductResponse(data: []);
      final encoded = val.join('%2C');
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/product/multiple?ids=$encoded',
      );
      return ListProductResponse.fromJson(
        response.data!,
      );
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListProductResponse> getSearchProduct(String val) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/product?search=${Uri.encodeComponent(val)}',
      );
      return ListProductResponse.fromJson(
        response.data!,
      );
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ListProductResponse> getProductByCategory(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/product/data?category_id=$id',
      );
      return ListProductResponse.fromJson(
        response.data!,
      );
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<bool> postReport(ProductReport payload) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/product/report',
        data: payload.toJson(),
      );
      return response.data!['message'] == 'report created successfully';
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<DropdownDataResponse> getProdusen() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/api/v1/produsen');
      return DropdownDataResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  // New Method
  @override
  Future<FetchHistoryProductLimit> getHistoryProductLimit({
    required int userId,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/product/log/history',
        queryParameters: {'user_id': userId, 'page_size': 3},
      );
      return FetchHistoryProductLimit.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ProductMultipleResponse> getProductLimitMultiple(
    ProductMultipleParams params,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/product/log/history',
        queryParameters: params.toQueryParams(),
      );
      return ProductMultipleResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }

  @override
  Future<ProductMultipleResponse> getProductMultiple(
    ProductMultipleParams params,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/product/multiple',
        queryParameters: params.toQueryParams(),
      );
      return ProductMultipleResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw ServerException.withError(e);
    }
  }
}
