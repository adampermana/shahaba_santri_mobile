import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_response.freezed.dart';
part 'meta_response.g.dart';

@freezed
abstract class MetaResponse with _$MetaResponse {
  const factory MetaResponse({bool? success, String? message, dynamic info}) =
      _MetaResponse;

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);
}
