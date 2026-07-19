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

 MetaResponse? get meta; VerifyOtpData? get data;
/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpResponseCopyWith<VerifyOtpResponse> get copyWith => _$VerifyOtpResponseCopyWithImpl<VerifyOtpResponse>(this as VerifyOtpResponse, _$identity);

  /// Serializes this VerifyOtpResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'VerifyOtpResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpResponseCopyWith<$Res>  {
  factory $VerifyOtpResponseCopyWith(VerifyOtpResponse value, $Res Function(VerifyOtpResponse) _then) = _$VerifyOtpResponseCopyWithImpl;
@useResult
$Res call({
 MetaResponse? meta, VerifyOtpData? data
});


$MetaResponseCopyWith<$Res>? get meta;$VerifyOtpDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$VerifyOtpResponseCopyWithImpl<$Res>
    implements $VerifyOtpResponseCopyWith<$Res> {
  _$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final VerifyOtpResponse _self;
  final $Res Function(VerifyOtpResponse) _then;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VerifyOtpData?,
  ));
}
/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaResponseCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $MetaResponseCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyOtpDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $VerifyOtpDataCopyWith<$Res>(_self.data!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetaResponse? meta,  VerifyOtpData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that.meta,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetaResponse? meta,  VerifyOtpData? data)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponse():
return $default(_that.meta,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetaResponse? meta,  VerifyOtpData? data)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that.meta,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpResponse implements VerifyOtpResponse {
  const _VerifyOtpResponse({this.meta, this.data});
  factory _VerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseFromJson(json);

@override final  MetaResponse? meta;
@override final  VerifyOtpData? data;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'VerifyOtpResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpResponseCopyWith<$Res> implements $VerifyOtpResponseCopyWith<$Res> {
  factory _$VerifyOtpResponseCopyWith(_VerifyOtpResponse value, $Res Function(_VerifyOtpResponse) _then) = __$VerifyOtpResponseCopyWithImpl;
@override @useResult
$Res call({
 MetaResponse? meta, VerifyOtpData? data
});


@override $MetaResponseCopyWith<$Res>? get meta;@override $VerifyOtpDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$VerifyOtpResponseCopyWithImpl<$Res>
    implements _$VerifyOtpResponseCopyWith<$Res> {
  __$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final _VerifyOtpResponse _self;
  final $Res Function(_VerifyOtpResponse) _then;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_VerifyOtpResponse(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as VerifyOtpData?,
  ));
}

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaResponseCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $MetaResponseCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyOtpDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $VerifyOtpDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VerifyOtpData {

 String? get email;@JsonKey(name: 'is_verified') bool? get isVerified;@JsonKey(name: 'verify_token') String? get verifyToken;
/// Create a copy of VerifyOtpData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpDataCopyWith<VerifyOtpData> get copyWith => _$VerifyOtpDataCopyWithImpl<VerifyOtpData>(this as VerifyOtpData, _$identity);

  /// Serializes this VerifyOtpData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpData&&(identical(other.email, email) || other.email == email)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.verifyToken, verifyToken) || other.verifyToken == verifyToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,isVerified,verifyToken);

@override
String toString() {
  return 'VerifyOtpData(email: $email, isVerified: $isVerified, verifyToken: $verifyToken)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpDataCopyWith<$Res>  {
  factory $VerifyOtpDataCopyWith(VerifyOtpData value, $Res Function(VerifyOtpData) _then) = _$VerifyOtpDataCopyWithImpl;
@useResult
$Res call({
 String? email,@JsonKey(name: 'is_verified') bool? isVerified,@JsonKey(name: 'verify_token') String? verifyToken
});




}
/// @nodoc
class _$VerifyOtpDataCopyWithImpl<$Res>
    implements $VerifyOtpDataCopyWith<$Res> {
  _$VerifyOtpDataCopyWithImpl(this._self, this._then);

  final VerifyOtpData _self;
  final $Res Function(VerifyOtpData) _then;

/// Create a copy of VerifyOtpData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? isVerified = freezed,Object? verifyToken = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,verifyToken: freezed == verifyToken ? _self.verifyToken : verifyToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpData].
extension VerifyOtpDataPatterns on VerifyOtpData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpData value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpData value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email, @JsonKey(name: 'is_verified')  bool? isVerified, @JsonKey(name: 'verify_token')  String? verifyToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpData() when $default != null:
return $default(_that.email,_that.isVerified,_that.verifyToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email, @JsonKey(name: 'is_verified')  bool? isVerified, @JsonKey(name: 'verify_token')  String? verifyToken)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpData():
return $default(_that.email,_that.isVerified,_that.verifyToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email, @JsonKey(name: 'is_verified')  bool? isVerified, @JsonKey(name: 'verify_token')  String? verifyToken)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpData() when $default != null:
return $default(_that.email,_that.isVerified,_that.verifyToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpData implements VerifyOtpData {
  const _VerifyOtpData({this.email, @JsonKey(name: 'is_verified') this.isVerified, @JsonKey(name: 'verify_token') this.verifyToken});
  factory _VerifyOtpData.fromJson(Map<String, dynamic> json) => _$VerifyOtpDataFromJson(json);

@override final  String? email;
@override@JsonKey(name: 'is_verified') final  bool? isVerified;
@override@JsonKey(name: 'verify_token') final  String? verifyToken;

/// Create a copy of VerifyOtpData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpDataCopyWith<_VerifyOtpData> get copyWith => __$VerifyOtpDataCopyWithImpl<_VerifyOtpData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpData&&(identical(other.email, email) || other.email == email)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.verifyToken, verifyToken) || other.verifyToken == verifyToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,isVerified,verifyToken);

@override
String toString() {
  return 'VerifyOtpData(email: $email, isVerified: $isVerified, verifyToken: $verifyToken)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpDataCopyWith<$Res> implements $VerifyOtpDataCopyWith<$Res> {
  factory _$VerifyOtpDataCopyWith(_VerifyOtpData value, $Res Function(_VerifyOtpData) _then) = __$VerifyOtpDataCopyWithImpl;
@override @useResult
$Res call({
 String? email,@JsonKey(name: 'is_verified') bool? isVerified,@JsonKey(name: 'verify_token') String? verifyToken
});




}
/// @nodoc
class __$VerifyOtpDataCopyWithImpl<$Res>
    implements _$VerifyOtpDataCopyWith<$Res> {
  __$VerifyOtpDataCopyWithImpl(this._self, this._then);

  final _VerifyOtpData _self;
  final $Res Function(_VerifyOtpData) _then;

/// Create a copy of VerifyOtpData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? isVerified = freezed,Object? verifyToken = freezed,}) {
  return _then(_VerifyOtpData(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isVerified: freezed == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool?,verifyToken: freezed == verifyToken ? _self.verifyToken : verifyToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
