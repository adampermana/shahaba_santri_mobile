// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetaResponse {

 bool? get success; String? get message; dynamic get info;
/// Create a copy of MetaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaResponseCopyWith<MetaResponse> get copyWith => _$MetaResponseCopyWithImpl<MetaResponse>(this as MetaResponse, _$identity);

  /// Serializes this MetaResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.info, info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(info));

@override
String toString() {
  return 'MetaResponse(success: $success, message: $message, info: $info)';
}


}

/// @nodoc
abstract mixin class $MetaResponseCopyWith<$Res>  {
  factory $MetaResponseCopyWith(MetaResponse value, $Res Function(MetaResponse) _then) = _$MetaResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, dynamic info
});




}
/// @nodoc
class _$MetaResponseCopyWithImpl<$Res>
    implements $MetaResponseCopyWith<$Res> {
  _$MetaResponseCopyWithImpl(this._self, this._then);

  final MetaResponse _self;
  final $Res Function(MetaResponse) _then;

/// Create a copy of MetaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? info = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaResponse].
extension MetaResponsePatterns on MetaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaResponse value)  $default,){
final _that = this;
switch (_that) {
case _MetaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MetaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  dynamic info)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaResponse() when $default != null:
return $default(_that.success,_that.message,_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  dynamic info)  $default,) {final _that = this;
switch (_that) {
case _MetaResponse():
return $default(_that.success,_that.message,_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  dynamic info)?  $default,) {final _that = this;
switch (_that) {
case _MetaResponse() when $default != null:
return $default(_that.success,_that.message,_that.info);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaResponse implements MetaResponse {
  const _MetaResponse({this.success, this.message, this.info});
  factory _MetaResponse.fromJson(Map<String, dynamic> json) => _$MetaResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  dynamic info;

/// Create a copy of MetaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaResponseCopyWith<_MetaResponse> get copyWith => __$MetaResponseCopyWithImpl<_MetaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.info, info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(info));

@override
String toString() {
  return 'MetaResponse(success: $success, message: $message, info: $info)';
}


}

/// @nodoc
abstract mixin class _$MetaResponseCopyWith<$Res> implements $MetaResponseCopyWith<$Res> {
  factory _$MetaResponseCopyWith(_MetaResponse value, $Res Function(_MetaResponse) _then) = __$MetaResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, dynamic info
});




}
/// @nodoc
class __$MetaResponseCopyWithImpl<$Res>
    implements _$MetaResponseCopyWith<$Res> {
  __$MetaResponseCopyWithImpl(this._self, this._then);

  final _MetaResponse _self;
  final $Res Function(_MetaResponse) _then;

/// Create a copy of MetaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? info = freezed,}) {
  return _then(_MetaResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
