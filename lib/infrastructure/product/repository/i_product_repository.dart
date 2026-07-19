import 'package:dartz/dartz.dart';
import 'package:sahaba_mobile/domains/ads/ads_response.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';
import 'package:sahaba_mobile/domains/product/report/product_report.dart';

import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/infrastructure/product/ad_log_payload/ad_log_payload.dart';
import 'package:sahaba_mobile/infrastructure/product/body/product_body.dart';
import 'package:sahaba_mobile/infrastructure/product/category/category.dart';
import 'package:sahaba_mobile/infrastructure/product/dropdown_data/dropdown_data.dart';
import 'package:sahaba_mobile/infrastructure/product/history/history_product_limit.dart';
import 'package:sahaba_mobile/infrastructure/product/history/history_product_pagination.dart';
import 'package:sahaba_mobile/infrastructure/product/log_payload/product_log_payload.dart';
import 'package:sahaba_mobile/infrastructure/product/produsen/produsen.dart';

abstract class IProductRepository {
  Future<Either<String, ListProductResponse>> postSearchProductByImage(
    ProductBody payload,
  );

  Future<Either<ServerFailures, bool>> sendLog(ProductLogPayload payload);
  Future<Either<ServerFailures, bool>> sendAdLog(AdLogPayload payload);

  Future<Either<ServerFailures, bool>> postReport(ProductReport payload);

  Future<Either<ServerFailures, List<ProductData>>> getHistory();
  Future<Either<ServerFailures, List<AdResponseData>>> getAds(String target);
  Future<Either<ServerFailures, List<AdResponseData>>> getAdsSponsored(
    int page,
    int limit,
  );
  Future<Either<ServerFailures, List<ProductData>>> getAdsTopTen();

  Future<Either<ServerFailures, List<DropdownItems>>> getBrand(int val);
  Future<Either<ServerFailures, List<DropdownItems>>> getProdusen();
  Future<Either<ServerFailures, List<Brand>>> getBrandData();

  Future<Either<ServerFailures, List<ProductData>>> getSearchProduct(
    String val,
  );

  Future<Either<ServerFailures, List<ProductData>>> getProductByCategory(
    int id,
  );
  Future<Either<ServerFailures, List<ProductData>>> getProdusenProduct(
    int id,
  );
  Future<Either<ServerFailures, ProductData>> getProduct(int id);
  Future<Either<ServerFailures, ListCategory>> getCategory();

  // New Method
  Future<Either<ServerFailures, List<FetchHistoryDataProductLimit>>>
  getHistoryProductLimit({required int userId});

  Future<Either<ServerFailures, ProductMultipleResponse>>
  getProductLimitMultiple(ProductMultipleParams params);

  Future<Either<ServerFailures, ProductMultipleResponse>> getProductMultiple(
    ProductMultipleParams params,
  );
}
