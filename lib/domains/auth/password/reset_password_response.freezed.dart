// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPasswordResponse {

 bool? get success; String? get message; ResetPasswordData? get data;
/// Create a copy of ResetPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordResponseCopyWith<ResetPasswordResponse> get copyWith => _$ResetPasswordResponseCopyWithImpl<ResetPasswordResponse>(this as ResetPasswordResponse, _$identity);

  /// Serializes this ResetPasswordResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ResetPasswordResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordResponseCopyWith<$Res>  {
  factory $ResetPasswordResponseCopyWith(ResetPasswordResponse value, $Res Function(ResetPasswordResponse) _then) = _$ResetPasswordResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ResetPasswordData? data
});


$ResetPasswordDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ResetPasswordResponseCopyWithImpl<$Res>
    implements $ResetPasswordResponseCopyWith<$Res> {
  _$ResetPasswordResponseCopyWithImpl(this._self, this._then);

  final ResetPasswordResponse _self;
  final $Res Function(ResetPasswordResponse) _then;

/// Create a copy of ResetPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ResetPasswordData?,
  ));
}
/// Create a copy of ResetPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResetPasswordDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ResetPasswordDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResetPasswordResponse].
extension ResetPasswordResponsePatterns on ResetPasswordResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPasswordResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPasswordResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPasswordResponse value)  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPasswordResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  ResetPasswordData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPasswordResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  ResetPasswordData? data)  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  ResetPasswordData? data)?  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResetPasswordResponse implements ResetPasswordResponse {
  const _ResetPasswordResponse({this.success, this.message, this.data});
  factory _ResetPasswordResponse.fromJson(Map<String, dynamic> json) => _$ResetPasswordResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ResetPasswordData? data;

/// Create a copy of ResetPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordResponseCopyWith<_ResetPasswordResponse> get copyWith => __$ResetPasswordResponseCopyWithImpl<_ResetPasswordResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ResetPasswordResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordResponseCopyWith<$Res> implements $ResetPasswordResponseCopyWith<$Res> {
  factory _$ResetPasswordResponseCopyWith(_ResetPasswordResponse value, $Res Function(_ResetPasswordResponse) _then) = __$ResetPasswordResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ResetPasswordData? data
});


@override $ResetPasswordDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ResetPasswordResponseCopyWithImpl<$Res>
    implements _$ResetPasswordResponseCopyWith<$Res> {
  __$ResetPasswordResponseCopyWithImpl(this._self, this._then);

  final _ResetPasswordResponse _self;
  final $Res Function(_ResetPasswordResponse) _then;

/// Create a copy of ResetPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ResetPasswordResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ResetPasswordData?,
  ));
}

/// Create a copy of ResetPasswordResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResetPasswordDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ResetPasswordDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ResetPasswordData {

@JsonKey(name: 'is_pin') bool? get isPin;
/// Create a copy of ResetPasswordData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordDataCopyWith<ResetPasswordData> get copyWith => _$ResetPasswordDataCopyWithImpl<ResetPasswordData>(this as ResetPasswordData, _$identity);

  /// Serializes this ResetPasswordData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordData&&(identical(other.isPin, isPin) || other.isPin == isPin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPin);

@override
String toString() {
  return 'ResetPasswordData(isPin: $isPin)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordDataCopyWith<$Res>  {
  factory $ResetPasswordDataCopyWith(ResetPasswordData value, $Res Function(ResetPasswordData) _then) = _$ResetPasswordDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_pin') bool? isPin
});




}
/// @nodoc
class _$ResetPasswordDataCopyWithImpl<$Res>
    implements $ResetPasswordDataCopyWith<$Res> {
  _$ResetPasswordDataCopyWithImpl(this._self, this._then);

  final ResetPasswordData _self;
  final $Res Function(ResetPasswordData) _then;

/// Create a copy of ResetPasswordData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPin = freezed,}) {
  return _then(_self.copyWith(
isPin: freezed == isPin ? _self.isPin : isPin // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPasswordData].
extension ResetPasswordDataPatterns on ResetPasswordData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPasswordData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPasswordData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPasswordData value)  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPasswordData value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPasswordData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_pin')  bool? isPin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPasswordData() when $default != null:
return $default(_that.isPin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_pin')  bool? isPin)  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordData():
return $default(_that.isPin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_pin')  bool? isPin)?  $default,) {final _that = this;
switch (_that) {
case _ResetPasswordData() when $default != null:
return $default(_that.isPin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResetPasswordData implements ResetPasswordData {
  const _ResetPasswordData({@JsonKey(name: 'is_pin') this.isPin});
  factory _ResetPasswordData.fromJson(Map<String, dynamic> json) => _$ResetPasswordDataFromJson(json);

@override@JsonKey(name: 'is_pin') final  bool? isPin;

/// Create a copy of ResetPasswordData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordDataCopyWith<_ResetPasswordData> get copyWith => __$ResetPasswordDataCopyWithImpl<_ResetPasswordData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordData&&(identical(other.isPin, isPin) || other.isPin == isPin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPin);

@override
String toString() {
  return 'ResetPasswordData(isPin: $isPin)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordDataCopyWith<$Res> implements $ResetPasswordDataCopyWith<$Res> {
  factory _$ResetPasswordDataCopyWith(_ResetPasswordData value, $Res Function(_ResetPasswordData) _then) = __$ResetPasswordDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_pin') bool? isPin
});




}
/// @nodoc
class __$ResetPasswordDataCopyWithImpl<$Res>
    implements _$ResetPasswordDataCopyWith<$Res> {
  __$ResetPasswordDataCopyWithImpl(this._self, this._then);

  final _ResetPasswordData _self;
  final $Res Function(_ResetPasswordData) _then;

/// Create a copy of ResetPasswordData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPin = freezed,}) {
  return _then(_ResetPasswordData(
isPin: freezed == isPin ? _self.isPin : isPin // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
