// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetValidationEmail value)?  getValidationEmail,TResult Function( _PostloginUser value)?  postloginUser,TResult Function( _PostRegister value)?  postRegister,TResult Function( _PostVerifyEmail value)?  postVerifyEmail,TResult Function( _PostResendEmailOtp value)?  postResendEmailOtp,TResult Function( _PostloginGuest value)?  postloginGuest,TResult Function( _PostloginAi value)?  postloginAi,TResult Function( _PostRestoreAccount value)?  postRestoreAccount,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetValidationEmail() when getValidationEmail != null:
return getValidationEmail(_that);case _PostloginUser() when postloginUser != null:
return postloginUser(_that);case _PostRegister() when postRegister != null:
return postRegister(_that);case _PostVerifyEmail() when postVerifyEmail != null:
return postVerifyEmail(_that);case _PostResendEmailOtp() when postResendEmailOtp != null:
return postResendEmailOtp(_that);case _PostloginGuest() when postloginGuest != null:
return postloginGuest(_that);case _PostloginAi() when postloginAi != null:
return postloginAi(_that);case _PostRestoreAccount() when postRestoreAccount != null:
return postRestoreAccount(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetValidationEmail value)  getValidationEmail,required TResult Function( _PostloginUser value)  postloginUser,required TResult Function( _PostRegister value)  postRegister,required TResult Function( _PostVerifyEmail value)  postVerifyEmail,required TResult Function( _PostResendEmailOtp value)  postResendEmailOtp,required TResult Function( _PostloginGuest value)  postloginGuest,required TResult Function( _PostloginAi value)  postloginAi,required TResult Function( _PostRestoreAccount value)  postRestoreAccount,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetValidationEmail():
return getValidationEmail(_that);case _PostloginUser():
return postloginUser(_that);case _PostRegister():
return postRegister(_that);case _PostVerifyEmail():
return postVerifyEmail(_that);case _PostResendEmailOtp():
return postResendEmailOtp(_that);case _PostloginGuest():
return postloginGuest(_that);case _PostloginAi():
return postloginAi(_that);case _PostRestoreAccount():
return postRestoreAccount(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetValidationEmail value)?  getValidationEmail,TResult? Function( _PostloginUser value)?  postloginUser,TResult? Function( _PostRegister value)?  postRegister,TResult? Function( _PostVerifyEmail value)?  postVerifyEmail,TResult? Function( _PostResendEmailOtp value)?  postResendEmailOtp,TResult? Function( _PostloginGuest value)?  postloginGuest,TResult? Function( _PostloginAi value)?  postloginAi,TResult? Function( _PostRestoreAccount value)?  postRestoreAccount,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetValidationEmail() when getValidationEmail != null:
return getValidationEmail(_that);case _PostloginUser() when postloginUser != null:
return postloginUser(_that);case _PostRegister() when postRegister != null:
return postRegister(_that);case _PostVerifyEmail() when postVerifyEmail != null:
return postVerifyEmail(_that);case _PostResendEmailOtp() when postResendEmailOtp != null:
return postResendEmailOtp(_that);case _PostloginGuest() when postloginGuest != null:
return postloginGuest(_that);case _PostloginAi() when postloginAi != null:
return postloginAi(_that);case _PostRestoreAccount() when postRestoreAccount != null:
return postRestoreAccount(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String email)?  getValidationEmail,TResult Function( String identifier,  String password)?  postloginUser,TResult Function( String name,  String email,  String password)?  postRegister,TResult Function( String email,  String code)?  postVerifyEmail,TResult Function( String email)?  postResendEmailOtp,TResult Function()?  postloginGuest,TResult Function()?  postloginAi,TResult Function( String jwt)?  postRestoreAccount,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetValidationEmail() when getValidationEmail != null:
return getValidationEmail(_that.email);case _PostloginUser() when postloginUser != null:
return postloginUser(_that.identifier,_that.password);case _PostRegister() when postRegister != null:
return postRegister(_that.name,_that.email,_that.password);case _PostVerifyEmail() when postVerifyEmail != null:
return postVerifyEmail(_that.email,_that.code);case _PostResendEmailOtp() when postResendEmailOtp != null:
return postResendEmailOtp(_that.email);case _PostloginGuest() when postloginGuest != null:
return postloginGuest();case _PostloginAi() when postloginAi != null:
return postloginAi();case _PostRestoreAccount() when postRestoreAccount != null:
return postRestoreAccount(_that.jwt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String email)  getValidationEmail,required TResult Function( String identifier,  String password)  postloginUser,required TResult Function( String name,  String email,  String password)  postRegister,required TResult Function( String email,  String code)  postVerifyEmail,required TResult Function( String email)  postResendEmailOtp,required TResult Function()  postloginGuest,required TResult Function()  postloginAi,required TResult Function( String jwt)  postRestoreAccount,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetValidationEmail():
return getValidationEmail(_that.email);case _PostloginUser():
return postloginUser(_that.identifier,_that.password);case _PostRegister():
return postRegister(_that.name,_that.email,_that.password);case _PostVerifyEmail():
return postVerifyEmail(_that.email,_that.code);case _PostResendEmailOtp():
return postResendEmailOtp(_that.email);case _PostloginGuest():
return postloginGuest();case _PostloginAi():
return postloginAi();case _PostRestoreAccount():
return postRestoreAccount(_that.jwt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String email)?  getValidationEmail,TResult? Function( String identifier,  String password)?  postloginUser,TResult? Function( String name,  String email,  String password)?  postRegister,TResult? Function( String email,  String code)?  postVerifyEmail,TResult? Function( String email)?  postResendEmailOtp,TResult? Function()?  postloginGuest,TResult? Function()?  postloginAi,TResult? Function( String jwt)?  postRestoreAccount,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetValidationEmail() when getValidationEmail != null:
return getValidationEmail(_that.email);case _PostloginUser() when postloginUser != null:
return postloginUser(_that.identifier,_that.password);case _PostRegister() when postRegister != null:
return postRegister(_that.name,_that.email,_that.password);case _PostVerifyEmail() when postVerifyEmail != null:
return postVerifyEmail(_that.email,_that.code);case _PostResendEmailOtp() when postResendEmailOtp != null:
return postResendEmailOtp(_that.email);case _PostloginGuest() when postloginGuest != null:
return postloginGuest();case _PostloginAi() when postloginAi != null:
return postloginAi();case _PostRestoreAccount() when postRestoreAccount != null:
return postRestoreAccount(_that.jwt);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AuthEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.started()';
}


}




/// @nodoc


class _GetValidationEmail implements AuthEvent {
  const _GetValidationEmail({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetValidationEmailCopyWith<_GetValidationEmail> get copyWith => __$GetValidationEmailCopyWithImpl<_GetValidationEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetValidationEmail&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.getValidationEmail(email: $email)';
}


}

/// @nodoc
abstract mixin class _$GetValidationEmailCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$GetValidationEmailCopyWith(_GetValidationEmail value, $Res Function(_GetValidationEmail) _then) = __$GetValidationEmailCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$GetValidationEmailCopyWithImpl<$Res>
    implements _$GetValidationEmailCopyWith<$Res> {
  __$GetValidationEmailCopyWithImpl(this._self, this._then);

  final _GetValidationEmail _self;
  final $Res Function(_GetValidationEmail) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_GetValidationEmail(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostloginUser implements AuthEvent {
  const _PostloginUser({required this.identifier, required this.password});
  

 final  String identifier;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostloginUserCopyWith<_PostloginUser> get copyWith => __$PostloginUserCopyWithImpl<_PostloginUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostloginUser&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,identifier,password);

@override
String toString() {
  return 'AuthEvent.postloginUser(identifier: $identifier, password: $password)';
}


}

/// @nodoc
abstract mixin class _$PostloginUserCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostloginUserCopyWith(_PostloginUser value, $Res Function(_PostloginUser) _then) = __$PostloginUserCopyWithImpl;
@useResult
$Res call({
 String identifier, String password
});




}
/// @nodoc
class __$PostloginUserCopyWithImpl<$Res>
    implements _$PostloginUserCopyWith<$Res> {
  __$PostloginUserCopyWithImpl(this._self, this._then);

  final _PostloginUser _self;
  final $Res Function(_PostloginUser) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? identifier = null,Object? password = null,}) {
  return _then(_PostloginUser(
identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostRegister implements AuthEvent {
  const _PostRegister({required this.name, required this.email, required this.password});
  

 final  String name;
 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostRegisterCopyWith<_PostRegister> get copyWith => __$PostRegisterCopyWithImpl<_PostRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostRegister&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password);

@override
String toString() {
  return 'AuthEvent.postRegister(name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$PostRegisterCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostRegisterCopyWith(_PostRegister value, $Res Function(_PostRegister) _then) = __$PostRegisterCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password
});




}
/// @nodoc
class __$PostRegisterCopyWithImpl<$Res>
    implements _$PostRegisterCopyWith<$Res> {
  __$PostRegisterCopyWithImpl(this._self, this._then);

  final _PostRegister _self;
  final $Res Function(_PostRegister) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,}) {
  return _then(_PostRegister(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostVerifyEmail implements AuthEvent {
  const _PostVerifyEmail({required this.email, required this.code});
  

 final  String email;
 final  String code;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostVerifyEmailCopyWith<_PostVerifyEmail> get copyWith => __$PostVerifyEmailCopyWithImpl<_PostVerifyEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostVerifyEmail&&(identical(other.email, email) || other.email == email)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,email,code);

@override
String toString() {
  return 'AuthEvent.postVerifyEmail(email: $email, code: $code)';
}


}

/// @nodoc
abstract mixin class _$PostVerifyEmailCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostVerifyEmailCopyWith(_PostVerifyEmail value, $Res Function(_PostVerifyEmail) _then) = __$PostVerifyEmailCopyWithImpl;
@useResult
$Res call({
 String email, String code
});




}
/// @nodoc
class __$PostVerifyEmailCopyWithImpl<$Res>
    implements _$PostVerifyEmailCopyWith<$Res> {
  __$PostVerifyEmailCopyWithImpl(this._self, this._then);

  final _PostVerifyEmail _self;
  final $Res Function(_PostVerifyEmail) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? code = null,}) {
  return _then(_PostVerifyEmail(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostResendEmailOtp implements AuthEvent {
  const _PostResendEmailOtp({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostResendEmailOtpCopyWith<_PostResendEmailOtp> get copyWith => __$PostResendEmailOtpCopyWithImpl<_PostResendEmailOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostResendEmailOtp&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.postResendEmailOtp(email: $email)';
}


}

/// @nodoc
abstract mixin class _$PostResendEmailOtpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostResendEmailOtpCopyWith(_PostResendEmailOtp value, $Res Function(_PostResendEmailOtp) _then) = __$PostResendEmailOtpCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$PostResendEmailOtpCopyWithImpl<$Res>
    implements _$PostResendEmailOtpCopyWith<$Res> {
  __$PostResendEmailOtpCopyWithImpl(this._self, this._then);

  final _PostResendEmailOtp _self;
  final $Res Function(_PostResendEmailOtp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_PostResendEmailOtp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostloginGuest implements AuthEvent {
  const _PostloginGuest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostloginGuest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.postloginGuest()';
}


}




/// @nodoc


class _PostloginAi implements AuthEvent {
  const _PostloginAi();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostloginAi);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.postloginAi()';
}


}




/// @nodoc


class _PostRestoreAccount implements AuthEvent {
  const _PostRestoreAccount({required this.jwt});
  

 final  String jwt;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostRestoreAccountCopyWith<_PostRestoreAccount> get copyWith => __$PostRestoreAccountCopyWithImpl<_PostRestoreAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostRestoreAccount&&(identical(other.jwt, jwt) || other.jwt == jwt));
}


@override
int get hashCode => Object.hash(runtimeType,jwt);

@override
String toString() {
  return 'AuthEvent.postRestoreAccount(jwt: $jwt)';
}


}

/// @nodoc
abstract mixin class _$PostRestoreAccountCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostRestoreAccountCopyWith(_PostRestoreAccount value, $Res Function(_PostRestoreAccount) _then) = __$PostRestoreAccountCopyWithImpl;
@useResult
$Res call({
 String jwt
});




}
/// @nodoc
class __$PostRestoreAccountCopyWithImpl<$Res>
    implements _$PostRestoreAccountCopyWith<$Res> {
  __$PostRestoreAccountCopyWithImpl(this._self, this._then);

  final _PostRestoreAccount _self;
  final $Res Function(_PostRestoreAccount) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? jwt = null,}) {
  return _then(_PostRestoreAccount(
jwt: null == jwt ? _self.jwt : jwt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthState {

 String? get message; String? get messageVerifyOtp; bool get loading; bool get loadingUser; bool get loadingGuest; bool get loadingAi; bool get loadingVerifyEmail; bool get loadingResendOtp; bool get loadingRestoreAccount; bool get loadingValidationEmail; bool get successLoginUser; bool get successLoginGuest; bool get successLoginAi; bool get successRegister; bool get successVerifyEmail; bool get successResendOtp; bool get successRestoreAccount; bool get successValidationEmail; int? get statusCode; bool get isEmailUnverified; int get cooldownOtp; String? get pendingEmail; ValidationEmailResponse? get validationEmailResponse; LoginResponse? get loginResponse; LoginResponAI? get loginAiResponse; RegisterResponse? get registerResponse; VerifyOtpResponse? get verifyEmailResponse; ResendOtpResponse? get resendOtpResponse; AuthDataHive? get authDataHive; AuthDataKatanaraHive? get authAiDataHive; Alert? get alert;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.message, message) || other.message == message)&&(identical(other.messageVerifyOtp, messageVerifyOtp) || other.messageVerifyOtp == messageVerifyOtp)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.loadingUser, loadingUser) || other.loadingUser == loadingUser)&&(identical(other.loadingGuest, loadingGuest) || other.loadingGuest == loadingGuest)&&(identical(other.loadingAi, loadingAi) || other.loadingAi == loadingAi)&&(identical(other.loadingVerifyEmail, loadingVerifyEmail) || other.loadingVerifyEmail == loadingVerifyEmail)&&(identical(other.loadingResendOtp, loadingResendOtp) || other.loadingResendOtp == loadingResendOtp)&&(identical(other.loadingRestoreAccount, loadingRestoreAccount) || other.loadingRestoreAccount == loadingRestoreAccount)&&(identical(other.loadingValidationEmail, loadingValidationEmail) || other.loadingValidationEmail == loadingValidationEmail)&&(identical(other.successLoginUser, successLoginUser) || other.successLoginUser == successLoginUser)&&(identical(other.successLoginGuest, successLoginGuest) || other.successLoginGuest == successLoginGuest)&&(identical(other.successLoginAi, successLoginAi) || other.successLoginAi == successLoginAi)&&(identical(other.successRegister, successRegister) || other.successRegister == successRegister)&&(identical(other.successVerifyEmail, successVerifyEmail) || other.successVerifyEmail == successVerifyEmail)&&(identical(other.successResendOtp, successResendOtp) || other.successResendOtp == successResendOtp)&&(identical(other.successRestoreAccount, successRestoreAccount) || other.successRestoreAccount == successRestoreAccount)&&(identical(other.successValidationEmail, successValidationEmail) || other.successValidationEmail == successValidationEmail)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.isEmailUnverified, isEmailUnverified) || other.isEmailUnverified == isEmailUnverified)&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp)&&(identical(other.pendingEmail, pendingEmail) || other.pendingEmail == pendingEmail)&&(identical(other.validationEmailResponse, validationEmailResponse) || other.validationEmailResponse == validationEmailResponse)&&(identical(other.loginResponse, loginResponse) || other.loginResponse == loginResponse)&&(identical(other.loginAiResponse, loginAiResponse) || other.loginAiResponse == loginAiResponse)&&(identical(other.registerResponse, registerResponse) || other.registerResponse == registerResponse)&&(identical(other.verifyEmailResponse, verifyEmailResponse) || other.verifyEmailResponse == verifyEmailResponse)&&(identical(other.resendOtpResponse, resendOtpResponse) || other.resendOtpResponse == resendOtpResponse)&&(identical(other.authDataHive, authDataHive) || other.authDataHive == authDataHive)&&(identical(other.authAiDataHive, authAiDataHive) || other.authAiDataHive == authAiDataHive)&&(identical(other.alert, alert) || other.alert == alert));
}


@override
int get hashCode => Object.hashAll([runtimeType,message,messageVerifyOtp,loading,loadingUser,loadingGuest,loadingAi,loadingVerifyEmail,loadingResendOtp,loadingRestoreAccount,loadingValidationEmail,successLoginUser,successLoginGuest,successLoginAi,successRegister,successVerifyEmail,successResendOtp,successRestoreAccount,successValidationEmail,statusCode,isEmailUnverified,cooldownOtp,pendingEmail,validationEmailResponse,loginResponse,loginAiResponse,registerResponse,verifyEmailResponse,resendOtpResponse,authDataHive,authAiDataHive,alert]);

@override
String toString() {
  return 'AuthState(message: $message, messageVerifyOtp: $messageVerifyOtp, loading: $loading, loadingUser: $loadingUser, loadingGuest: $loadingGuest, loadingAi: $loadingAi, loadingVerifyEmail: $loadingVerifyEmail, loadingResendOtp: $loadingResendOtp, loadingRestoreAccount: $loadingRestoreAccount, loadingValidationEmail: $loadingValidationEmail, successLoginUser: $successLoginUser, successLoginGuest: $successLoginGuest, successLoginAi: $successLoginAi, successRegister: $successRegister, successVerifyEmail: $successVerifyEmail, successResendOtp: $successResendOtp, successRestoreAccount: $successRestoreAccount, successValidationEmail: $successValidationEmail, statusCode: $statusCode, isEmailUnverified: $isEmailUnverified, cooldownOtp: $cooldownOtp, pendingEmail: $pendingEmail, validationEmailResponse: $validationEmailResponse, loginResponse: $loginResponse, loginAiResponse: $loginAiResponse, registerResponse: $registerResponse, verifyEmailResponse: $verifyEmailResponse, resendOtpResponse: $resendOtpResponse, authDataHive: $authDataHive, authAiDataHive: $authAiDataHive, alert: $alert)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 String? message, String? messageVerifyOtp, bool loading, bool loadingUser, bool loadingGuest, bool loadingAi, bool loadingVerifyEmail, bool loadingResendOtp, bool loadingRestoreAccount, bool loadingValidationEmail, bool successLoginUser, bool successLoginGuest, bool successLoginAi, bool successRegister, bool successVerifyEmail, bool successResendOtp, bool successRestoreAccount, bool successValidationEmail, int? statusCode, bool isEmailUnverified, int cooldownOtp, String? pendingEmail, ValidationEmailResponse? validationEmailResponse, LoginResponse? loginResponse, LoginResponAI? loginAiResponse, RegisterResponse? registerResponse, VerifyOtpResponse? verifyEmailResponse, ResendOtpResponse? resendOtpResponse, AuthDataHive? authDataHive, AuthDataKatanaraHive? authAiDataHive, Alert? alert
});


$ValidationEmailResponseCopyWith<$Res>? get validationEmailResponse;$LoginResponseCopyWith<$Res>? get loginResponse;$RegisterResponseCopyWith<$Res>? get registerResponse;$VerifyOtpResponseCopyWith<$Res>? get verifyEmailResponse;$ResendOtpResponseCopyWith<$Res>? get resendOtpResponse;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? messageVerifyOtp = freezed,Object? loading = null,Object? loadingUser = null,Object? loadingGuest = null,Object? loadingAi = null,Object? loadingVerifyEmail = null,Object? loadingResendOtp = null,Object? loadingRestoreAccount = null,Object? loadingValidationEmail = null,Object? successLoginUser = null,Object? successLoginGuest = null,Object? successLoginAi = null,Object? successRegister = null,Object? successVerifyEmail = null,Object? successResendOtp = null,Object? successRestoreAccount = null,Object? successValidationEmail = null,Object? statusCode = freezed,Object? isEmailUnverified = null,Object? cooldownOtp = null,Object? pendingEmail = freezed,Object? validationEmailResponse = freezed,Object? loginResponse = freezed,Object? loginAiResponse = freezed,Object? registerResponse = freezed,Object? verifyEmailResponse = freezed,Object? resendOtpResponse = freezed,Object? authDataHive = freezed,Object? authAiDataHive = freezed,Object? alert = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageVerifyOtp: freezed == messageVerifyOtp ? _self.messageVerifyOtp : messageVerifyOtp // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,loadingUser: null == loadingUser ? _self.loadingUser : loadingUser // ignore: cast_nullable_to_non_nullable
as bool,loadingGuest: null == loadingGuest ? _self.loadingGuest : loadingGuest // ignore: cast_nullable_to_non_nullable
as bool,loadingAi: null == loadingAi ? _self.loadingAi : loadingAi // ignore: cast_nullable_to_non_nullable
as bool,loadingVerifyEmail: null == loadingVerifyEmail ? _self.loadingVerifyEmail : loadingVerifyEmail // ignore: cast_nullable_to_non_nullable
as bool,loadingResendOtp: null == loadingResendOtp ? _self.loadingResendOtp : loadingResendOtp // ignore: cast_nullable_to_non_nullable
as bool,loadingRestoreAccount: null == loadingRestoreAccount ? _self.loadingRestoreAccount : loadingRestoreAccount // ignore: cast_nullable_to_non_nullable
as bool,loadingValidationEmail: null == loadingValidationEmail ? _self.loadingValidationEmail : loadingValidationEmail // ignore: cast_nullable_to_non_nullable
as bool,successLoginUser: null == successLoginUser ? _self.successLoginUser : successLoginUser // ignore: cast_nullable_to_non_nullable
as bool,successLoginGuest: null == successLoginGuest ? _self.successLoginGuest : successLoginGuest // ignore: cast_nullable_to_non_nullable
as bool,successLoginAi: null == successLoginAi ? _self.successLoginAi : successLoginAi // ignore: cast_nullable_to_non_nullable
as bool,successRegister: null == successRegister ? _self.successRegister : successRegister // ignore: cast_nullable_to_non_nullable
as bool,successVerifyEmail: null == successVerifyEmail ? _self.successVerifyEmail : successVerifyEmail // ignore: cast_nullable_to_non_nullable
as bool,successResendOtp: null == successResendOtp ? _self.successResendOtp : successResendOtp // ignore: cast_nullable_to_non_nullable
as bool,successRestoreAccount: null == successRestoreAccount ? _self.successRestoreAccount : successRestoreAccount // ignore: cast_nullable_to_non_nullable
as bool,successValidationEmail: null == successValidationEmail ? _self.successValidationEmail : successValidationEmail // ignore: cast_nullable_to_non_nullable
as bool,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,isEmailUnverified: null == isEmailUnverified ? _self.isEmailUnverified : isEmailUnverified // ignore: cast_nullable_to_non_nullable
as bool,cooldownOtp: null == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int,pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail // ignore: cast_nullable_to_non_nullable
as String?,validationEmailResponse: freezed == validationEmailResponse ? _self.validationEmailResponse : validationEmailResponse // ignore: cast_nullable_to_non_nullable
as ValidationEmailResponse?,loginResponse: freezed == loginResponse ? _self.loginResponse : loginResponse // ignore: cast_nullable_to_non_nullable
as LoginResponse?,loginAiResponse: freezed == loginAiResponse ? _self.loginAiResponse : loginAiResponse // ignore: cast_nullable_to_non_nullable
as LoginResponAI?,registerResponse: freezed == registerResponse ? _self.registerResponse : registerResponse // ignore: cast_nullable_to_non_nullable
as RegisterResponse?,verifyEmailResponse: freezed == verifyEmailResponse ? _self.verifyEmailResponse : verifyEmailResponse // ignore: cast_nullable_to_non_nullable
as VerifyOtpResponse?,resendOtpResponse: freezed == resendOtpResponse ? _self.resendOtpResponse : resendOtpResponse // ignore: cast_nullable_to_non_nullable
as ResendOtpResponse?,authDataHive: freezed == authDataHive ? _self.authDataHive : authDataHive // ignore: cast_nullable_to_non_nullable
as AuthDataHive?,authAiDataHive: freezed == authAiDataHive ? _self.authAiDataHive : authAiDataHive // ignore: cast_nullable_to_non_nullable
as AuthDataKatanaraHive?,alert: freezed == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as Alert?,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationEmailResponseCopyWith<$Res>? get validationEmailResponse {
    if (_self.validationEmailResponse == null) {
    return null;
  }

  return $ValidationEmailResponseCopyWith<$Res>(_self.validationEmailResponse!, (value) {
    return _then(_self.copyWith(validationEmailResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<$Res>? get loginResponse {
    if (_self.loginResponse == null) {
    return null;
  }

  return $LoginResponseCopyWith<$Res>(_self.loginResponse!, (value) {
    return _then(_self.copyWith(loginResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterResponseCopyWith<$Res>? get registerResponse {
    if (_self.registerResponse == null) {
    return null;
  }

  return $RegisterResponseCopyWith<$Res>(_self.registerResponse!, (value) {
    return _then(_self.copyWith(registerResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyOtpResponseCopyWith<$Res>? get verifyEmailResponse {
    if (_self.verifyEmailResponse == null) {
    return null;
  }

  return $VerifyOtpResponseCopyWith<$Res>(_self.verifyEmailResponse!, (value) {
    return _then(_self.copyWith(verifyEmailResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResendOtpResponseCopyWith<$Res>? get resendOtpResponse {
    if (_self.resendOtpResponse == null) {
    return null;
  }

  return $ResendOtpResponseCopyWith<$Res>(_self.resendOtpResponse!, (value) {
    return _then(_self.copyWith(resendOtpResponse: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,){
final _that = this;
switch (_that) {
case _Initial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  String? messageVerifyOtp,  bool loading,  bool loadingUser,  bool loadingGuest,  bool loadingAi,  bool loadingVerifyEmail,  bool loadingResendOtp,  bool loadingRestoreAccount,  bool loadingValidationEmail,  bool successLoginUser,  bool successLoginGuest,  bool successLoginAi,  bool successRegister,  bool successVerifyEmail,  bool successResendOtp,  bool successRestoreAccount,  bool successValidationEmail,  int? statusCode,  bool isEmailUnverified,  int cooldownOtp,  String? pendingEmail,  ValidationEmailResponse? validationEmailResponse,  LoginResponse? loginResponse,  LoginResponAI? loginAiResponse,  RegisterResponse? registerResponse,  VerifyOtpResponse? verifyEmailResponse,  ResendOtpResponse? resendOtpResponse,  AuthDataHive? authDataHive,  AuthDataKatanaraHive? authAiDataHive,  Alert? alert)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.message,_that.messageVerifyOtp,_that.loading,_that.loadingUser,_that.loadingGuest,_that.loadingAi,_that.loadingVerifyEmail,_that.loadingResendOtp,_that.loadingRestoreAccount,_that.loadingValidationEmail,_that.successLoginUser,_that.successLoginGuest,_that.successLoginAi,_that.successRegister,_that.successVerifyEmail,_that.successResendOtp,_that.successRestoreAccount,_that.successValidationEmail,_that.statusCode,_that.isEmailUnverified,_that.cooldownOtp,_that.pendingEmail,_that.validationEmailResponse,_that.loginResponse,_that.loginAiResponse,_that.registerResponse,_that.verifyEmailResponse,_that.resendOtpResponse,_that.authDataHive,_that.authAiDataHive,_that.alert);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  String? messageVerifyOtp,  bool loading,  bool loadingUser,  bool loadingGuest,  bool loadingAi,  bool loadingVerifyEmail,  bool loadingResendOtp,  bool loadingRestoreAccount,  bool loadingValidationEmail,  bool successLoginUser,  bool successLoginGuest,  bool successLoginAi,  bool successRegister,  bool successVerifyEmail,  bool successResendOtp,  bool successRestoreAccount,  bool successValidationEmail,  int? statusCode,  bool isEmailUnverified,  int cooldownOtp,  String? pendingEmail,  ValidationEmailResponse? validationEmailResponse,  LoginResponse? loginResponse,  LoginResponAI? loginAiResponse,  RegisterResponse? registerResponse,  VerifyOtpResponse? verifyEmailResponse,  ResendOtpResponse? resendOtpResponse,  AuthDataHive? authDataHive,  AuthDataKatanaraHive? authAiDataHive,  Alert? alert)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.message,_that.messageVerifyOtp,_that.loading,_that.loadingUser,_that.loadingGuest,_that.loadingAi,_that.loadingVerifyEmail,_that.loadingResendOtp,_that.loadingRestoreAccount,_that.loadingValidationEmail,_that.successLoginUser,_that.successLoginGuest,_that.successLoginAi,_that.successRegister,_that.successVerifyEmail,_that.successResendOtp,_that.successRestoreAccount,_that.successValidationEmail,_that.statusCode,_that.isEmailUnverified,_that.cooldownOtp,_that.pendingEmail,_that.validationEmailResponse,_that.loginResponse,_that.loginAiResponse,_that.registerResponse,_that.verifyEmailResponse,_that.resendOtpResponse,_that.authDataHive,_that.authAiDataHive,_that.alert);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  String? messageVerifyOtp,  bool loading,  bool loadingUser,  bool loadingGuest,  bool loadingAi,  bool loadingVerifyEmail,  bool loadingResendOtp,  bool loadingRestoreAccount,  bool loadingValidationEmail,  bool successLoginUser,  bool successLoginGuest,  bool successLoginAi,  bool successRegister,  bool successVerifyEmail,  bool successResendOtp,  bool successRestoreAccount,  bool successValidationEmail,  int? statusCode,  bool isEmailUnverified,  int cooldownOtp,  String? pendingEmail,  ValidationEmailResponse? validationEmailResponse,  LoginResponse? loginResponse,  LoginResponAI? loginAiResponse,  RegisterResponse? registerResponse,  VerifyOtpResponse? verifyEmailResponse,  ResendOtpResponse? resendOtpResponse,  AuthDataHive? authDataHive,  AuthDataKatanaraHive? authAiDataHive,  Alert? alert)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.message,_that.messageVerifyOtp,_that.loading,_that.loadingUser,_that.loadingGuest,_that.loadingAi,_that.loadingVerifyEmail,_that.loadingResendOtp,_that.loadingRestoreAccount,_that.loadingValidationEmail,_that.successLoginUser,_that.successLoginGuest,_that.successLoginAi,_that.successRegister,_that.successVerifyEmail,_that.successResendOtp,_that.successRestoreAccount,_that.successValidationEmail,_that.statusCode,_that.isEmailUnverified,_that.cooldownOtp,_that.pendingEmail,_that.validationEmailResponse,_that.loginResponse,_that.loginAiResponse,_that.registerResponse,_that.verifyEmailResponse,_that.resendOtpResponse,_that.authDataHive,_that.authAiDataHive,_that.alert);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial({required this.message, required this.messageVerifyOtp, required this.loading, required this.loadingUser, required this.loadingGuest, required this.loadingAi, required this.loadingVerifyEmail, required this.loadingResendOtp, required this.loadingRestoreAccount, required this.loadingValidationEmail, required this.successLoginUser, required this.successLoginGuest, required this.successLoginAi, required this.successRegister, required this.successVerifyEmail, required this.successResendOtp, required this.successRestoreAccount, required this.successValidationEmail, required this.statusCode, required this.isEmailUnverified, required this.cooldownOtp, required this.pendingEmail, required this.validationEmailResponse, required this.loginResponse, required this.loginAiResponse, required this.registerResponse, required this.verifyEmailResponse, required this.resendOtpResponse, required this.authDataHive, required this.authAiDataHive, required this.alert});
  

@override final  String? message;
@override final  String? messageVerifyOtp;
@override final  bool loading;
@override final  bool loadingUser;
@override final  bool loadingGuest;
@override final  bool loadingAi;
@override final  bool loadingVerifyEmail;
@override final  bool loadingResendOtp;
@override final  bool loadingRestoreAccount;
@override final  bool loadingValidationEmail;
@override final  bool successLoginUser;
@override final  bool successLoginGuest;
@override final  bool successLoginAi;
@override final  bool successRegister;
@override final  bool successVerifyEmail;
@override final  bool successResendOtp;
@override final  bool successRestoreAccount;
@override final  bool successValidationEmail;
@override final  int? statusCode;
@override final  bool isEmailUnverified;
@override final  int cooldownOtp;
@override final  String? pendingEmail;
@override final  ValidationEmailResponse? validationEmailResponse;
@override final  LoginResponse? loginResponse;
@override final  LoginResponAI? loginAiResponse;
@override final  RegisterResponse? registerResponse;
@override final  VerifyOtpResponse? verifyEmailResponse;
@override final  ResendOtpResponse? resendOtpResponse;
@override final  AuthDataHive? authDataHive;
@override final  AuthDataKatanaraHive? authAiDataHive;
@override final  Alert? alert;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.message, message) || other.message == message)&&(identical(other.messageVerifyOtp, messageVerifyOtp) || other.messageVerifyOtp == messageVerifyOtp)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.loadingUser, loadingUser) || other.loadingUser == loadingUser)&&(identical(other.loadingGuest, loadingGuest) || other.loadingGuest == loadingGuest)&&(identical(other.loadingAi, loadingAi) || other.loadingAi == loadingAi)&&(identical(other.loadingVerifyEmail, loadingVerifyEmail) || other.loadingVerifyEmail == loadingVerifyEmail)&&(identical(other.loadingResendOtp, loadingResendOtp) || other.loadingResendOtp == loadingResendOtp)&&(identical(other.loadingRestoreAccount, loadingRestoreAccount) || other.loadingRestoreAccount == loadingRestoreAccount)&&(identical(other.loadingValidationEmail, loadingValidationEmail) || other.loadingValidationEmail == loadingValidationEmail)&&(identical(other.successLoginUser, successLoginUser) || other.successLoginUser == successLoginUser)&&(identical(other.successLoginGuest, successLoginGuest) || other.successLoginGuest == successLoginGuest)&&(identical(other.successLoginAi, successLoginAi) || other.successLoginAi == successLoginAi)&&(identical(other.successRegister, successRegister) || other.successRegister == successRegister)&&(identical(other.successVerifyEmail, successVerifyEmail) || other.successVerifyEmail == successVerifyEmail)&&(identical(other.successResendOtp, successResendOtp) || other.successResendOtp == successResendOtp)&&(identical(other.successRestoreAccount, successRestoreAccount) || other.successRestoreAccount == successRestoreAccount)&&(identical(other.successValidationEmail, successValidationEmail) || other.successValidationEmail == successValidationEmail)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.isEmailUnverified, isEmailUnverified) || other.isEmailUnverified == isEmailUnverified)&&(identical(other.cooldownOtp, cooldownOtp) || other.cooldownOtp == cooldownOtp)&&(identical(other.pendingEmail, pendingEmail) || other.pendingEmail == pendingEmail)&&(identical(other.validationEmailResponse, validationEmailResponse) || other.validationEmailResponse == validationEmailResponse)&&(identical(other.loginResponse, loginResponse) || other.loginResponse == loginResponse)&&(identical(other.loginAiResponse, loginAiResponse) || other.loginAiResponse == loginAiResponse)&&(identical(other.registerResponse, registerResponse) || other.registerResponse == registerResponse)&&(identical(other.verifyEmailResponse, verifyEmailResponse) || other.verifyEmailResponse == verifyEmailResponse)&&(identical(other.resendOtpResponse, resendOtpResponse) || other.resendOtpResponse == resendOtpResponse)&&(identical(other.authDataHive, authDataHive) || other.authDataHive == authDataHive)&&(identical(other.authAiDataHive, authAiDataHive) || other.authAiDataHive == authAiDataHive)&&(identical(other.alert, alert) || other.alert == alert));
}


@override
int get hashCode => Object.hashAll([runtimeType,message,messageVerifyOtp,loading,loadingUser,loadingGuest,loadingAi,loadingVerifyEmail,loadingResendOtp,loadingRestoreAccount,loadingValidationEmail,successLoginUser,successLoginGuest,successLoginAi,successRegister,successVerifyEmail,successResendOtp,successRestoreAccount,successValidationEmail,statusCode,isEmailUnverified,cooldownOtp,pendingEmail,validationEmailResponse,loginResponse,loginAiResponse,registerResponse,verifyEmailResponse,resendOtpResponse,authDataHive,authAiDataHive,alert]);

@override
String toString() {
  return 'AuthState(message: $message, messageVerifyOtp: $messageVerifyOtp, loading: $loading, loadingUser: $loadingUser, loadingGuest: $loadingGuest, loadingAi: $loadingAi, loadingVerifyEmail: $loadingVerifyEmail, loadingResendOtp: $loadingResendOtp, loadingRestoreAccount: $loadingRestoreAccount, loadingValidationEmail: $loadingValidationEmail, successLoginUser: $successLoginUser, successLoginGuest: $successLoginGuest, successLoginAi: $successLoginAi, successRegister: $successRegister, successVerifyEmail: $successVerifyEmail, successResendOtp: $successResendOtp, successRestoreAccount: $successRestoreAccount, successValidationEmail: $successValidationEmail, statusCode: $statusCode, isEmailUnverified: $isEmailUnverified, cooldownOtp: $cooldownOtp, pendingEmail: $pendingEmail, validationEmailResponse: $validationEmailResponse, loginResponse: $loginResponse, loginAiResponse: $loginAiResponse, registerResponse: $registerResponse, verifyEmailResponse: $verifyEmailResponse, resendOtpResponse: $resendOtpResponse, authDataHive: $authDataHive, authAiDataHive: $authAiDataHive, alert: $alert)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? messageVerifyOtp, bool loading, bool loadingUser, bool loadingGuest, bool loadingAi, bool loadingVerifyEmail, bool loadingResendOtp, bool loadingRestoreAccount, bool loadingValidationEmail, bool successLoginUser, bool successLoginGuest, bool successLoginAi, bool successRegister, bool successVerifyEmail, bool successResendOtp, bool successRestoreAccount, bool successValidationEmail, int? statusCode, bool isEmailUnverified, int cooldownOtp, String? pendingEmail, ValidationEmailResponse? validationEmailResponse, LoginResponse? loginResponse, LoginResponAI? loginAiResponse, RegisterResponse? registerResponse, VerifyOtpResponse? verifyEmailResponse, ResendOtpResponse? resendOtpResponse, AuthDataHive? authDataHive, AuthDataKatanaraHive? authAiDataHive, Alert? alert
});


@override $ValidationEmailResponseCopyWith<$Res>? get validationEmailResponse;@override $LoginResponseCopyWith<$Res>? get loginResponse;@override $RegisterResponseCopyWith<$Res>? get registerResponse;@override $VerifyOtpResponseCopyWith<$Res>? get verifyEmailResponse;@override $ResendOtpResponseCopyWith<$Res>? get resendOtpResponse;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? messageVerifyOtp = freezed,Object? loading = null,Object? loadingUser = null,Object? loadingGuest = null,Object? loadingAi = null,Object? loadingVerifyEmail = null,Object? loadingResendOtp = null,Object? loadingRestoreAccount = null,Object? loadingValidationEmail = null,Object? successLoginUser = null,Object? successLoginGuest = null,Object? successLoginAi = null,Object? successRegister = null,Object? successVerifyEmail = null,Object? successResendOtp = null,Object? successRestoreAccount = null,Object? successValidationEmail = null,Object? statusCode = freezed,Object? isEmailUnverified = null,Object? cooldownOtp = null,Object? pendingEmail = freezed,Object? validationEmailResponse = freezed,Object? loginResponse = freezed,Object? loginAiResponse = freezed,Object? registerResponse = freezed,Object? verifyEmailResponse = freezed,Object? resendOtpResponse = freezed,Object? authDataHive = freezed,Object? authAiDataHive = freezed,Object? alert = freezed,}) {
  return _then(_Initial(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageVerifyOtp: freezed == messageVerifyOtp ? _self.messageVerifyOtp : messageVerifyOtp // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,loadingUser: null == loadingUser ? _self.loadingUser : loadingUser // ignore: cast_nullable_to_non_nullable
as bool,loadingGuest: null == loadingGuest ? _self.loadingGuest : loadingGuest // ignore: cast_nullable_to_non_nullable
as bool,loadingAi: null == loadingAi ? _self.loadingAi : loadingAi // ignore: cast_nullable_to_non_nullable
as bool,loadingVerifyEmail: null == loadingVerifyEmail ? _self.loadingVerifyEmail : loadingVerifyEmail // ignore: cast_nullable_to_non_nullable
as bool,loadingResendOtp: null == loadingResendOtp ? _self.loadingResendOtp : loadingResendOtp // ignore: cast_nullable_to_non_nullable
as bool,loadingRestoreAccount: null == loadingRestoreAccount ? _self.loadingRestoreAccount : loadingRestoreAccount // ignore: cast_nullable_to_non_nullable
as bool,loadingValidationEmail: null == loadingValidationEmail ? _self.loadingValidationEmail : loadingValidationEmail // ignore: cast_nullable_to_non_nullable
as bool,successLoginUser: null == successLoginUser ? _self.successLoginUser : successLoginUser // ignore: cast_nullable_to_non_nullable
as bool,successLoginGuest: null == successLoginGuest ? _self.successLoginGuest : successLoginGuest // ignore: cast_nullable_to_non_nullable
as bool,successLoginAi: null == successLoginAi ? _self.successLoginAi : successLoginAi // ignore: cast_nullable_to_non_nullable
as bool,successRegister: null == successRegister ? _self.successRegister : successRegister // ignore: cast_nullable_to_non_nullable
as bool,successVerifyEmail: null == successVerifyEmail ? _self.successVerifyEmail : successVerifyEmail // ignore: cast_nullable_to_non_nullable
as bool,successResendOtp: null == successResendOtp ? _self.successResendOtp : successResendOtp // ignore: cast_nullable_to_non_nullable
as bool,successRestoreAccount: null == successRestoreAccount ? _self.successRestoreAccount : successRestoreAccount // ignore: cast_nullable_to_non_nullable
as bool,successValidationEmail: null == successValidationEmail ? _self.successValidationEmail : successValidationEmail // ignore: cast_nullable_to_non_nullable
as bool,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,isEmailUnverified: null == isEmailUnverified ? _self.isEmailUnverified : isEmailUnverified // ignore: cast_nullable_to_non_nullable
as bool,cooldownOtp: null == cooldownOtp ? _self.cooldownOtp : cooldownOtp // ignore: cast_nullable_to_non_nullable
as int,pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail // ignore: cast_nullable_to_non_nullable
as String?,validationEmailResponse: freezed == validationEmailResponse ? _self.validationEmailResponse : validationEmailResponse // ignore: cast_nullable_to_non_nullable
as ValidationEmailResponse?,loginResponse: freezed == loginResponse ? _self.loginResponse : loginResponse // ignore: cast_nullable_to_non_nullable
as LoginResponse?,loginAiResponse: freezed == loginAiResponse ? _self.loginAiResponse : loginAiResponse // ignore: cast_nullable_to_non_nullable
as LoginResponAI?,registerResponse: freezed == registerResponse ? _self.registerResponse : registerResponse // ignore: cast_nullable_to_non_nullable
as RegisterResponse?,verifyEmailResponse: freezed == verifyEmailResponse ? _self.verifyEmailResponse : verifyEmailResponse // ignore: cast_nullable_to_non_nullable
as VerifyOtpResponse?,resendOtpResponse: freezed == resendOtpResponse ? _self.resendOtpResponse : resendOtpResponse // ignore: cast_nullable_to_non_nullable
as ResendOtpResponse?,authDataHive: freezed == authDataHive ? _self.authDataHive : authDataHive // ignore: cast_nullable_to_non_nullable
as AuthDataHive?,authAiDataHive: freezed == authAiDataHive ? _self.authAiDataHive : authAiDataHive // ignore: cast_nullable_to_non_nullable
as AuthDataKatanaraHive?,alert: freezed == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as Alert?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationEmailResponseCopyWith<$Res>? get validationEmailResponse {
    if (_self.validationEmailResponse == null) {
    return null;
  }

  return $ValidationEmailResponseCopyWith<$Res>(_self.validationEmailResponse!, (value) {
    return _then(_self.copyWith(validationEmailResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<$Res>? get loginResponse {
    if (_self.loginResponse == null) {
    return null;
  }

  return $LoginResponseCopyWith<$Res>(_self.loginResponse!, (value) {
    return _then(_self.copyWith(loginResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterResponseCopyWith<$Res>? get registerResponse {
    if (_self.registerResponse == null) {
    return null;
  }

  return $RegisterResponseCopyWith<$Res>(_self.registerResponse!, (value) {
    return _then(_self.copyWith(registerResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifyOtpResponseCopyWith<$Res>? get verifyEmailResponse {
    if (_self.verifyEmailResponse == null) {
    return null;
  }

  return $VerifyOtpResponseCopyWith<$Res>(_self.verifyEmailResponse!, (value) {
    return _then(_self.copyWith(verifyEmailResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResendOtpResponseCopyWith<$Res>? get resendOtpResponse {
    if (_self.resendOtpResponse == null) {
    return null;
  }

  return $ResendOtpResponseCopyWith<$Res>(_self.resendOtpResponse!, (value) {
    return _then(_self.copyWith(resendOtpResponse: value));
  });
}
}

// dart format on
