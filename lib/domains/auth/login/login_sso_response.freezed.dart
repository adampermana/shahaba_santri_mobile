// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_sso_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginSsoResponse {

 MetaResponse? get meta; LoginSsoData? get data;
/// Create a copy of LoginSsoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSsoResponseCopyWith<LoginSsoResponse> get copyWith => _$LoginSsoResponseCopyWithImpl<LoginSsoResponse>(this as LoginSsoResponse, _$identity);

  /// Serializes this LoginSsoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSsoResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'LoginSsoResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class $LoginSsoResponseCopyWith<$Res>  {
  factory $LoginSsoResponseCopyWith(LoginSsoResponse value, $Res Function(LoginSsoResponse) _then) = _$LoginSsoResponseCopyWithImpl;
@useResult
$Res call({
 MetaResponse? meta, LoginSsoData? data
});


$MetaResponseCopyWith<$Res>? get meta;$LoginSsoDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$LoginSsoResponseCopyWithImpl<$Res>
    implements $LoginSsoResponseCopyWith<$Res> {
  _$LoginSsoResponseCopyWithImpl(this._self, this._then);

  final LoginSsoResponse _self;
  final $Res Function(LoginSsoResponse) _then;

/// Create a copy of LoginSsoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginSsoData?,
  ));
}
/// Create a copy of LoginSsoResponse
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
}/// Create a copy of LoginSsoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginSsoDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginSsoDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginSsoResponse].
extension LoginSsoResponsePatterns on LoginSsoResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginSsoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginSsoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginSsoResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginSsoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginSsoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginSsoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetaResponse? meta,  LoginSsoData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginSsoResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetaResponse? meta,  LoginSsoData? data)  $default,) {final _that = this;
switch (_that) {
case _LoginSsoResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetaResponse? meta,  LoginSsoData? data)?  $default,) {final _that = this;
switch (_that) {
case _LoginSsoResponse() when $default != null:
return $default(_that.meta,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginSsoResponse implements LoginSsoResponse {
  const _LoginSsoResponse({this.meta, this.data});
  factory _LoginSsoResponse.fromJson(Map<String, dynamic> json) => _$LoginSsoResponseFromJson(json);

@override final  MetaResponse? meta;
@override final  LoginSsoData? data;

/// Create a copy of LoginSsoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginSsoResponseCopyWith<_LoginSsoResponse> get copyWith => __$LoginSsoResponseCopyWithImpl<_LoginSsoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginSsoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginSsoResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'LoginSsoResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LoginSsoResponseCopyWith<$Res> implements $LoginSsoResponseCopyWith<$Res> {
  factory _$LoginSsoResponseCopyWith(_LoginSsoResponse value, $Res Function(_LoginSsoResponse) _then) = __$LoginSsoResponseCopyWithImpl;
@override @useResult
$Res call({
 MetaResponse? meta, LoginSsoData? data
});


@override $MetaResponseCopyWith<$Res>? get meta;@override $LoginSsoDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$LoginSsoResponseCopyWithImpl<$Res>
    implements _$LoginSsoResponseCopyWith<$Res> {
  __$LoginSsoResponseCopyWithImpl(this._self, this._then);

  final _LoginSsoResponse _self;
  final $Res Function(_LoginSsoResponse) _then;

/// Create a copy of LoginSsoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_LoginSsoResponse(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginSsoData?,
  ));
}

/// Create a copy of LoginSsoResponse
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
}/// Create a copy of LoginSsoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginSsoDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginSsoDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$LoginSsoData {

 int? get id; String? get token;@JsonKey(name: 'user_id') int? get userId; String? get name; String? get email;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'is_profile_completed') bool get isProfileCompleted; int? get status;@JsonKey(name: 'is_pending_deletion') bool get isPendingDeletion;@JsonKey(name: 'remaining_days') int? get remainingDays; String? get title; String? get description;@JsonKey(name: 'primary_action') String? get primaryAction;@JsonKey(name: 'secondary_action') String? get secondaryAction;
/// Create a copy of LoginSsoData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSsoDataCopyWith<LoginSsoData> get copyWith => _$LoginSsoDataCopyWithImpl<LoginSsoData>(this as LoginSsoData, _$identity);

  /// Serializes this LoginSsoData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSsoData&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isProfileCompleted, isProfileCompleted) || other.isProfileCompleted == isProfileCompleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.isPendingDeletion, isPendingDeletion) || other.isPendingDeletion == isPendingDeletion)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.primaryAction, primaryAction) || other.primaryAction == primaryAction)&&(identical(other.secondaryAction, secondaryAction) || other.secondaryAction == secondaryAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token,userId,name,email,phoneNumber,isProfileCompleted,status,isPendingDeletion,remainingDays,title,description,primaryAction,secondaryAction);

@override
String toString() {
  return 'LoginSsoData(id: $id, token: $token, userId: $userId, name: $name, email: $email, phoneNumber: $phoneNumber, isProfileCompleted: $isProfileCompleted, status: $status, isPendingDeletion: $isPendingDeletion, remainingDays: $remainingDays, title: $title, description: $description, primaryAction: $primaryAction, secondaryAction: $secondaryAction)';
}


}

/// @nodoc
abstract mixin class $LoginSsoDataCopyWith<$Res>  {
  factory $LoginSsoDataCopyWith(LoginSsoData value, $Res Function(LoginSsoData) _then) = _$LoginSsoDataCopyWithImpl;
@useResult
$Res call({
 int? id, String? token,@JsonKey(name: 'user_id') int? userId, String? name, String? email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'is_profile_completed') bool isProfileCompleted, int? status,@JsonKey(name: 'is_pending_deletion') bool isPendingDeletion,@JsonKey(name: 'remaining_days') int? remainingDays, String? title, String? description,@JsonKey(name: 'primary_action') String? primaryAction,@JsonKey(name: 'secondary_action') String? secondaryAction
});




}
/// @nodoc
class _$LoginSsoDataCopyWithImpl<$Res>
    implements $LoginSsoDataCopyWith<$Res> {
  _$LoginSsoDataCopyWithImpl(this._self, this._then);

  final LoginSsoData _self;
  final $Res Function(LoginSsoData) _then;

/// Create a copy of LoginSsoData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? token = freezed,Object? userId = freezed,Object? name = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? isProfileCompleted = null,Object? status = freezed,Object? isPendingDeletion = null,Object? remainingDays = freezed,Object? title = freezed,Object? description = freezed,Object? primaryAction = freezed,Object? secondaryAction = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,isProfileCompleted: null == isProfileCompleted ? _self.isProfileCompleted : isProfileCompleted // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,isPendingDeletion: null == isPendingDeletion ? _self.isPendingDeletion : isPendingDeletion // ignore: cast_nullable_to_non_nullable
as bool,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,primaryAction: freezed == primaryAction ? _self.primaryAction : primaryAction // ignore: cast_nullable_to_non_nullable
as String?,secondaryAction: freezed == secondaryAction ? _self.secondaryAction : secondaryAction // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginSsoData].
extension LoginSsoDataPatterns on LoginSsoData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginSsoData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginSsoData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginSsoData value)  $default,){
final _that = this;
switch (_that) {
case _LoginSsoData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginSsoData value)?  $default,){
final _that = this;
switch (_that) {
case _LoginSsoData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? token, @JsonKey(name: 'user_id')  int? userId,  String? name,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'is_profile_completed')  bool isProfileCompleted,  int? status, @JsonKey(name: 'is_pending_deletion')  bool isPendingDeletion, @JsonKey(name: 'remaining_days')  int? remainingDays,  String? title,  String? description, @JsonKey(name: 'primary_action')  String? primaryAction, @JsonKey(name: 'secondary_action')  String? secondaryAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginSsoData() when $default != null:
return $default(_that.id,_that.token,_that.userId,_that.name,_that.email,_that.phoneNumber,_that.isProfileCompleted,_that.status,_that.isPendingDeletion,_that.remainingDays,_that.title,_that.description,_that.primaryAction,_that.secondaryAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? token, @JsonKey(name: 'user_id')  int? userId,  String? name,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'is_profile_completed')  bool isProfileCompleted,  int? status, @JsonKey(name: 'is_pending_deletion')  bool isPendingDeletion, @JsonKey(name: 'remaining_days')  int? remainingDays,  String? title,  String? description, @JsonKey(name: 'primary_action')  String? primaryAction, @JsonKey(name: 'secondary_action')  String? secondaryAction)  $default,) {final _that = this;
switch (_that) {
case _LoginSsoData():
return $default(_that.id,_that.token,_that.userId,_that.name,_that.email,_that.phoneNumber,_that.isProfileCompleted,_that.status,_that.isPendingDeletion,_that.remainingDays,_that.title,_that.description,_that.primaryAction,_that.secondaryAction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? token, @JsonKey(name: 'user_id')  int? userId,  String? name,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'is_profile_completed')  bool isProfileCompleted,  int? status, @JsonKey(name: 'is_pending_deletion')  bool isPendingDeletion, @JsonKey(name: 'remaining_days')  int? remainingDays,  String? title,  String? description, @JsonKey(name: 'primary_action')  String? primaryAction, @JsonKey(name: 'secondary_action')  String? secondaryAction)?  $default,) {final _that = this;
switch (_that) {
case _LoginSsoData() when $default != null:
return $default(_that.id,_that.token,_that.userId,_that.name,_that.email,_that.phoneNumber,_that.isProfileCompleted,_that.status,_that.isPendingDeletion,_that.remainingDays,_that.title,_that.description,_that.primaryAction,_that.secondaryAction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginSsoData implements LoginSsoData {
  const _LoginSsoData({this.id, this.token, @JsonKey(name: 'user_id') this.userId, this.name, this.email, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'is_profile_completed') this.isProfileCompleted = false, this.status, @JsonKey(name: 'is_pending_deletion') this.isPendingDeletion = false, @JsonKey(name: 'remaining_days') this.remainingDays, this.title, this.description, @JsonKey(name: 'primary_action') this.primaryAction, @JsonKey(name: 'secondary_action') this.secondaryAction});
  factory _LoginSsoData.fromJson(Map<String, dynamic> json) => _$LoginSsoDataFromJson(json);

@override final  int? id;
@override final  String? token;
@override@JsonKey(name: 'user_id') final  int? userId;
@override final  String? name;
@override final  String? email;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'is_profile_completed') final  bool isProfileCompleted;
@override final  int? status;
@override@JsonKey(name: 'is_pending_deletion') final  bool isPendingDeletion;
@override@JsonKey(name: 'remaining_days') final  int? remainingDays;
@override final  String? title;
@override final  String? description;
@override@JsonKey(name: 'primary_action') final  String? primaryAction;
@override@JsonKey(name: 'secondary_action') final  String? secondaryAction;

/// Create a copy of LoginSsoData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginSsoDataCopyWith<_LoginSsoData> get copyWith => __$LoginSsoDataCopyWithImpl<_LoginSsoData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginSsoDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginSsoData&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isProfileCompleted, isProfileCompleted) || other.isProfileCompleted == isProfileCompleted)&&(identical(other.status, status) || other.status == status)&&(identical(other.isPendingDeletion, isPendingDeletion) || other.isPendingDeletion == isPendingDeletion)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.primaryAction, primaryAction) || other.primaryAction == primaryAction)&&(identical(other.secondaryAction, secondaryAction) || other.secondaryAction == secondaryAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token,userId,name,email,phoneNumber,isProfileCompleted,status,isPendingDeletion,remainingDays,title,description,primaryAction,secondaryAction);

@override
String toString() {
  return 'LoginSsoData(id: $id, token: $token, userId: $userId, name: $name, email: $email, phoneNumber: $phoneNumber, isProfileCompleted: $isProfileCompleted, status: $status, isPendingDeletion: $isPendingDeletion, remainingDays: $remainingDays, title: $title, description: $description, primaryAction: $primaryAction, secondaryAction: $secondaryAction)';
}


}

/// @nodoc
abstract mixin class _$LoginSsoDataCopyWith<$Res> implements $LoginSsoDataCopyWith<$Res> {
  factory _$LoginSsoDataCopyWith(_LoginSsoData value, $Res Function(_LoginSsoData) _then) = __$LoginSsoDataCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? token,@JsonKey(name: 'user_id') int? userId, String? name, String? email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'is_profile_completed') bool isProfileCompleted, int? status,@JsonKey(name: 'is_pending_deletion') bool isPendingDeletion,@JsonKey(name: 'remaining_days') int? remainingDays, String? title, String? description,@JsonKey(name: 'primary_action') String? primaryAction,@JsonKey(name: 'secondary_action') String? secondaryAction
});




}
/// @nodoc
class __$LoginSsoDataCopyWithImpl<$Res>
    implements _$LoginSsoDataCopyWith<$Res> {
  __$LoginSsoDataCopyWithImpl(this._self, this._then);

  final _LoginSsoData _self;
  final $Res Function(_LoginSsoData) _then;

/// Create a copy of LoginSsoData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? token = freezed,Object? userId = freezed,Object? name = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? isProfileCompleted = null,Object? status = freezed,Object? isPendingDeletion = null,Object? remainingDays = freezed,Object? title = freezed,Object? description = freezed,Object? primaryAction = freezed,Object? secondaryAction = freezed,}) {
  return _then(_LoginSsoData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,isProfileCompleted: null == isProfileCompleted ? _self.isProfileCompleted : isProfileCompleted // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,isPendingDeletion: null == isPendingDeletion ? _self.isPendingDeletion : isPendingDeletion // ignore: cast_nullable_to_non_nullable
as bool,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,primaryAction: freezed == primaryAction ? _self.primaryAction : primaryAction // ignore: cast_nullable_to_non_nullable
as String?,secondaryAction: freezed == secondaryAction ? _self.secondaryAction : secondaryAction // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
