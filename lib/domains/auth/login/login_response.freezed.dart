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

 MetaResponse? get meta; LoginData? get data;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'LoginResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 MetaResponse? meta, LoginData? data
});


$MetaResponseCopyWith<$Res>? get meta;$LoginDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData?,
  ));
}
/// Create a copy of LoginResponse
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
}/// Create a copy of LoginResponse
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetaResponse? meta,  LoginData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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
case _LoginResponse():
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
case _LoginResponse() when $default != null:
return $default(_that.meta,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({this.meta, this.data});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  MetaResponse? meta;
@override final  LoginData? data;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,data);

@override
String toString() {
  return 'LoginResponse(meta: $meta, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 MetaResponse? meta, LoginData? data
});


@override $MetaResponseCopyWith<$Res>? get meta;@override $LoginDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? data = freezed,}) {
  return _then(_LoginResponse(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaResponse?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData?,
  ));
}

/// Create a copy of LoginResponse
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
}/// Create a copy of LoginResponse
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


/// @nodoc
mixin _$LoginData {

 int? get id; String? get token;@JsonKey(name: 'user_id') int? get userId; String? get name; int? get status;@JsonKey(name: 'is_pending_deletion') bool? get isPendingDeletion;@JsonKey(name: 'remaining_days') int? get remainingDays; String? get title; String? get description;@JsonKey(name: 'primary_action') String? get primaryAction;@JsonKey(name: 'secondary_action') String? get secondaryAction;
/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginDataCopyWith<LoginData> get copyWith => _$LoginDataCopyWithImpl<LoginData>(this as LoginData, _$identity);

  /// Serializes this LoginData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginData&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.isPendingDeletion, isPendingDeletion) || other.isPendingDeletion == isPendingDeletion)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.primaryAction, primaryAction) || other.primaryAction == primaryAction)&&(identical(other.secondaryAction, secondaryAction) || other.secondaryAction == secondaryAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token,userId,name,status,isPendingDeletion,remainingDays,title,description,primaryAction,secondaryAction);

@override
String toString() {
  return 'LoginData(id: $id, token: $token, userId: $userId, name: $name, status: $status, isPendingDeletion: $isPendingDeletion, remainingDays: $remainingDays, title: $title, description: $description, primaryAction: $primaryAction, secondaryAction: $secondaryAction)';
}


}

/// @nodoc
abstract mixin class $LoginDataCopyWith<$Res>  {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) _then) = _$LoginDataCopyWithImpl;
@useResult
$Res call({
 int? id, String? token,@JsonKey(name: 'user_id') int? userId, String? name, int? status,@JsonKey(name: 'is_pending_deletion') bool? isPendingDeletion,@JsonKey(name: 'remaining_days') int? remainingDays, String? title, String? description,@JsonKey(name: 'primary_action') String? primaryAction,@JsonKey(name: 'secondary_action') String? secondaryAction
});




}
/// @nodoc
class _$LoginDataCopyWithImpl<$Res>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._self, this._then);

  final LoginData _self;
  final $Res Function(LoginData) _then;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? token = freezed,Object? userId = freezed,Object? name = freezed,Object? status = freezed,Object? isPendingDeletion = freezed,Object? remainingDays = freezed,Object? title = freezed,Object? description = freezed,Object? primaryAction = freezed,Object? secondaryAction = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,isPendingDeletion: freezed == isPendingDeletion ? _self.isPendingDeletion : isPendingDeletion // ignore: cast_nullable_to_non_nullable
as bool?,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,primaryAction: freezed == primaryAction ? _self.primaryAction : primaryAction // ignore: cast_nullable_to_non_nullable
as String?,secondaryAction: freezed == secondaryAction ? _self.secondaryAction : secondaryAction // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? token, @JsonKey(name: 'user_id')  int? userId,  String? name,  int? status, @JsonKey(name: 'is_pending_deletion')  bool? isPendingDeletion, @JsonKey(name: 'remaining_days')  int? remainingDays,  String? title,  String? description, @JsonKey(name: 'primary_action')  String? primaryAction, @JsonKey(name: 'secondary_action')  String? secondaryAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginData() when $default != null:
return $default(_that.id,_that.token,_that.userId,_that.name,_that.status,_that.isPendingDeletion,_that.remainingDays,_that.title,_that.description,_that.primaryAction,_that.secondaryAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? token, @JsonKey(name: 'user_id')  int? userId,  String? name,  int? status, @JsonKey(name: 'is_pending_deletion')  bool? isPendingDeletion, @JsonKey(name: 'remaining_days')  int? remainingDays,  String? title,  String? description, @JsonKey(name: 'primary_action')  String? primaryAction, @JsonKey(name: 'secondary_action')  String? secondaryAction)  $default,) {final _that = this;
switch (_that) {
case _LoginData():
return $default(_that.id,_that.token,_that.userId,_that.name,_that.status,_that.isPendingDeletion,_that.remainingDays,_that.title,_that.description,_that.primaryAction,_that.secondaryAction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? token, @JsonKey(name: 'user_id')  int? userId,  String? name,  int? status, @JsonKey(name: 'is_pending_deletion')  bool? isPendingDeletion, @JsonKey(name: 'remaining_days')  int? remainingDays,  String? title,  String? description, @JsonKey(name: 'primary_action')  String? primaryAction, @JsonKey(name: 'secondary_action')  String? secondaryAction)?  $default,) {final _that = this;
switch (_that) {
case _LoginData() when $default != null:
return $default(_that.id,_that.token,_that.userId,_that.name,_that.status,_that.isPendingDeletion,_that.remainingDays,_that.title,_that.description,_that.primaryAction,_that.secondaryAction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginData implements LoginData {
  const _LoginData({this.id, this.token, @JsonKey(name: 'user_id') this.userId, this.name, this.status, @JsonKey(name: 'is_pending_deletion') this.isPendingDeletion, @JsonKey(name: 'remaining_days') this.remainingDays, this.title, this.description, @JsonKey(name: 'primary_action') this.primaryAction, @JsonKey(name: 'secondary_action') this.secondaryAction});
  factory _LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

@override final  int? id;
@override final  String? token;
@override@JsonKey(name: 'user_id') final  int? userId;
@override final  String? name;
@override final  int? status;
@override@JsonKey(name: 'is_pending_deletion') final  bool? isPendingDeletion;
@override@JsonKey(name: 'remaining_days') final  int? remainingDays;
@override final  String? title;
@override final  String? description;
@override@JsonKey(name: 'primary_action') final  String? primaryAction;
@override@JsonKey(name: 'secondary_action') final  String? secondaryAction;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginData&&(identical(other.id, id) || other.id == id)&&(identical(other.token, token) || other.token == token)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.isPendingDeletion, isPendingDeletion) || other.isPendingDeletion == isPendingDeletion)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.primaryAction, primaryAction) || other.primaryAction == primaryAction)&&(identical(other.secondaryAction, secondaryAction) || other.secondaryAction == secondaryAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,token,userId,name,status,isPendingDeletion,remainingDays,title,description,primaryAction,secondaryAction);

@override
String toString() {
  return 'LoginData(id: $id, token: $token, userId: $userId, name: $name, status: $status, isPendingDeletion: $isPendingDeletion, remainingDays: $remainingDays, title: $title, description: $description, primaryAction: $primaryAction, secondaryAction: $secondaryAction)';
}


}

/// @nodoc
abstract mixin class _$LoginDataCopyWith<$Res> implements $LoginDataCopyWith<$Res> {
  factory _$LoginDataCopyWith(_LoginData value, $Res Function(_LoginData) _then) = __$LoginDataCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? token,@JsonKey(name: 'user_id') int? userId, String? name, int? status,@JsonKey(name: 'is_pending_deletion') bool? isPendingDeletion,@JsonKey(name: 'remaining_days') int? remainingDays, String? title, String? description,@JsonKey(name: 'primary_action') String? primaryAction,@JsonKey(name: 'secondary_action') String? secondaryAction
});




}
/// @nodoc
class __$LoginDataCopyWithImpl<$Res>
    implements _$LoginDataCopyWith<$Res> {
  __$LoginDataCopyWithImpl(this._self, this._then);

  final _LoginData _self;
  final $Res Function(_LoginData) _then;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? token = freezed,Object? userId = freezed,Object? name = freezed,Object? status = freezed,Object? isPendingDeletion = freezed,Object? remainingDays = freezed,Object? title = freezed,Object? description = freezed,Object? primaryAction = freezed,Object? secondaryAction = freezed,}) {
  return _then(_LoginData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,isPendingDeletion: freezed == isPendingDeletion ? _self.isPendingDeletion : isPendingDeletion // ignore: cast_nullable_to_non_nullable
as bool?,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,primaryAction: freezed == primaryAction ? _self.primaryAction : primaryAction // ignore: cast_nullable_to_non_nullable
as String?,secondaryAction: freezed == secondaryAction ? _self.secondaryAction : secondaryAction // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
