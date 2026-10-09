// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_reset_pin_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestResetPinResponse {

 bool? get success; String? get message; RequestResetPinData? get data;
/// Create a copy of RequestResetPinResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestResetPinResponseCopyWith<RequestResetPinResponse> get copyWith => _$RequestResetPinResponseCopyWithImpl<RequestResetPinResponse>(this as RequestResetPinResponse, _$identity);

  /// Serializes this RequestResetPinResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestResetPinResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'RequestResetPinResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $RequestResetPinResponseCopyWith<$Res>  {
  factory $RequestResetPinResponseCopyWith(RequestResetPinResponse value, $Res Function(RequestResetPinResponse) _then) = _$RequestResetPinResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, RequestResetPinData? data
});


$RequestResetPinDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$RequestResetPinResponseCopyWithImpl<$Res>
    implements $RequestResetPinResponseCopyWith<$Res> {
  _$RequestResetPinResponseCopyWithImpl(this._self, this._then);

  final RequestResetPinResponse _self;
  final $Res Function(RequestResetPinResponse) _then;

/// Create a copy of RequestResetPinResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RequestResetPinData?,
  ));
}
/// Create a copy of RequestResetPinResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestResetPinDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RequestResetPinDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [RequestResetPinResponse].
extension RequestResetPinResponsePatterns on RequestResetPinResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestResetPinResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestResetPinResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestResetPinResponse value)  $default,){
final _that = this;
switch (_that) {
case _RequestResetPinResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestResetPinResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RequestResetPinResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  RequestResetPinData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestResetPinResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  RequestResetPinData? data)  $default,) {final _that = this;
switch (_that) {
case _RequestResetPinResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  RequestResetPinData? data)?  $default,) {final _that = this;
switch (_that) {
case _RequestResetPinResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestResetPinResponse implements RequestResetPinResponse {
  const _RequestResetPinResponse({this.success, this.message, this.data});
  factory _RequestResetPinResponse.fromJson(Map<String, dynamic> json) => _$RequestResetPinResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  RequestResetPinData? data;

/// Create a copy of RequestResetPinResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestResetPinResponseCopyWith<_RequestResetPinResponse> get copyWith => __$RequestResetPinResponseCopyWithImpl<_RequestResetPinResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestResetPinResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestResetPinResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'RequestResetPinResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RequestResetPinResponseCopyWith<$Res> implements $RequestResetPinResponseCopyWith<$Res> {
  factory _$RequestResetPinResponseCopyWith(_RequestResetPinResponse value, $Res Function(_RequestResetPinResponse) _then) = __$RequestResetPinResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, RequestResetPinData? data
});


@override $RequestResetPinDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$RequestResetPinResponseCopyWithImpl<$Res>
    implements _$RequestResetPinResponseCopyWith<$Res> {
  __$RequestResetPinResponseCopyWithImpl(this._self, this._then);

  final _RequestResetPinResponse _self;
  final $Res Function(_RequestResetPinResponse) _then;

/// Create a copy of RequestResetPinResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_RequestResetPinResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RequestResetPinData?,
  ));
}

/// Create a copy of RequestResetPinResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestResetPinDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RequestResetPinDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$RequestResetPinData {

@JsonKey(name: 'cooldown_otp') int? get cooldownOtp;
/// Create a copy of RequestResetPinData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestResetPinDataCopyWith<RequestResetPinData> get copyWith => _$RequestResetPinDataCopyWithImpl<RequestResetPinData>(this as RequestResetPinData, _$identity);

  /// Serializes this RequestResetPinData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestResetPinData&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cooldownOtp);

@override
String toString() {
  return 'RequestResetPinData(cooldownOtp: $cooldownOtp)';
}


}

/// @nodoc
abstract mixin class $RequestResetPinDataCopyWith<$Res>  {
  factory $RequestResetPinDataCopyWith(RequestResetPinData value, $Res Function(RequestResetPinData) _then) = _$RequestResetPinDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cooldown_otp') int? cooldownOtp
});




}
/// @nodoc
class _$RequestResetPinDataCopyWithImpl<$Res>
    implements $RequestResetPinDataCopyWith<$Res> {
  _$RequestResetPinDataCopyWithImpl(this._self, this._then);

  final RequestResetPinData _self;
  final $Res Function(RequestResetPinData) _then;

/// Create a copy of RequestResetPinData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cooldownOtp = freezed,}) {
  return _then(_self.copyWith(
cooldownOtp: freezed == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestResetPinData].
extension RequestResetPinDataPatterns on RequestResetPinData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestResetPinData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestResetPinData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestResetPinData value)  $default,){
final _that = this;
switch (_that) {
case _RequestResetPinData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestResetPinData value)?  $default,){
final _that = this;
switch (_that) {
case _RequestResetPinData() when $default != null:
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
case _RequestResetPinData() when $default != null:
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
case _RequestResetPinData():
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
case _RequestResetPinData() when $default != null:
return $default(_that.cooldownOtp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestResetPinData implements RequestResetPinData {
  const _RequestResetPinData({@JsonKey(name: 'cooldown_otp') this.cooldownOtp});
  factory _RequestResetPinData.fromJson(Map<String, dynamic> json) => _$RequestResetPinDataFromJson(json);

@override@JsonKey(name: 'cooldown_otp') final  int? cooldownOtp;

/// Create a copy of RequestResetPinData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestResetPinDataCopyWith<_RequestResetPinData> get copyWith => __$RequestResetPinDataCopyWithImpl<_RequestResetPinData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestResetPinDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestResetPinData&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cooldownOtp);

@override
String toString() {
  return 'RequestResetPinData(cooldownOtp: $cooldownOtp)';
}


}

/// @nodoc
abstract mixin class _$RequestResetPinDataCopyWith<$Res> implements $RequestResetPinDataCopyWith<$Res> {
  factory _$RequestResetPinDataCopyWith(_RequestResetPinData value, $Res Function(_RequestResetPinData) _then) = __$RequestResetPinDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cooldown_otp') int? cooldownOtp
});




}
/// @nodoc
class __$RequestResetPinDataCopyWithImpl<$Res>
    implements _$RequestResetPinDataCopyWith<$Res> {
  __$RequestResetPinDataCopyWithImpl(this._self, this._then);

  final _RequestResetPinData _self;
  final $Res Function(_RequestResetPinData) _then;

/// Create a copy of RequestResetPinData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cooldownOtp = freezed,}) {
  return _then(_RequestResetPinData(
cooldownOtp: freezed == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
