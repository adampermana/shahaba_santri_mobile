// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_email_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ValidationEmailResponse {

 bool? get success; String? get message; ValidationEmailData? get data;
/// Create a copy of ValidationEmailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationEmailResponseCopyWith<ValidationEmailResponse> get copyWith => _$ValidationEmailResponseCopyWithImpl<ValidationEmailResponse>(this as ValidationEmailResponse, _$identity);

  /// Serializes this ValidationEmailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationEmailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ValidationEmailResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ValidationEmailResponseCopyWith<$Res>  {
  factory $ValidationEmailResponseCopyWith(ValidationEmailResponse value, $Res Function(ValidationEmailResponse) _then) = _$ValidationEmailResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ValidationEmailData? data
});


$ValidationEmailDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ValidationEmailResponseCopyWithImpl<$Res>
    implements $ValidationEmailResponseCopyWith<$Res> {
  _$ValidationEmailResponseCopyWithImpl(this._self, this._then);

  final ValidationEmailResponse _self;
  final $Res Function(ValidationEmailResponse) _then;

/// Create a copy of ValidationEmailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ValidationEmailData?,
  ));
}
/// Create a copy of ValidationEmailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationEmailDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ValidationEmailDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ValidationEmailResponse].
extension ValidationEmailResponsePatterns on ValidationEmailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationEmailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationEmailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationEmailResponse value)  $default,){
final _that = this;
switch (_that) {
case _ValidationEmailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationEmailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationEmailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  ValidationEmailData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationEmailResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  ValidationEmailData? data)  $default,) {final _that = this;
switch (_that) {
case _ValidationEmailResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  ValidationEmailData? data)?  $default,) {final _that = this;
switch (_that) {
case _ValidationEmailResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidationEmailResponse implements ValidationEmailResponse {
  const _ValidationEmailResponse({this.success, this.message, this.data});
  factory _ValidationEmailResponse.fromJson(Map<String, dynamic> json) => _$ValidationEmailResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ValidationEmailData? data;

/// Create a copy of ValidationEmailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationEmailResponseCopyWith<_ValidationEmailResponse> get copyWith => __$ValidationEmailResponseCopyWithImpl<_ValidationEmailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidationEmailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationEmailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ValidationEmailResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ValidationEmailResponseCopyWith<$Res> implements $ValidationEmailResponseCopyWith<$Res> {
  factory _$ValidationEmailResponseCopyWith(_ValidationEmailResponse value, $Res Function(_ValidationEmailResponse) _then) = __$ValidationEmailResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ValidationEmailData? data
});


@override $ValidationEmailDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ValidationEmailResponseCopyWithImpl<$Res>
    implements _$ValidationEmailResponseCopyWith<$Res> {
  __$ValidationEmailResponseCopyWithImpl(this._self, this._then);

  final _ValidationEmailResponse _self;
  final $Res Function(_ValidationEmailResponse) _then;

/// Create a copy of ValidationEmailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ValidationEmailResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ValidationEmailData?,
  ));
}

/// Create a copy of ValidationEmailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationEmailDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ValidationEmailDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ValidationEmailData {

 bool? get registered;@JsonKey(name: 'email_verified') bool? get emailVerified;@JsonKey(name: 'is_pin') bool? get isPin;
/// Create a copy of ValidationEmailData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationEmailDataCopyWith<ValidationEmailData> get copyWith => _$ValidationEmailDataCopyWithImpl<ValidationEmailData>(this as ValidationEmailData, _$identity);

  /// Serializes this ValidationEmailData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationEmailData&&(identical(other.registered, registered) || other.registered == registered)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.isPin, isPin) || other.isPin == isPin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registered,emailVerified,isPin);

@override
String toString() {
  return 'ValidationEmailData(registered: $registered, emailVerified: $emailVerified, isPin: $isPin)';
}


}

/// @nodoc
abstract mixin class $ValidationEmailDataCopyWith<$Res>  {
  factory $ValidationEmailDataCopyWith(ValidationEmailData value, $Res Function(ValidationEmailData) _then) = _$ValidationEmailDataCopyWithImpl;
@useResult
$Res call({
 bool? registered,@JsonKey(name: 'email_verified') bool? emailVerified,@JsonKey(name: 'is_pin') bool? isPin
});




}
/// @nodoc
class _$ValidationEmailDataCopyWithImpl<$Res>
    implements $ValidationEmailDataCopyWith<$Res> {
  _$ValidationEmailDataCopyWithImpl(this._self, this._then);

  final ValidationEmailData _self;
  final $Res Function(ValidationEmailData) _then;

/// Create a copy of ValidationEmailData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registered = freezed,Object? emailVerified = freezed,Object? isPin = freezed,}) {
  return _then(_self.copyWith(
registered: freezed == registered ? _self.registered : registered // ignore: cast_nullable_to_non_nullable
as bool?,emailVerified: freezed == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool?,isPin: freezed == isPin ? _self.isPin : isPin // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationEmailData].
extension ValidationEmailDataPatterns on ValidationEmailData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationEmailData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationEmailData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationEmailData value)  $default,){
final _that = this;
switch (_that) {
case _ValidationEmailData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationEmailData value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationEmailData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? registered, @JsonKey(name: 'email_verified')  bool? emailVerified, @JsonKey(name: 'is_pin')  bool? isPin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationEmailData() when $default != null:
return $default(_that.registered,_that.emailVerified,_that.isPin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? registered, @JsonKey(name: 'email_verified')  bool? emailVerified, @JsonKey(name: 'is_pin')  bool? isPin)  $default,) {final _that = this;
switch (_that) {
case _ValidationEmailData():
return $default(_that.registered,_that.emailVerified,_that.isPin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? registered, @JsonKey(name: 'email_verified')  bool? emailVerified, @JsonKey(name: 'is_pin')  bool? isPin)?  $default,) {final _that = this;
switch (_that) {
case _ValidationEmailData() when $default != null:
return $default(_that.registered,_that.emailVerified,_that.isPin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidationEmailData implements ValidationEmailData {
  const _ValidationEmailData({this.registered, @JsonKey(name: 'email_verified') this.emailVerified, @JsonKey(name: 'is_pin') this.isPin});
  factory _ValidationEmailData.fromJson(Map<String, dynamic> json) => _$ValidationEmailDataFromJson(json);

@override final  bool? registered;
@override@JsonKey(name: 'email_verified') final  bool? emailVerified;
@override@JsonKey(name: 'is_pin') final  bool? isPin;

/// Create a copy of ValidationEmailData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationEmailDataCopyWith<_ValidationEmailData> get copyWith => __$ValidationEmailDataCopyWithImpl<_ValidationEmailData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidationEmailDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationEmailData&&(identical(other.registered, registered) || other.registered == registered)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.isPin, isPin) || other.isPin == isPin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registered,emailVerified,isPin);

@override
String toString() {
  return 'ValidationEmailData(registered: $registered, emailVerified: $emailVerified, isPin: $isPin)';
}


}

/// @nodoc
abstract mixin class _$ValidationEmailDataCopyWith<$Res> implements $ValidationEmailDataCopyWith<$Res> {
  factory _$ValidationEmailDataCopyWith(_ValidationEmailData value, $Res Function(_ValidationEmailData) _then) = __$ValidationEmailDataCopyWithImpl;
@override @useResult
$Res call({
 bool? registered,@JsonKey(name: 'email_verified') bool? emailVerified,@JsonKey(name: 'is_pin') bool? isPin
});




}
/// @nodoc
class __$ValidationEmailDataCopyWithImpl<$Res>
    implements _$ValidationEmailDataCopyWith<$Res> {
  __$ValidationEmailDataCopyWithImpl(this._self, this._then);

  final _ValidationEmailData _self;
  final $Res Function(_ValidationEmailData) _then;

/// Create a copy of ValidationEmailData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registered = freezed,Object? emailVerified = freezed,Object? isPin = freezed,}) {
  return _then(_ValidationEmailData(
registered: freezed == registered ? _self.registered : registered // ignore: cast_nullable_to_non_nullable
as bool?,emailVerified: freezed == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool?,isPin: freezed == isPin ? _self.isPin : isPin // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
