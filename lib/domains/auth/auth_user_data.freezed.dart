// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserData {

 String? get id; String? get email; String? get name;@JsonKey(name: 'photo_url') String? get photoUrl;@JsonKey(name: 'email_verified') bool? get emailVerified; String? get status;@JsonKey(name: 'cooldown_otp') int? get cooldownOtp;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of AuthUserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserDataCopyWith<AuthUserData> get copyWith => _$AuthUserDataCopyWithImpl<AuthUserData>(this as AuthUserData, _$identity);

  /// Serializes this AuthUserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserData&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.status, status) || other.status == status)&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,photoUrl,emailVerified,status,cooldownOtp,createdAt,updatedAt);

@override
String toString() {
  return 'AuthUserData(id: $id, email: $email, name: $name, photoUrl: $photoUrl, emailVerified: $emailVerified, status: $status, cooldownOtp: $cooldownOtp, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AuthUserDataCopyWith<$Res>  {
  factory $AuthUserDataCopyWith(AuthUserData value, $Res Function(AuthUserData) _then) = _$AuthUserDataCopyWithImpl;
@useResult
$Res call({
 String? id, String? email, String? name,@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'email_verified') bool? emailVerified, String? status,@JsonKey(name: 'cooldown_otp') int? cooldownOtp,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$AuthUserDataCopyWithImpl<$Res>
    implements $AuthUserDataCopyWith<$Res> {
  _$AuthUserDataCopyWithImpl(this._self, this._then);

  final AuthUserData _self;
  final $Res Function(AuthUserData) _then;

/// Create a copy of AuthUserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? name = freezed,Object? photoUrl = freezed,Object? emailVerified = freezed,Object? status = freezed,Object? cooldownOtp = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: freezed == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,cooldownOtp: freezed == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUserData].
extension AuthUserDataPatterns on AuthUserData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUserData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUserData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUserData value)  $default,){
final _that = this;
switch (_that) {
case _AuthUserData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUserData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUserData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? email,  String? name, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'email_verified')  bool? emailVerified,  String? status, @JsonKey(name: 'cooldown_otp')  int? cooldownOtp, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUserData() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.photoUrl,_that.emailVerified,_that.status,_that.cooldownOtp,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? email,  String? name, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'email_verified')  bool? emailVerified,  String? status, @JsonKey(name: 'cooldown_otp')  int? cooldownOtp, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AuthUserData():
return $default(_that.id,_that.email,_that.name,_that.photoUrl,_that.emailVerified,_that.status,_that.cooldownOtp,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? email,  String? name, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'email_verified')  bool? emailVerified,  String? status, @JsonKey(name: 'cooldown_otp')  int? cooldownOtp, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AuthUserData() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.photoUrl,_that.emailVerified,_that.status,_that.cooldownOtp,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUserData implements AuthUserData {
  const _AuthUserData({this.id, this.email, this.name, @JsonKey(name: 'photo_url') this.photoUrl, @JsonKey(name: 'email_verified') this.emailVerified, this.status, @JsonKey(name: 'cooldown_otp') this.cooldownOtp, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _AuthUserData.fromJson(Map<String, dynamic> json) => _$AuthUserDataFromJson(json);

@override final  String? id;
@override final  String? email;
@override final  String? name;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override@JsonKey(name: 'email_verified') final  bool? emailVerified;
@override final  String? status;
@override@JsonKey(name: 'cooldown_otp') final  int? cooldownOtp;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of AuthUserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserDataCopyWith<_AuthUserData> get copyWith => __$AuthUserDataCopyWithImpl<_AuthUserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserData&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.status, status) || other.status == status)&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,photoUrl,emailVerified,status,cooldownOtp,createdAt,updatedAt);

@override
String toString() {
  return 'AuthUserData(id: $id, email: $email, name: $name, photoUrl: $photoUrl, emailVerified: $emailVerified, status: $status, cooldownOtp: $cooldownOtp, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AuthUserDataCopyWith<$Res> implements $AuthUserDataCopyWith<$Res> {
  factory _$AuthUserDataCopyWith(_AuthUserData value, $Res Function(_AuthUserData) _then) = __$AuthUserDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? email, String? name,@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'email_verified') bool? emailVerified, String? status,@JsonKey(name: 'cooldown_otp') int? cooldownOtp,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$AuthUserDataCopyWithImpl<$Res>
    implements _$AuthUserDataCopyWith<$Res> {
  __$AuthUserDataCopyWithImpl(this._self, this._then);

  final _AuthUserData _self;
  final $Res Function(_AuthUserData) _then;

/// Create a copy of AuthUserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? name = freezed,Object? photoUrl = freezed,Object? emailVerified = freezed,Object? status = freezed,Object? cooldownOtp = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AuthUserData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: freezed == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,cooldownOtp: freezed == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
