// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResendOtpResponse {

 bool? get success; String? get message; ResendOtpData? get data;
/// Create a copy of ResendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendOtpResponseCopyWith<ResendOtpResponse> get copyWith => _$ResendOtpResponseCopyWithImpl<ResendOtpResponse>(this as ResendOtpResponse, _$identity);

  /// Serializes this ResendOtpResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendOtpResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ResendOtpResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ResendOtpResponseCopyWith<$Res>  {
  factory $ResendOtpResponseCopyWith(ResendOtpResponse value, $Res Function(ResendOtpResponse) _then) = _$ResendOtpResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ResendOtpData? data
});


$ResendOtpDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ResendOtpResponseCopyWithImpl<$Res>
    implements $ResendOtpResponseCopyWith<$Res> {
  _$ResendOtpResponseCopyWithImpl(this._self, this._then);

  final ResendOtpResponse _self;
  final $Res Function(ResendOtpResponse) _then;

/// Create a copy of ResendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ResendOtpData?,
  ));
}
/// Create a copy of ResendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResendOtpDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ResendOtpDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResendOtpResponse].
extension ResendOtpResponsePatterns on ResendOtpResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResendOtpResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResendOtpResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResendOtpResponse value)  $default,){
final _that = this;
switch (_that) {
case _ResendOtpResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResendOtpResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ResendOtpResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  ResendOtpData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResendOtpResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  ResendOtpData? data)  $default,) {final _that = this;
switch (_that) {
case _ResendOtpResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  ResendOtpData? data)?  $default,) {final _that = this;
switch (_that) {
case _ResendOtpResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResendOtpResponse implements ResendOtpResponse {
  const _ResendOtpResponse({this.success, this.message, this.data});
  factory _ResendOtpResponse.fromJson(Map<String, dynamic> json) => _$ResendOtpResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ResendOtpData? data;

/// Create a copy of ResendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResendOtpResponseCopyWith<_ResendOtpResponse> get copyWith => __$ResendOtpResponseCopyWithImpl<_ResendOtpResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResendOtpResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendOtpResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ResendOtpResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ResendOtpResponseCopyWith<$Res> implements $ResendOtpResponseCopyWith<$Res> {
  factory _$ResendOtpResponseCopyWith(_ResendOtpResponse value, $Res Function(_ResendOtpResponse) _then) = __$ResendOtpResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ResendOtpData? data
});


@override $ResendOtpDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ResendOtpResponseCopyWithImpl<$Res>
    implements _$ResendOtpResponseCopyWith<$Res> {
  __$ResendOtpResponseCopyWithImpl(this._self, this._then);

  final _ResendOtpResponse _self;
  final $Res Function(_ResendOtpResponse) _then;

/// Create a copy of ResendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ResendOtpResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ResendOtpData?,
  ));
}

/// Create a copy of ResendOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResendOtpDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ResendOtpDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ResendOtpData {

@JsonKey(name: 'cooldown_otp') int? get cooldownOtp;
/// Create a copy of ResendOtpData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendOtpDataCopyWith<ResendOtpData> get copyWith => _$ResendOtpDataCopyWithImpl<ResendOtpData>(this as ResendOtpData, _$identity);

  /// Serializes this ResendOtpData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendOtpData&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cooldownOtp);

@override
String toString() {
  return 'ResendOtpData(cooldownOtp: $cooldownOtp)';
}


}

/// @nodoc
abstract mixin class $ResendOtpDataCopyWith<$Res>  {
  factory $ResendOtpDataCopyWith(ResendOtpData value, $Res Function(ResendOtpData) _then) = _$ResendOtpDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cooldown_otp') int? cooldownOtp
});




}
/// @nodoc
class _$ResendOtpDataCopyWithImpl<$Res>
    implements $ResendOtpDataCopyWith<$Res> {
  _$ResendOtpDataCopyWithImpl(this._self, this._then);

  final ResendOtpData _self;
  final $Res Function(ResendOtpData) _then;

/// Create a copy of ResendOtpData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cooldownOtp = freezed,}) {
  return _then(_self.copyWith(
cooldownOtp: freezed == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResendOtpData].
extension ResendOtpDataPatterns on ResendOtpData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResendOtpData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResendOtpData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResendOtpData value)  $default,){
final _that = this;
switch (_that) {
case _ResendOtpData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResendOtpData value)?  $default,){
final _that = this;
switch (_that) {
case _ResendOtpData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cooldown_otp')  int? cooldownOtp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResendOtpData() when $default != null:
return $default(_that.cooldownOtp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cooldown_otp')  int? cooldownOtp)  $default,) {final _that = this;
switch (_that) {
case _ResendOtpData():
return $default(_that.cooldownOtp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cooldown_otp')  int? cooldownOtp)?  $default,) {final _that = this;
switch (_that) {
case _ResendOtpData() when $default != null:
return $default(_that.cooldownOtp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResendOtpData implements ResendOtpData {
  const _ResendOtpData({@JsonKey(name: 'cooldown_otp') this.cooldownOtp});
  factory _ResendOtpData.fromJson(Map<String, dynamic> json) => _$ResendOtpDataFromJson(json);

@override@JsonKey(name: 'cooldown_otp') final  int? cooldownOtp;

/// Create a copy of ResendOtpData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResendOtpDataCopyWith<_ResendOtpData> get copyWith => __$ResendOtpDataCopyWithImpl<_ResendOtpData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResendOtpDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendOtpData&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cooldownOtp);

@override
String toString() {
  return 'ResendOtpData(cooldownOtp: $cooldownOtp)';
}


}

/// @nodoc
abstract mixin class _$ResendOtpDataCopyWith<$Res> implements $ResendOtpDataCopyWith<$Res> {
  factory _$ResendOtpDataCopyWith(_ResendOtpData value, $Res Function(_ResendOtpData) _then) = __$ResendOtpDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cooldown_otp') int? cooldownOtp
});




}
/// @nodoc
class __$ResendOtpDataCopyWithImpl<$Res>
    implements _$ResendOtpDataCopyWith<$Res> {
  __$ResendOtpDataCopyWithImpl(this._self, this._then);

  final _ResendOtpData _self;
  final $Res Function(_ResendOtpData) _then;

/// Create a copy of ResendOtpData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cooldownOtp = freezed,}) {
  return _then(_ResendOtpData(
cooldownOtp: freezed == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
