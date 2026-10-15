// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPasswordResponse {

 bool? get success; String? get message; ForgotPasswordData? get data;
/// Create a copy of ForgotPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordResponseCopyWith<ForgotPasswordResponse> get copyWith => _$ForgotPasswordResponseCopyWithImpl<ForgotPasswordResponse>(this as ForgotPasswordResponse, _$identity);

  /// Serializes this ForgotPasswordResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ForgotPasswordResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordResponseCopyWith<$Res>  {
  factory $ForgotPasswordResponseCopyWith(ForgotPasswordResponse value, $Res Function(ForgotPasswordResponse) _then) = _$ForgotPasswordResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ForgotPasswordData? data
});


$ForgotPasswordDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ForgotPasswordResponseCopyWithImpl<$Res>
    implements $ForgotPasswordResponseCopyWith<$Res> {
  _$ForgotPasswordResponseCopyWithImpl(this._self, this._then);

  final ForgotPasswordResponse _self;
  final $Res Function(ForgotPasswordResponse) _then;

/// Create a copy of ForgotPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ForgotPasswordData?,
  ));
}
/// Create a copy of ForgotPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForgotPasswordDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ForgotPasswordDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForgotPasswordResponse].
extension ForgotPasswordResponsePatterns on ForgotPasswordResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordResponse value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  ForgotPasswordData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  ForgotPasswordData? data)  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  ForgotPasswordData? data)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForgotPasswordResponse implements ForgotPasswordResponse {
  const _ForgotPasswordResponse({this.success, this.message, this.data});
  factory _ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ForgotPasswordData? data;

/// Create a copy of ForgotPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordResponseCopyWith<_ForgotPasswordResponse> get copyWith => __$ForgotPasswordResponseCopyWithImpl<_ForgotPasswordResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotPasswordResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ForgotPasswordResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordResponseCopyWith<$Res> implements $ForgotPasswordResponseCopyWith<$Res> {
  factory _$ForgotPasswordResponseCopyWith(_ForgotPasswordResponse value, $Res Function(_ForgotPasswordResponse) _then) = __$ForgotPasswordResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ForgotPasswordData? data
});


@override $ForgotPasswordDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ForgotPasswordResponseCopyWithImpl<$Res>
    implements _$ForgotPasswordResponseCopyWith<$Res> {
  __$ForgotPasswordResponseCopyWithImpl(this._self, this._then);

  final _ForgotPasswordResponse _self;
  final $Res Function(_ForgotPasswordResponse) _then;

/// Create a copy of ForgotPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ForgotPasswordResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ForgotPasswordData?,
  ));
}

/// Create a copy of ForgotPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForgotPasswordDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ForgotPasswordDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ForgotPasswordData {

@JsonKey(name: 'cooldown_otp') int? get cooldownOtp;
/// Create a copy of ForgotPasswordData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordDataCopyWith<ForgotPasswordData> get copyWith => _$ForgotPasswordDataCopyWithImpl<ForgotPasswordData>(this as ForgotPasswordData, _$identity);

  /// Serializes this ForgotPasswordData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordData&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cooldownOtp);

@override
String toString() {
  return 'ForgotPasswordData(cooldownOtp: $cooldownOtp)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordDataCopyWith<$Res>  {
  factory $ForgotPasswordDataCopyWith(ForgotPasswordData value, $Res Function(ForgotPasswordData) _then) = _$ForgotPasswordDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cooldown_otp') int? cooldownOtp
});




}
/// @nodoc
class _$ForgotPasswordDataCopyWithImpl<$Res>
    implements $ForgotPasswordDataCopyWith<$Res> {
  _$ForgotPasswordDataCopyWithImpl(this._self, this._then);

  final ForgotPasswordData _self;
  final $Res Function(ForgotPasswordData) _then;

/// Create a copy of ForgotPasswordData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cooldownOtp = freezed,}) {
  return _then(_self.copyWith(
cooldownOtp: freezed == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordData].
extension ForgotPasswordDataPatterns on ForgotPasswordData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordData value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordData value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordData() when $default != null:
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
case _ForgotPasswordData() when $default != null:
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
case _ForgotPasswordData():
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
case _ForgotPasswordData() when $default != null:
return $default(_that.cooldownOtp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForgotPasswordData implements ForgotPasswordData {
  const _ForgotPasswordData({@JsonKey(name: 'cooldown_otp') this.cooldownOtp});
  factory _ForgotPasswordData.fromJson(Map<String, dynamic> json) => _$ForgotPasswordDataFromJson(json);

@override@JsonKey(name: 'cooldown_otp') final  int? cooldownOtp;

/// Create a copy of ForgotPasswordData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordDataCopyWith<_ForgotPasswordData> get copyWith => __$ForgotPasswordDataCopyWithImpl<_ForgotPasswordData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotPasswordDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordData&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cooldownOtp);

@override
String toString() {
  return 'ForgotPasswordData(cooldownOtp: $cooldownOtp)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordDataCopyWith<$Res> implements $ForgotPasswordDataCopyWith<$Res> {
  factory _$ForgotPasswordDataCopyWith(_ForgotPasswordData value, $Res Function(_ForgotPasswordData) _then) = __$ForgotPasswordDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cooldown_otp') int? cooldownOtp
});




}
/// @nodoc
class __$ForgotPasswordDataCopyWithImpl<$Res>
    implements _$ForgotPasswordDataCopyWith<$Res> {
  __$ForgotPasswordDataCopyWithImpl(this._self, this._then);

  final _ForgotPasswordData _self;
  final $Res Function(_ForgotPasswordData) _then;

/// Create a copy of ForgotPasswordData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cooldownOtp = freezed,}) {
  return _then(_ForgotPasswordData(
cooldownOtp: freezed == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
