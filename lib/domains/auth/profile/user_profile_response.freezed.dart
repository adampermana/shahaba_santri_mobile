// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileResponse {

 LoginUser? get data; LoginMeta? get meta;
/// Create a copy of UserProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileResponseCopyWith<UserProfileResponse> get copyWith => _$UserProfileResponseCopyWithImpl<UserProfileResponse>(this as UserProfileResponse, _$identity);

  /// Serializes this UserProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,meta);

@override
String toString() {
  return 'UserProfileResponse(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $UserProfileResponseCopyWith<$Res>  {
  factory $UserProfileResponseCopyWith(UserProfileResponse value, $Res Function(UserProfileResponse) _then) = _$UserProfileResponseCopyWithImpl;
@useResult
$Res call({
 LoginUser? data, LoginMeta? meta
});


$LoginUserCopyWith<$Res>? get data;$LoginMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$UserProfileResponseCopyWithImpl<$Res>
    implements $UserProfileResponseCopyWith<$Res> {
  _$UserProfileResponseCopyWithImpl(this._self, this._then);

  final UserProfileResponse _self;
  final $Res Function(UserProfileResponse) _then;

/// Create a copy of UserProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginUser?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as LoginMeta?,
  ));
}
/// Create a copy of UserProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginUserCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginUserCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of UserProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $LoginMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserProfileResponse].
extension UserProfileResponsePatterns on UserProfileResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoginUser? data,  LoginMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileResponse() when $default != null:
return $default(_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoginUser? data,  LoginMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _UserProfileResponse():
return $default(_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoginUser? data,  LoginMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileResponse() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileResponse implements UserProfileResponse {
  const _UserProfileResponse({this.data, this.meta});
  factory _UserProfileResponse.fromJson(Map<String, dynamic> json) => _$UserProfileResponseFromJson(json);

@override final  LoginUser? data;
@override final  LoginMeta? meta;

/// Create a copy of UserProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileResponseCopyWith<_UserProfileResponse> get copyWith => __$UserProfileResponseCopyWithImpl<_UserProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,meta);

@override
String toString() {
  return 'UserProfileResponse(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$UserProfileResponseCopyWith<$Res> implements $UserProfileResponseCopyWith<$Res> {
  factory _$UserProfileResponseCopyWith(_UserProfileResponse value, $Res Function(_UserProfileResponse) _then) = __$UserProfileResponseCopyWithImpl;
@override @useResult
$Res call({
 LoginUser? data, LoginMeta? meta
});


@override $LoginUserCopyWith<$Res>? get data;@override $LoginMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$UserProfileResponseCopyWithImpl<$Res>
    implements _$UserProfileResponseCopyWith<$Res> {
  __$UserProfileResponseCopyWithImpl(this._self, this._then);

  final _UserProfileResponse _self;
  final $Res Function(_UserProfileResponse) _then;

/// Create a copy of UserProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? meta = freezed,}) {
  return _then(_UserProfileResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginUser?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as LoginMeta?,
  ));
}

/// Create a copy of UserProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginUserCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginUserCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of UserProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $LoginMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
