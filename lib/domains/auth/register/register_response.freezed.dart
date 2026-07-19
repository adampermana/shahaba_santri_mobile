// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterResponse {

 MetaResponse? get meta; RegisterData? get data;
/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResponseCopyWith<RegisterResponse> get copyWith => _$RegisterResponseCopyWithImpl<RegisterResponse>(this as RegisterResponse, _$identity);

  /// Serializes this RegisterResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'RegisterResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class $RegisterResponseCopyWith<$Res>  {
  factory $RegisterResponseCopyWith(RegisterResponse value, $Res Function(RegisterResponse) _then) = _$RegisterResponseCopyWithImpl;
@useResult
$Res call({
 MetaResponse? meta, RegisterData? data
});


$MetaResponseCopyWith<$Res>? get meta;$RegisterDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$RegisterResponseCopyWithImpl<$Res>
    implements $RegisterResponseCopyWith<$Res> {
  _$RegisterResponseCopyWithImpl(this._self, this._then);

  final RegisterResponse _self;
  final $Res Function(RegisterResponse) _then;

/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegisterData?,
  ));
}
/// Create a copy of RegisterResponse
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
}/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RegisterDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterResponse].
extension RegisterResponsePatterns on RegisterResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterResponse value)  $default,){
final _that = this;
switch (_that) {
case _RegisterResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetaResponse? meta,  RegisterData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetaResponse? meta,  RegisterData? data)  $default,) {final _that = this;
switch (_that) {
case _RegisterResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetaResponse? meta,  RegisterData? data)?  $default,) {final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
return $default(_that.meta,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterResponse implements RegisterResponse {
  const _RegisterResponse({this.meta, this.data});
  factory _RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

@override final  MetaResponse? meta;
@override final  RegisterData? data;

/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResponseCopyWith<_RegisterResponse> get copyWith => __$RegisterResponseCopyWithImpl<_RegisterResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'RegisterResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RegisterResponseCopyWith<$Res> implements $RegisterResponseCopyWith<$Res> {
  factory _$RegisterResponseCopyWith(_RegisterResponse value, $Res Function(_RegisterResponse) _then) = __$RegisterResponseCopyWithImpl;
@override @useResult
$Res call({
 MetaResponse? meta, RegisterData? data
});


@override $MetaResponseCopyWith<$Res>? get meta;@override $RegisterDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$RegisterResponseCopyWithImpl<$Res>
    implements _$RegisterResponseCopyWith<$Res> {
  __$RegisterResponseCopyWithImpl(this._self, this._then);

  final _RegisterResponse _self;
  final $Res Function(_RegisterResponse) _then;

/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_RegisterResponse(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegisterData?,
  ));
}

/// Create a copy of RegisterResponse
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
}/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RegisterDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$RegisterData {

 String? get email;@JsonKey(name: 'expired_in') int? get expiredIn;@JsonKey(name: 'resend_in') int? get resendIn;
/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterDataCopyWith<RegisterData> get copyWith => _$RegisterDataCopyWithImpl<RegisterData>(this as RegisterData, _$identity);

  /// Serializes this RegisterData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterData&&(identical(other.email, email) || other.email == email)&&(identical(other.expiredIn, expiredIn) || other.expiredIn == expiredIn)&&(identical(other.resendIn, resendIn) || other.resendIn == resendIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,expiredIn,resendIn);

@override
String toString() {
  return 'RegisterData(email: $email, expiredIn: $expiredIn, resendIn: $resendIn)';
}


}

/// @nodoc
abstract mixin class $RegisterDataCopyWith<$Res>  {
  factory $RegisterDataCopyWith(RegisterData value, $Res Function(RegisterData) _then) = _$RegisterDataCopyWithImpl;
@useResult
$Res call({
 String? email,@JsonKey(name: 'expired_in') int? expiredIn,@JsonKey(name: 'resend_in') int? resendIn
});




}
/// @nodoc
class _$RegisterDataCopyWithImpl<$Res>
    implements $RegisterDataCopyWith<$Res> {
  _$RegisterDataCopyWithImpl(this._self, this._then);

  final RegisterData _self;
  final $Res Function(RegisterData) _then;

/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? expiredIn = freezed,Object? resendIn = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,expiredIn: freezed == expiredIn ? _self.expiredIn : expiredIn // ignore: cast_nullable_to_non_nullable
as int?,resendIn: freezed == resendIn ? _self.resendIn : resendIn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterData].
extension RegisterDataPatterns on RegisterData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterData value)  $default,){
final _that = this;
switch (_that) {
case _RegisterData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterData value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email, @JsonKey(name: 'expired_in')  int? expiredIn, @JsonKey(name: 'resend_in')  int? resendIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterData() when $default != null:
return $default(_that.email,_that.expiredIn,_that.resendIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email, @JsonKey(name: 'expired_in')  int? expiredIn, @JsonKey(name: 'resend_in')  int? resendIn)  $default,) {final _that = this;
switch (_that) {
case _RegisterData():
return $default(_that.email,_that.expiredIn,_that.resendIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email, @JsonKey(name: 'expired_in')  int? expiredIn, @JsonKey(name: 'resend_in')  int? resendIn)?  $default,) {final _that = this;
switch (_that) {
case _RegisterData() when $default != null:
return $default(_that.email,_that.expiredIn,_that.resendIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterData implements RegisterData {
  const _RegisterData({this.email, @JsonKey(name: 'expired_in') this.expiredIn, @JsonKey(name: 'resend_in') this.resendIn});
  factory _RegisterData.fromJson(Map<String, dynamic> json) => _$RegisterDataFromJson(json);

@override final  String? email;
@override@JsonKey(name: 'expired_in') final  int? expiredIn;
@override@JsonKey(name: 'resend_in') final  int? resendIn;

/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterDataCopyWith<_RegisterData> get copyWith => __$RegisterDataCopyWithImpl<_RegisterData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterData&&(identical(other.email, email) || other.email == email)&&(identical(other.expiredIn, expiredIn) || other.expiredIn == expiredIn)&&(identical(other.resendIn, resendIn) || other.resendIn == resendIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,expiredIn,resendIn);

@override
String toString() {
  return 'RegisterData(email: $email, expiredIn: $expiredIn, resendIn: $resendIn)';
}


}

/// @nodoc
abstract mixin class _$RegisterDataCopyWith<$Res> implements $RegisterDataCopyWith<$Res> {
  factory _$RegisterDataCopyWith(_RegisterData value, $Res Function(_RegisterData) _then) = __$RegisterDataCopyWithImpl;
@override @useResult
$Res call({
 String? email,@JsonKey(name: 'expired_in') int? expiredIn,@JsonKey(name: 'resend_in') int? resendIn
});




}
/// @nodoc
class __$RegisterDataCopyWithImpl<$Res>
    implements _$RegisterDataCopyWith<$Res> {
  __$RegisterDataCopyWithImpl(this._self, this._then);

  final _RegisterData _self;
  final $Res Function(_RegisterData) _then;

/// Create a copy of RegisterData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? expiredIn = freezed,Object? resendIn = freezed,}) {
  return _then(_RegisterData(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,expiredIn: freezed == expiredIn ? _self.expiredIn : expiredIn // ignore: cast_nullable_to_non_nullable
as int?,resendIn: freezed == resendIn ? _self.resendIn : resendIn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
