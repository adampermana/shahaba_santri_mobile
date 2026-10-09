// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PinResponse {

 bool? get success; String? get message; PinData? get data;
/// Create a copy of PinResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinResponseCopyWith<PinResponse> get copyWith => _$PinResponseCopyWithImpl<PinResponse>(this as PinResponse, _$identity);

  /// Serializes this PinResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'PinResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $PinResponseCopyWith<$Res>  {
  factory $PinResponseCopyWith(PinResponse value, $Res Function(PinResponse) _then) = _$PinResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, PinData? data
});


$PinDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$PinResponseCopyWithImpl<$Res>
    implements $PinResponseCopyWith<$Res> {
  _$PinResponseCopyWithImpl(this._self, this._then);

  final PinResponse _self;
  final $Res Function(PinResponse) _then;

/// Create a copy of PinResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PinData?,
  ));
}
/// Create a copy of PinResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PinDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PinDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PinResponse].
extension PinResponsePatterns on PinResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PinResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PinResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PinResponse value)  $default,){
final _that = this;
switch (_that) {
case _PinResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PinResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PinResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  PinData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PinResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  PinData? data)  $default,) {final _that = this;
switch (_that) {
case _PinResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  PinData? data)?  $default,) {final _that = this;
switch (_that) {
case _PinResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PinResponse implements PinResponse {
  const _PinResponse({this.success, this.message, this.data});
  factory _PinResponse.fromJson(Map<String, dynamic> json) => _$PinResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  PinData? data;

/// Create a copy of PinResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinResponseCopyWith<_PinResponse> get copyWith => __$PinResponseCopyWithImpl<_PinResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PinResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PinResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'PinResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PinResponseCopyWith<$Res> implements $PinResponseCopyWith<$Res> {
  factory _$PinResponseCopyWith(_PinResponse value, $Res Function(_PinResponse) _then) = __$PinResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, PinData? data
});


@override $PinDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$PinResponseCopyWithImpl<$Res>
    implements _$PinResponseCopyWith<$Res> {
  __$PinResponseCopyWithImpl(this._self, this._then);

  final _PinResponse _self;
  final $Res Function(_PinResponse) _then;

/// Create a copy of PinResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_PinResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PinData?,
  ));
}

/// Create a copy of PinResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PinDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PinDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$PinData {

@JsonKey(name: 'is_pin') bool? get isPin;
/// Create a copy of PinData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinDataCopyWith<PinData> get copyWith => _$PinDataCopyWithImpl<PinData>(this as PinData, _$identity);

  /// Serializes this PinData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinData&&(identical(other.isPin, isPin) || other.isPin == isPin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPin);

@override
String toString() {
  return 'PinData(isPin: $isPin)';
}


}

/// @nodoc
abstract mixin class $PinDataCopyWith<$Res>  {
  factory $PinDataCopyWith(PinData value, $Res Function(PinData) _then) = _$PinDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_pin') bool? isPin
});




}
/// @nodoc
class _$PinDataCopyWithImpl<$Res>
    implements $PinDataCopyWith<$Res> {
  _$PinDataCopyWithImpl(this._self, this._then);

  final PinData _self;
  final $Res Function(PinData) _then;

/// Create a copy of PinData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPin = freezed,}) {
  return _then(_self.copyWith(
isPin: freezed == isPin ? _self.isPin : isPin // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PinData].
extension PinDataPatterns on PinData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PinData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PinData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PinData value)  $default,){
final _that = this;
switch (_that) {
case _PinData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PinData value)?  $default,){
final _that = this;
switch (_that) {
case _PinData() when $default != null:
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
case _PinData() when $default != null:
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
case _PinData():
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
case _PinData() when $default != null:
return $default(_that.isPin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PinData implements PinData {
  const _PinData({@JsonKey(name: 'is_pin') this.isPin});
  factory _PinData.fromJson(Map<String, dynamic> json) => _$PinDataFromJson(json);

@override@JsonKey(name: 'is_pin') final  bool? isPin;

/// Create a copy of PinData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinDataCopyWith<_PinData> get copyWith => __$PinDataCopyWithImpl<_PinData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PinDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PinData&&(identical(other.isPin, isPin) || other.isPin == isPin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPin);

@override
String toString() {
  return 'PinData(isPin: $isPin)';
}


}

/// @nodoc
abstract mixin class _$PinDataCopyWith<$Res> implements $PinDataCopyWith<$Res> {
  factory _$PinDataCopyWith(_PinData value, $Res Function(_PinData) _then) = __$PinDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_pin') bool? isPin
});




}
/// @nodoc
class __$PinDataCopyWithImpl<$Res>
    implements _$PinDataCopyWith<$Res> {
  __$PinDataCopyWithImpl(this._self, this._then);

  final _PinData _self;
  final $Res Function(_PinData) _then;

/// Create a copy of PinData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPin = freezed,}) {
  return _then(_PinData(
isPin: freezed == isPin ? _self.isPin : isPin // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
