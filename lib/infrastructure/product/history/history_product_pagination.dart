import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/product/product_response.dart';

part 'history_product_pagination.g.dart';

// Request params

class ProductMultipleParams {
  const ProductMultipleParams({
    required this.userId,
    this.ids,
    this.search,
    this.produsenId,
    this.brandId,
    this.categoryId,
    this.page = 1,
    this.pageSize = 10,
  });
  final int userId;
  final String? ids;
  final String? search;
  final int? produsenId;
  final int? brandId;
  final int? categoryId;
  final int page;
  final int pageSize;

  Map<String, dynamic> toQueryParams() {
    return {
      'user_id': userId,
      if (ids != null && ids!.isNotEmpty) 'ids': ids,
      if (search != null && search!.isNotEmpty) 'search': search,
      if (produsenId != null) 'produsen_id': produsenId,
      if (brandId != null) 'brand_id': brandId,
      if (categoryId != null) 'category_id': categoryId,
      'page': page,
      'page_size': pageSize,
    };
  }
}

// Response

@JsonSerializable(createToJson: false)
class ProductMultipleResponse {
  ProductMultipleResponse({this.data, this.pagination});
  factory ProductMultipleResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductMultipleResponseFromJson(json);
  @JsonKey(name: 'data')
  List<ProductData>? data;
  @JsonKey(name: 'pagination')
  PaginationMeta? pagination;
}

@JsonSerializable()
class PaginationMeta {
  PaginationMeta({this.page, this.pageSize, this.total});
  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'page_size')
  int? pageSize;

  /// Total items from API response field "total"
  @JsonKey(name: 'total')
  int? total;

  /// Computed: ceil(total / pageSize). Returns 1 if unknown.
  int get totalPage {
    final t = total ?? 0;
    final ps = pageSize ?? 10;
    if (t == 0 || ps == 0) return 1;
    return (t / ps).ceil();
  }

  Map<String, dynamic> toJson() => _$PaginationMetaToJson(this);
}
