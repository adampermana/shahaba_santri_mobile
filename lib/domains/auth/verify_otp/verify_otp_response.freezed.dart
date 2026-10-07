// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyOtpResponse {

 bool? get success; String? get message; AuthUserData? get data;
/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpResponseCopyWith<VerifyOtpResponse> get copyWith => _$VerifyOtpResponseCopyWithImpl<VerifyOtpResponse>(this as VerifyOtpResponse, _$identity);

  /// Serializes this VerifyOtpResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'VerifyOtpResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpResponseCopyWith<$Res>  {
  factory $VerifyOtpResponseCopyWith(VerifyOtpResponse value, $Res Function(VerifyOtpResponse) _then) = _$VerifyOtpResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, AuthUserData? data
});


$AuthUserDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$VerifyOtpResponseCopyWithImpl<$Res>
    implements $VerifyOtpResponseCopyWith<$Res> {
  _$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final VerifyOtpResponse _self;
  final $Res Function(VerifyOtpResponse) _then;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthUserData?,
  ));
}
/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AuthUserDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerifyOtpResponse].
extension VerifyOtpResponsePatterns on VerifyOtpResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpResponse value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  AuthUserData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  AuthUserData? data)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponse():
return $default(_that.success,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  AuthUserData? data)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpResponse implements VerifyOtpResponse {
  const _VerifyOtpResponse({this.success, this.message, this.data});
  factory _VerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  AuthUserData? data;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpResponseCopyWith<_VerifyOtpResponse> get copyWith => __$VerifyOtpResponseCopyWithImpl<_VerifyOtpResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'VerifyOtpResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpResponseCopyWith<$Res> implements $VerifyOtpResponseCopyWith<$Res> {
  factory _$VerifyOtpResponseCopyWith(_VerifyOtpResponse value, $Res Function(_VerifyOtpResponse) _then) = __$VerifyOtpResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, AuthUserData? data
});


@override $AuthUserDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$VerifyOtpResponseCopyWithImpl<$Res>
    implements _$VerifyOtpResponseCopyWith<$Res> {
  __$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final _VerifyOtpResponse _self;
  final $Res Function(_VerifyOtpResponse) _then;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_VerifyOtpResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthUserData?,
  ));
}

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AuthUserDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
