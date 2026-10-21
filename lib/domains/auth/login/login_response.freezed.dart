// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponse {

 LoginData? get data; LoginMeta? get meta;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,meta);

@override
String toString() {
  return 'LoginResponse(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 LoginData? data, LoginMeta? meta
});


$LoginDataCopyWith<$Res>? get data;$LoginMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as LoginMeta?,
  ));
}
/// Create a copy of LoginResponse
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
}/// Create a copy of LoginResponse
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


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoginData? data,  LoginMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoginData? data,  LoginMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoginData? data,  LoginMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({this.data, this.meta});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  LoginData? data;
@override final  LoginMeta? meta;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,meta);

@override
String toString() {
  return 'LoginResponse(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 LoginData? data, LoginMeta? meta
});


@override $LoginDataCopyWith<$Res>? get data;@override $LoginMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? meta = freezed,}) {
  return _then(_LoginResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as LoginMeta?,
  ));
}

/// Create a copy of LoginResponse
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
}/// Create a copy of LoginResponse
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


/// @nodoc
mixin _$LoginData {

@JsonKey(name: 'access_token') String? get accessToken;@JsonKey(name: 'refresh_token') String? get refreshToken; LoginUser? get user;
/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginDataCopyWith<LoginData> get copyWith => _$LoginDataCopyWithImpl<LoginData>(this as LoginData, _$identity);

  /// Serializes this LoginData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user);

@override
String toString() {
  return 'LoginData(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
}


}

/// @nodoc
abstract mixin class $LoginDataCopyWith<$Res>  {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) _then) = _$LoginDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String? accessToken,@JsonKey(name: 'refresh_token') String? refreshToken, LoginUser? user
});


$LoginUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$LoginDataCopyWithImpl<$Res>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._self, this._then);

  final LoginData _self;
  final $Res Function(LoginData) _then;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = freezed,Object? refreshToken = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as LoginUser?,
  ));
}
/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $LoginUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginData].
extension LoginDataPatterns on LoginData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginData value)  $default,){
final _that = this;
switch (_that) {
case _LoginData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginData value)?  $default,){
final _that = this;
switch (_that) {
case _LoginData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String? accessToken, @JsonKey(name: 'refresh_token')  String? refreshToken,  LoginUser? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginData() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String? accessToken, @JsonKey(name: 'refresh_token')  String? refreshToken,  LoginUser? user)  $default,) {final _that = this;
switch (_that) {
case _LoginData():
return $default(_that.accessToken,_that.refreshToken,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String? accessToken, @JsonKey(name: 'refresh_token')  String? refreshToken,  LoginUser? user)?  $default,) {final _that = this;
switch (_that) {
case _LoginData() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginData implements LoginData {
  const _LoginData({@JsonKey(name: 'access_token') this.accessToken, @JsonKey(name: 'refresh_token') this.refreshToken, this.user});
  factory _LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

@override@JsonKey(name: 'access_token') final  String? accessToken;
@override@JsonKey(name: 'refresh_token') final  String? refreshToken;
@override final  LoginUser? user;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginDataCopyWith<_LoginData> get copyWith => __$LoginDataCopyWithImpl<_LoginData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginData&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user);

@override
String toString() {
  return 'LoginData(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoginDataCopyWith<$Res> implements $LoginDataCopyWith<$Res> {
  factory _$LoginDataCopyWith(_LoginData value, $Res Function(_LoginData) _then) = __$LoginDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String? accessToken,@JsonKey(name: 'refresh_token') String? refreshToken, LoginUser? user
});


@override $LoginUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$LoginDataCopyWithImpl<$Res>
    implements _$LoginDataCopyWith<$Res> {
  __$LoginDataCopyWithImpl(this._self, this._then);

  final _LoginData _self;
  final $Res Function(_LoginData) _then;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = freezed,Object? refreshToken = freezed,Object? user = freezed,}) {
  return _then(_LoginData(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as LoginUser?,
  ));
}

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $LoginUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$LoginUser {

 String? get id; String? get email; String? get name; String? get phone;@JsonKey(name: 'photo_url') String? get photoUrl; String? get status;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'email_verified_at') String? get emailVerifiedAt;@JsonKey(name: 'last_login_at') String? get lastLoginAt;
/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginUserCopyWith<LoginUser> get copyWith => _$LoginUserCopyWithImpl<LoginUser>(this as LoginUser, _$identity);

  /// Serializes this LoginUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,phone,photoUrl,status,createdAt,updatedAt,emailVerifiedAt,lastLoginAt);

@override
String toString() {
  return 'LoginUser(id: $id, email: $email, name: $name, phone: $phone, photoUrl: $photoUrl, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, emailVerifiedAt: $emailVerifiedAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class $LoginUserCopyWith<$Res>  {
  factory $LoginUserCopyWith(LoginUser value, $Res Function(LoginUser) _then) = _$LoginUserCopyWithImpl;
@useResult
$Res call({
 String? id, String? email, String? name, String? phone,@JsonKey(name: 'photo_url') String? photoUrl, String? status,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'email_verified_at') String? emailVerifiedAt,@JsonKey(name: 'last_login_at') String? lastLoginAt
});




}
/// @nodoc
class _$LoginUserCopyWithImpl<$Res>
    implements $LoginUserCopyWith<$Res> {
  _$LoginUserCopyWithImpl(this._self, this._then);

  final LoginUser _self;
  final $Res Function(LoginUser) _then;

/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? name = freezed,Object? phone = freezed,Object? photoUrl = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? emailVerifiedAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginUser].
extension LoginUserPatterns on LoginUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginUser value)  $default,){
final _that = this;
switch (_that) {
case _LoginUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginUser value)?  $default,){
final _that = this;
switch (_that) {
case _LoginUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? email,  String? name,  String? phone, @JsonKey(name: 'photo_url')  String? photoUrl,  String? status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'email_verified_at')  String? emailVerifiedAt, @JsonKey(name: 'last_login_at')  String? lastLoginAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginUser() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.phone,_that.photoUrl,_that.status,_that.createdAt,_that.updatedAt,_that.emailVerifiedAt,_that.lastLoginAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? email,  String? name,  String? phone, @JsonKey(name: 'photo_url')  String? photoUrl,  String? status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'email_verified_at')  String? emailVerifiedAt, @JsonKey(name: 'last_login_at')  String? lastLoginAt)  $default,) {final _that = this;
switch (_that) {
case _LoginUser():
return $default(_that.id,_that.email,_that.name,_that.phone,_that.photoUrl,_that.status,_that.createdAt,_that.updatedAt,_that.emailVerifiedAt,_that.lastLoginAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? email,  String? name,  String? phone, @JsonKey(name: 'photo_url')  String? photoUrl,  String? status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'email_verified_at')  String? emailVerifiedAt, @JsonKey(name: 'last_login_at')  String? lastLoginAt)?  $default,) {final _that = this;
switch (_that) {
case _LoginUser() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.phone,_that.photoUrl,_that.status,_that.createdAt,_that.updatedAt,_that.emailVerifiedAt,_that.lastLoginAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginUser implements LoginUser {
  const _LoginUser({this.id, this.email, this.name, this.phone, @JsonKey(name: 'photo_url') this.photoUrl, this.status, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'email_verified_at') this.emailVerifiedAt, @JsonKey(name: 'last_login_at') this.lastLoginAt});
  factory _LoginUser.fromJson(Map<String, dynamic> json) => _$LoginUserFromJson(json);

@override final  String? id;
@override final  String? email;
@override final  String? name;
@override final  String? phone;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override final  String? status;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'email_verified_at') final  String? emailVerifiedAt;
@override@JsonKey(name: 'last_login_at') final  String? lastLoginAt;

/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginUserCopyWith<_LoginUser> get copyWith => __$LoginUserCopyWithImpl<_LoginUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,phone,photoUrl,status,createdAt,updatedAt,emailVerifiedAt,lastLoginAt);

@override
String toString() {
  return 'LoginUser(id: $id, email: $email, name: $name, phone: $phone, photoUrl: $photoUrl, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, emailVerifiedAt: $emailVerifiedAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class _$LoginUserCopyWith<$Res> implements $LoginUserCopyWith<$Res> {
  factory _$LoginUserCopyWith(_LoginUser value, $Res Function(_LoginUser) _then) = __$LoginUserCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? email, String? name, String? phone,@JsonKey(name: 'photo_url') String? photoUrl, String? status,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'email_verified_at') String? emailVerifiedAt,@JsonKey(name: 'last_login_at') String? lastLoginAt
});




}
/// @nodoc
class __$LoginUserCopyWithImpl<$Res>
    implements _$LoginUserCopyWith<$Res> {
  __$LoginUserCopyWithImpl(this._self, this._then);

  final _LoginUser _self;
  final $Res Function(_LoginUser) _then;

/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? name = freezed,Object? phone = freezed,Object? photoUrl = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? emailVerifiedAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_LoginUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as String?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LoginMeta {

 String? get message; bool? get success;
/// Create a copy of LoginMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginMetaCopyWith<LoginMeta> get copyWith => _$LoginMetaCopyWithImpl<LoginMeta>(this as LoginMeta, _$identity);

  /// Serializes this LoginMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginMeta&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success);

@override
String toString() {
  return 'LoginMeta(message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class $LoginMetaCopyWith<$Res>  {
  factory $LoginMetaCopyWith(LoginMeta value, $Res Function(LoginMeta) _then) = _$LoginMetaCopyWithImpl;
@useResult
$Res call({
 String? message, bool? success
});




}
/// @nodoc
class _$LoginMetaCopyWithImpl<$Res>
    implements $LoginMetaCopyWith<$Res> {
  _$LoginMetaCopyWithImpl(this._self, this._then);

  final LoginMeta _self;
  final $Res Function(LoginMeta) _then;

/// Create a copy of LoginMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? success = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginMeta].
extension LoginMetaPatterns on LoginMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginMeta value)  $default,){
final _that = this;
switch (_that) {
case _LoginMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginMeta value)?  $default,){
final _that = this;
switch (_that) {
case _LoginMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  bool? success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginMeta() when $default != null:
return $default(_that.message,_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  bool? success)  $default,) {final _that = this;
switch (_that) {
case _LoginMeta():
return $default(_that.message,_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  bool? success)?  $default,) {final _that = this;
switch (_that) {
case _LoginMeta() when $default != null:
return $default(_that.message,_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginMeta implements LoginMeta {
  const _LoginMeta({this.message, this.success});
  factory _LoginMeta.fromJson(Map<String, dynamic> json) => _$LoginMetaFromJson(json);

@override final  String? message;
@override final  bool? success;

/// Create a copy of LoginMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginMetaCopyWith<_LoginMeta> get copyWith => __$LoginMetaCopyWithImpl<_LoginMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginMeta&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success);

@override
String toString() {
  return 'LoginMeta(message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class _$LoginMetaCopyWith<$Res> implements $LoginMetaCopyWith<$Res> {
  factory _$LoginMetaCopyWith(_LoginMeta value, $Res Function(_LoginMeta) _then) = __$LoginMetaCopyWithImpl;
@override @useResult
$Res call({
 String? message, bool? success
});




}
/// @nodoc
class __$LoginMetaCopyWithImpl<$Res>
    implements _$LoginMetaCopyWith<$Res> {
  __$LoginMetaCopyWithImpl(this._self, this._then);

  final _LoginMeta _self;
  final $Res Function(_LoginMeta) _then;

/// Create a copy of LoginMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? success = freezed,}) {
  return _then(_LoginMeta(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
