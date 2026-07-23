import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahaba_mobile/domains/auth/login/login_response.dart';
import 'package:sahaba_mobile/domains/shared/meta_response.dart';

part 'complete_profile_response.freezed.dart';
part 'complete_profile_response.g.dart';

/// Response dari POST /api/v1/auth/register/complete
/// Sama seperti login — mengembalikan token JWT
@freezed
abstract class CompleteProfileResponse with _$CompleteProfileResponse {
  const factory CompleteProfileResponse({MetaResponse? meta, LoginData? data}) =
      _CompleteProfileResponse;

  factory CompleteProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteProfileResponseFromJson(json);
}
