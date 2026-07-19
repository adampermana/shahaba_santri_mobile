// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompleteProfileResponse {

 MetaResponse? get meta; LoginData? get data;
/// Create a copy of CompleteProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteProfileResponseCopyWith<CompleteProfileResponse> get copyWith => _$CompleteProfileResponseCopyWithImpl<CompleteProfileResponse>(this as CompleteProfileResponse, _$identity);

  /// Serializes this CompleteProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteProfileResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'CompleteProfileResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class $CompleteProfileResponseCopyWith<$Res>  {
  factory $CompleteProfileResponseCopyWith(CompleteProfileResponse value, $Res Function(CompleteProfileResponse) _then) = _$CompleteProfileResponseCopyWithImpl;
@useResult
$Res call({
 MetaResponse? meta, LoginData? data
});


$MetaResponseCopyWith<$Res>? get meta;$LoginDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$CompleteProfileResponseCopyWithImpl<$Res>
    implements $CompleteProfileResponseCopyWith<$Res> {
  _$CompleteProfileResponseCopyWithImpl(this._self, this._then);

  final CompleteProfileResponse _self;
  final $Res Function(CompleteProfileResponse) _then;

/// Create a copy of CompleteProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData?,
  ));
}
/// Create a copy of CompleteProfileResponse
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
}/// Create a copy of CompleteProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CompleteProfileResponse].
extension CompleteProfileResponsePatterns on CompleteProfileResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompleteProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompleteProfileResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompleteProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _CompleteProfileResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompleteProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CompleteProfileResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetaResponse? meta,  LoginData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompleteProfileResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetaResponse? meta,  LoginData? data)  $default,) {final _that = this;
switch (_that) {
case _CompleteProfileResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetaResponse? meta,  LoginData? data)?  $default,) {final _that = this;
switch (_that) {
case _CompleteProfileResponse() when $default != null:
return $default(_that.meta,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompleteProfileResponse implements CompleteProfileResponse {
  const _CompleteProfileResponse({this.meta, this.data});
  factory _CompleteProfileResponse.fromJson(Map<String, dynamic> json) => _$CompleteProfileResponseFromJson(json);

@override final  MetaResponse? meta;
@override final  LoginData? data;

/// Create a copy of CompleteProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompleteProfileResponseCopyWith<_CompleteProfileResponse> get copyWith => __$CompleteProfileResponseCopyWithImpl<_CompleteProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompleteProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompleteProfileResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'CompleteProfileResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CompleteProfileResponseCopyWith<$Res> implements $CompleteProfileResponseCopyWith<$Res> {
  factory _$CompleteProfileResponseCopyWith(_CompleteProfileResponse value, $Res Function(_CompleteProfileResponse) _then) = __$CompleteProfileResponseCopyWithImpl;
@override @useResult
$Res call({
 MetaResponse? meta, LoginData? data
});


@override $MetaResponseCopyWith<$Res>? get meta;@override $LoginDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$CompleteProfileResponseCopyWithImpl<$Res>
    implements _$CompleteProfileResponseCopyWith<$Res> {
  __$CompleteProfileResponseCopyWithImpl(this._self, this._then);

  final _CompleteProfileResponse _self;
  final $Res Function(_CompleteProfileResponse) _then;

/// Create a copy of CompleteProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_CompleteProfileResponse(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData?,
  ));
}

/// Create a copy of CompleteProfileResponse
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
}/// Create a copy of CompleteProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
