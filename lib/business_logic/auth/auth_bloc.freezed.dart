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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _PostloginGuest value)?  postloginGuest,TResult Function( _PostloginAi value)?  postloginAi,TResult Function( _Postlogin value)?  postloginUser,TResult Function( _PostSSO value)?  postSSO,TResult Function( _PostAppleSSO value)?  postAppleSSO,TResult Function( _PostRegister value)?  postRegister,TResult Function( _PostVerifyOtp value)?  postVerifyOtp,TResult Function( _PostForgotPassword value)?  postForgotPassword,TResult Function( _PostCompleteRegisterProfile value)?  postCompleteRegisterProfile,TResult Function( _PostCompleteSsoProfile value)?  postCompleteSsoProfile,TResult Function( _PostCompleteAppleSsoProfile value)?  postCompleteAppleSsoProfile,TResult Function( _PostRestoreAccount value)?  postRestoreAccount,TResult Function( _GetLocalUser value)?  getLocalUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PostloginGuest() when postloginGuest != null:
return postloginGuest(_that);case _PostloginAi() when postloginAi != null:
return postloginAi(_that);case _Postlogin() when postloginUser != null:
return postloginUser(_that);case _PostSSO() when postSSO != null:
return postSSO(_that);case _PostAppleSSO() when postAppleSSO != null:
return postAppleSSO(_that);case _PostRegister() when postRegister != null:
return postRegister(_that);case _PostVerifyOtp() when postVerifyOtp != null:
return postVerifyOtp(_that);case _PostForgotPassword() when postForgotPassword != null:
return postForgotPassword(_that);case _PostCompleteRegisterProfile() when postCompleteRegisterProfile != null:
return postCompleteRegisterProfile(_that);case _PostCompleteSsoProfile() when postCompleteSsoProfile != null:
return postCompleteSsoProfile(_that);case _PostCompleteAppleSsoProfile() when postCompleteAppleSsoProfile != null:
return postCompleteAppleSsoProfile(_that);case _PostRestoreAccount() when postRestoreAccount != null:
return postRestoreAccount(_that);case _GetLocalUser() when getLocalUser != null:
return getLocalUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _PostloginGuest value)  postloginGuest,required TResult Function( _PostloginAi value)  postloginAi,required TResult Function( _Postlogin value)  postloginUser,required TResult Function( _PostSSO value)  postSSO,required TResult Function( _PostAppleSSO value)  postAppleSSO,required TResult Function( _PostRegister value)  postRegister,required TResult Function( _PostVerifyOtp value)  postVerifyOtp,required TResult Function( _PostForgotPassword value)  postForgotPassword,required TResult Function( _PostCompleteRegisterProfile value)  postCompleteRegisterProfile,required TResult Function( _PostCompleteSsoProfile value)  postCompleteSsoProfile,required TResult Function( _PostCompleteAppleSsoProfile value)  postCompleteAppleSsoProfile,required TResult Function( _PostRestoreAccount value)  postRestoreAccount,required TResult Function( _GetLocalUser value)  getLocalUser,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _PostloginGuest():
return postloginGuest(_that);case _PostloginAi():
return postloginAi(_that);case _Postlogin():
return postloginUser(_that);case _PostSSO():
return postSSO(_that);case _PostAppleSSO():
return postAppleSSO(_that);case _PostRegister():
return postRegister(_that);case _PostVerifyOtp():
return postVerifyOtp(_that);case _PostForgotPassword():
return postForgotPassword(_that);case _PostCompleteRegisterProfile():
return postCompleteRegisterProfile(_that);case _PostCompleteSsoProfile():
return postCompleteSsoProfile(_that);case _PostCompleteAppleSsoProfile():
return postCompleteAppleSsoProfile(_that);case _PostRestoreAccount():
return postRestoreAccount(_that);case _GetLocalUser():
return getLocalUser(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _PostloginGuest value)?  postloginGuest,TResult? Function( _PostloginAi value)?  postloginAi,TResult? Function( _Postlogin value)?  postloginUser,TResult? Function( _PostSSO value)?  postSSO,TResult? Function( _PostAppleSSO value)?  postAppleSSO,TResult? Function( _PostRegister value)?  postRegister,TResult? Function( _PostVerifyOtp value)?  postVerifyOtp,TResult? Function( _PostForgotPassword value)?  postForgotPassword,TResult? Function( _PostCompleteRegisterProfile value)?  postCompleteRegisterProfile,TResult? Function( _PostCompleteSsoProfile value)?  postCompleteSsoProfile,TResult? Function( _PostCompleteAppleSsoProfile value)?  postCompleteAppleSsoProfile,TResult? Function( _PostRestoreAccount value)?  postRestoreAccount,TResult? Function( _GetLocalUser value)?  getLocalUser,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PostloginGuest() when postloginGuest != null:
return postloginGuest(_that);case _PostloginAi() when postloginAi != null:
return postloginAi(_that);case _Postlogin() when postloginUser != null:
return postloginUser(_that);case _PostSSO() when postSSO != null:
return postSSO(_that);case _PostAppleSSO() when postAppleSSO != null:
return postAppleSSO(_that);case _PostRegister() when postRegister != null:
return postRegister(_that);case _PostVerifyOtp() when postVerifyOtp != null:
return postVerifyOtp(_that);case _PostForgotPassword() when postForgotPassword != null:
return postForgotPassword(_that);case _PostCompleteRegisterProfile() when postCompleteRegisterProfile != null:
return postCompleteRegisterProfile(_that);case _PostCompleteSsoProfile() when postCompleteSsoProfile != null:
return postCompleteSsoProfile(_that);case _PostCompleteAppleSsoProfile() when postCompleteAppleSsoProfile != null:
return postCompleteAppleSsoProfile(_that);case _PostRestoreAccount() when postRestoreAccount != null:
return postRestoreAccount(_that);case _GetLocalUser() when getLocalUser != null:
return getLocalUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  postloginGuest,TResult Function()?  postloginAi,TResult Function( String email,  String password)?  postloginUser,TResult Function()?  postSSO,TResult Function()?  postAppleSSO,TResult Function( String email)?  postRegister,TResult Function( String email,  String otp)?  postVerifyOtp,TResult Function( String email)?  postForgotPassword,TResult Function( String confirmPassword,  String deviceToken,  String email,  String name,  String newPassword,  String phoneNumber,  String platform,  String verifyToken)?  postCompleteRegisterProfile,TResult Function( String name,  String phoneNumber)?  postCompleteSsoProfile,TResult Function( String name,  String phoneNumber)?  postCompleteAppleSsoProfile,TResult Function( String jwt)?  postRestoreAccount,TResult Function()?  getLocalUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PostloginGuest() when postloginGuest != null:
return postloginGuest();case _PostloginAi() when postloginAi != null:
return postloginAi();case _Postlogin() when postloginUser != null:
return postloginUser(_that.email,_that.password);case _PostSSO() when postSSO != null:
return postSSO();case _PostAppleSSO() when postAppleSSO != null:
return postAppleSSO();case _PostRegister() when postRegister != null:
return postRegister(_that.email);case _PostVerifyOtp() when postVerifyOtp != null:
return postVerifyOtp(_that.email,_that.otp);case _PostForgotPassword() when postForgotPassword != null:
return postForgotPassword(_that.email);case _PostCompleteRegisterProfile() when postCompleteRegisterProfile != null:
return postCompleteRegisterProfile(_that.confirmPassword,_that.deviceToken,_that.email,_that.name,_that.newPassword,_that.phoneNumber,_that.platform,_that.verifyToken);case _PostCompleteSsoProfile() when postCompleteSsoProfile != null:
return postCompleteSsoProfile(_that.name,_that.phoneNumber);case _PostCompleteAppleSsoProfile() when postCompleteAppleSsoProfile != null:
return postCompleteAppleSsoProfile(_that.name,_that.phoneNumber);case _PostRestoreAccount() when postRestoreAccount != null:
return postRestoreAccount(_that.jwt);case _GetLocalUser() when getLocalUser != null:
return getLocalUser();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  postloginGuest,required TResult Function()  postloginAi,required TResult Function( String email,  String password)  postloginUser,required TResult Function()  postSSO,required TResult Function()  postAppleSSO,required TResult Function( String email)  postRegister,required TResult Function( String email,  String otp)  postVerifyOtp,required TResult Function( String email)  postForgotPassword,required TResult Function( String confirmPassword,  String deviceToken,  String email,  String name,  String newPassword,  String phoneNumber,  String platform,  String verifyToken)  postCompleteRegisterProfile,required TResult Function( String name,  String phoneNumber)  postCompleteSsoProfile,required TResult Function( String name,  String phoneNumber)  postCompleteAppleSsoProfile,required TResult Function( String jwt)  postRestoreAccount,required TResult Function()  getLocalUser,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _PostloginGuest():
return postloginGuest();case _PostloginAi():
return postloginAi();case _Postlogin():
return postloginUser(_that.email,_that.password);case _PostSSO():
return postSSO();case _PostAppleSSO():
return postAppleSSO();case _PostRegister():
return postRegister(_that.email);case _PostVerifyOtp():
return postVerifyOtp(_that.email,_that.otp);case _PostForgotPassword():
return postForgotPassword(_that.email);case _PostCompleteRegisterProfile():
return postCompleteRegisterProfile(_that.confirmPassword,_that.deviceToken,_that.email,_that.name,_that.newPassword,_that.phoneNumber,_that.platform,_that.verifyToken);case _PostCompleteSsoProfile():
return postCompleteSsoProfile(_that.name,_that.phoneNumber);case _PostCompleteAppleSsoProfile():
return postCompleteAppleSsoProfile(_that.name,_that.phoneNumber);case _PostRestoreAccount():
return postRestoreAccount(_that.jwt);case _GetLocalUser():
return getLocalUser();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  postloginGuest,TResult? Function()?  postloginAi,TResult? Function( String email,  String password)?  postloginUser,TResult? Function()?  postSSO,TResult? Function()?  postAppleSSO,TResult? Function( String email)?  postRegister,TResult? Function( String email,  String otp)?  postVerifyOtp,TResult? Function( String email)?  postForgotPassword,TResult? Function( String confirmPassword,  String deviceToken,  String email,  String name,  String newPassword,  String phoneNumber,  String platform,  String verifyToken)?  postCompleteRegisterProfile,TResult? Function( String name,  String phoneNumber)?  postCompleteSsoProfile,TResult? Function( String name,  String phoneNumber)?  postCompleteAppleSsoProfile,TResult? Function( String jwt)?  postRestoreAccount,TResult? Function()?  getLocalUser,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PostloginGuest() when postloginGuest != null:
return postloginGuest();case _PostloginAi() when postloginAi != null:
return postloginAi();case _Postlogin() when postloginUser != null:
return postloginUser(_that.email,_that.password);case _PostSSO() when postSSO != null:
return postSSO();case _PostAppleSSO() when postAppleSSO != null:
return postAppleSSO();case _PostRegister() when postRegister != null:
return postRegister(_that.email);case _PostVerifyOtp() when postVerifyOtp != null:
return postVerifyOtp(_that.email,_that.otp);case _PostForgotPassword() when postForgotPassword != null:
return postForgotPassword(_that.email);case _PostCompleteRegisterProfile() when postCompleteRegisterProfile != null:
return postCompleteRegisterProfile(_that.confirmPassword,_that.deviceToken,_that.email,_that.name,_that.newPassword,_that.phoneNumber,_that.platform,_that.verifyToken);case _PostCompleteSsoProfile() when postCompleteSsoProfile != null:
return postCompleteSsoProfile(_that.name,_that.phoneNumber);case _PostCompleteAppleSsoProfile() when postCompleteAppleSsoProfile != null:
return postCompleteAppleSsoProfile(_that.name,_that.phoneNumber);case _PostRestoreAccount() when postRestoreAccount != null:
return postRestoreAccount(_that.jwt);case _GetLocalUser() when getLocalUser != null:
return getLocalUser();case _:
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


class _Postlogin implements AuthEvent {
  const _Postlogin({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostloginCopyWith<_Postlogin> get copyWith => __$PostloginCopyWithImpl<_Postlogin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Postlogin&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.postloginUser(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$PostloginCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostloginCopyWith(_Postlogin value, $Res Function(_Postlogin) _then) = __$PostloginCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$PostloginCopyWithImpl<$Res>
    implements _$PostloginCopyWith<$Res> {
  __$PostloginCopyWithImpl(this._self, this._then);

  final _Postlogin _self;
  final $Res Function(_Postlogin) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_Postlogin(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostSSO implements AuthEvent {
  const _PostSSO();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostSSO);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.postSSO()';
}


}




/// @nodoc


class _PostAppleSSO implements AuthEvent {
  const _PostAppleSSO();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostAppleSSO);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.postAppleSSO()';
}


}




/// @nodoc


class _PostRegister implements AuthEvent {
  const _PostRegister({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostRegisterCopyWith<_PostRegister> get copyWith => __$PostRegisterCopyWithImpl<_PostRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostRegister&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.postRegister(email: $email)';
}


}

/// @nodoc
abstract mixin class _$PostRegisterCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostRegisterCopyWith(_PostRegister value, $Res Function(_PostRegister) _then) = __$PostRegisterCopyWithImpl;
@useResult
$Res call({
 String email
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
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_PostRegister(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostVerifyOtp implements AuthEvent {
  const _PostVerifyOtp({required this.email, required this.otp});
  

 final  String email;
 final  String otp;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostVerifyOtpCopyWith<_PostVerifyOtp> get copyWith => __$PostVerifyOtpCopyWithImpl<_PostVerifyOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostVerifyOtp&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'AuthEvent.postVerifyOtp(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$PostVerifyOtpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostVerifyOtpCopyWith(_PostVerifyOtp value, $Res Function(_PostVerifyOtp) _then) = __$PostVerifyOtpCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class __$PostVerifyOtpCopyWithImpl<$Res>
    implements _$PostVerifyOtpCopyWith<$Res> {
  __$PostVerifyOtpCopyWithImpl(this._self, this._then);

  final _PostVerifyOtp _self;
  final $Res Function(_PostVerifyOtp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_PostVerifyOtp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostForgotPassword implements AuthEvent {
  const _PostForgotPassword({required this.email});
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostForgotPasswordCopyWith<_PostForgotPassword> get copyWith => __$PostForgotPasswordCopyWithImpl<_PostForgotPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostForgotPassword&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.postForgotPassword(email: $email)';
}


}

/// @nodoc
abstract mixin class _$PostForgotPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostForgotPasswordCopyWith(_PostForgotPassword value, $Res Function(_PostForgotPassword) _then) = __$PostForgotPasswordCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$PostForgotPasswordCopyWithImpl<$Res>
    implements _$PostForgotPasswordCopyWith<$Res> {
  __$PostForgotPasswordCopyWithImpl(this._self, this._then);

  final _PostForgotPassword _self;
  final $Res Function(_PostForgotPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_PostForgotPassword(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostCompleteRegisterProfile implements AuthEvent {
  const _PostCompleteRegisterProfile({required this.confirmPassword, required this.deviceToken, required this.email, required this.name, required this.newPassword, required this.phoneNumber, required this.platform, required this.verifyToken});
  

 final  String confirmPassword;
 final  String deviceToken;
 final  String email;
 final  String name;
 final  String newPassword;
 final  String phoneNumber;
 final  String platform;
 final  String verifyToken;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCompleteRegisterProfileCopyWith<_PostCompleteRegisterProfile> get copyWith => __$PostCompleteRegisterProfileCopyWithImpl<_PostCompleteRegisterProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostCompleteRegisterProfile&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.deviceToken, deviceToken) || other.deviceToken == deviceToken)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.verifyToken, verifyToken) || other.verifyToken == verifyToken));
}


@override
int get hashCode => Object.hash(runtimeType,confirmPassword,deviceToken,email,name,newPassword,phoneNumber,platform,verifyToken);

@override
String toString() {
  return 'AuthEvent.postCompleteRegisterProfile(confirmPassword: $confirmPassword, deviceToken: $deviceToken, email: $email, name: $name, newPassword: $newPassword, phoneNumber: $phoneNumber, platform: $platform, verifyToken: $verifyToken)';
}


}

/// @nodoc
abstract mixin class _$PostCompleteRegisterProfileCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostCompleteRegisterProfileCopyWith(_PostCompleteRegisterProfile value, $Res Function(_PostCompleteRegisterProfile) _then) = __$PostCompleteRegisterProfileCopyWithImpl;
@useResult
$Res call({
 String confirmPassword, String deviceToken, String email, String name, String newPassword, String phoneNumber, String platform, String verifyToken
});




}
/// @nodoc
class __$PostCompleteRegisterProfileCopyWithImpl<$Res>
    implements _$PostCompleteRegisterProfileCopyWith<$Res> {
  __$PostCompleteRegisterProfileCopyWithImpl(this._self, this._then);

  final _PostCompleteRegisterProfile _self;
  final $Res Function(_PostCompleteRegisterProfile) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? confirmPassword = null,Object? deviceToken = null,Object? email = null,Object? name = null,Object? newPassword = null,Object? phoneNumber = null,Object? platform = null,Object? verifyToken = null,}) {
  return _then(_PostCompleteRegisterProfile(
confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,deviceToken: null == deviceToken ? _self.deviceToken : deviceToken // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,verifyToken: null == verifyToken ? _self.verifyToken : verifyToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostCompleteSsoProfile implements AuthEvent {
  const _PostCompleteSsoProfile({required this.name, required this.phoneNumber});
  

 final  String name;
 final  String phoneNumber;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCompleteSsoProfileCopyWith<_PostCompleteSsoProfile> get copyWith => __$PostCompleteSsoProfileCopyWithImpl<_PostCompleteSsoProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostCompleteSsoProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber);

@override
String toString() {
  return 'AuthEvent.postCompleteSsoProfile(name: $name, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$PostCompleteSsoProfileCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostCompleteSsoProfileCopyWith(_PostCompleteSsoProfile value, $Res Function(_PostCompleteSsoProfile) _then) = __$PostCompleteSsoProfileCopyWithImpl;
@useResult
$Res call({
 String name, String phoneNumber
});




}
/// @nodoc
class __$PostCompleteSsoProfileCopyWithImpl<$Res>
    implements _$PostCompleteSsoProfileCopyWith<$Res> {
  __$PostCompleteSsoProfileCopyWithImpl(this._self, this._then);

  final _PostCompleteSsoProfile _self;
  final $Res Function(_PostCompleteSsoProfile) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phoneNumber = null,}) {
  return _then(_PostCompleteSsoProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PostCompleteAppleSsoProfile implements AuthEvent {
  const _PostCompleteAppleSsoProfile({required this.name, required this.phoneNumber});
  

 final  String name;
 final  String phoneNumber;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCompleteAppleSsoProfileCopyWith<_PostCompleteAppleSsoProfile> get copyWith => __$PostCompleteAppleSsoProfileCopyWithImpl<_PostCompleteAppleSsoProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostCompleteAppleSsoProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,name,phoneNumber);

@override
String toString() {
  return 'AuthEvent.postCompleteAppleSsoProfile(name: $name, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$PostCompleteAppleSsoProfileCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$PostCompleteAppleSsoProfileCopyWith(_PostCompleteAppleSsoProfile value, $Res Function(_PostCompleteAppleSsoProfile) _then) = __$PostCompleteAppleSsoProfileCopyWithImpl;
@useResult
$Res call({
 String name, String phoneNumber
});




}
/// @nodoc
class __$PostCompleteAppleSsoProfileCopyWithImpl<$Res>
    implements _$PostCompleteAppleSsoProfileCopyWith<$Res> {
  __$PostCompleteAppleSsoProfileCopyWithImpl(this._self, this._then);

  final _PostCompleteAppleSsoProfile _self;
  final $Res Function(_PostCompleteAppleSsoProfile) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phoneNumber = null,}) {
  return _then(_PostCompleteAppleSsoProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
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


class _GetLocalUser implements AuthEvent {
  const _GetLocalUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLocalUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.getLocalUser()';
}


}




/// @nodoc
mixin _$AuthState {

 String get email; String get password; String? get message; String? get messageVerifyOtp; String? get messageTitle; String? get messageTitleVerifyOtp; String? get statusCode; int? get statusCodeVerifyOtp; bool get loading; bool get loadingUser; bool get loadingGuest; bool get loadingAi; bool get loadingSSO; bool get loadingVerifyOtp; bool get loadingRestoreAccount; bool get successLoginUser; bool get successLoginGuest; bool get successLoginAi; bool get successRegister; bool get successVerifyOtp; bool get successCompleteProfile; bool get successGoogleAuth; bool get successRestoreAccount; bool get needsCompletion; String? get tempToken; String? get googleName; String? get googleEmail; String? get verifyToken; String? get pendingEmail; int? get resendIn; LoginResponse? get loginResponse; LoginSsoResponse? get loginSsoResponse; LoginResponAI? get loginAiResponse; RegisterResponse? get registerResponse; VerifyOtpResponse? get verifyOtpResponse; CompleteProfileResponse? get completeProfileResponse; AuthDataHive? get authDataHive; AuthDataKatanaraHive? get authAiDataHive; Alert? get alert;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageVerifyOtp, messageVerifyOtp) || other.messageVerifyOtp == messageVerifyOtp)&&(identical(other.messageTitle, messageTitle) || other.messageTitle == messageTitle)&&(identical(other.messageTitleVerifyOtp, messageTitleVerifyOtp) || other.messageTitleVerifyOtp == messageTitleVerifyOtp)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.statusCodeVerifyOtp, statusCodeVerifyOtp) || other.statusCodeVerifyOtp == statusCodeVerifyOtp)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.loadingUser, loadingUser) || other.loadingUser == loadingUser)&&(identical(other.loadingGuest, loadingGuest) || other.loadingGuest == loadingGuest)&&(identical(other.loadingAi, loadingAi) || other.loadingAi == loadingAi)&&(identical(other.loadingSSO, loadingSSO) || other.loadingSSO == loadingSSO)&&(identical(other.loadingVerifyOtp, loadingVerifyOtp) || other.loadingVerifyOtp == loadingVerifyOtp)&&(identical(other.loadingRestoreAccount, loadingRestoreAccount) || other.loadingRestoreAccount == loadingRestoreAccount)&&(identical(other.successLoginUser, successLoginUser) || other.successLoginUser == successLoginUser)&&(identical(other.successLoginGuest, successLoginGuest) || other.successLoginGuest == successLoginGuest)&&(identical(other.successLoginAi, successLoginAi) || other.successLoginAi == successLoginAi)&&(identical(other.successRegister, successRegister) || other.successRegister == successRegister)&&(identical(other.successVerifyOtp, successVerifyOtp) || other.successVerifyOtp == successVerifyOtp)&&(identical(other.successCompleteProfile, successCompleteProfile) || other.successCompleteProfile == successCompleteProfile)&&(identical(other.successGoogleAuth, successGoogleAuth) || other.successGoogleAuth == successGoogleAuth)&&(identical(other.successRestoreAccount, successRestoreAccount) || other.successRestoreAccount == successRestoreAccount)&&(identical(other.needsCompletion, needsCompletion) || other.needsCompletion == needsCompletion)&&(identical(other.tempToken, tempToken) || other.tempToken == tempToken)&&(identical(other.googleName, googleName) || other.googleName == googleName)&&(identical(other.googleEmail, googleEmail) || other.googleEmail == googleEmail)&&(identical(other.verifyToken, verifyToken) || other.verifyToken == verifyToken)&&(identical(other.pendingEmail, pendingEmail) || other.pendingEmail == pendingEmail)&&(identical(other.resendIn, resendIn) || other.resendIn == resendIn)&&(identical(other.loginResponse, loginResponse) || other.loginResponse == loginResponse)&&(identical(other.loginSsoResponse, loginSsoResponse) || other.loginSsoResponse == loginSsoResponse)&&(identical(other.loginAiResponse, loginAiResponse) || other.loginAiResponse == loginAiResponse)&&(identical(other.registerResponse, registerResponse) || other.registerResponse == registerResponse)&&(identical(other.verifyOtpResponse, verifyOtpResponse) || other.verifyOtpResponse == verifyOtpResponse)&&(identical(other.completeProfileResponse, completeProfileResponse) || other.completeProfileResponse == completeProfileResponse)&&(identical(other.authDataHive, authDataHive) || other.authDataHive == authDataHive)&&(identical(other.authAiDataHive, authAiDataHive) || other.authAiDataHive == authAiDataHive)&&(identical(other.alert, alert) || other.alert == alert));
}


@override
int get hashCode => Object.hashAll([runtimeType,email,password,message,messageVerifyOtp,messageTitle,messageTitleVerifyOtp,statusCode,statusCodeVerifyOtp,loading,loadingUser,loadingGuest,loadingAi,loadingSSO,loadingVerifyOtp,loadingRestoreAccount,successLoginUser,successLoginGuest,successLoginAi,successRegister,successVerifyOtp,successCompleteProfile,successGoogleAuth,successRestoreAccount,needsCompletion,tempToken,googleName,googleEmail,verifyToken,pendingEmail,resendIn,loginResponse,loginSsoResponse,loginAiResponse,registerResponse,verifyOtpResponse,completeProfileResponse,authDataHive,authAiDataHive,alert]);

@override
String toString() {
  return 'AuthState(email: $email, password: $password, message: $message, messageVerifyOtp: $messageVerifyOtp, messageTitle: $messageTitle, messageTitleVerifyOtp: $messageTitleVerifyOtp, statusCode: $statusCode, statusCodeVerifyOtp: $statusCodeVerifyOtp, loading: $loading, loadingUser: $loadingUser, loadingGuest: $loadingGuest, loadingAi: $loadingAi, loadingSSO: $loadingSSO, loadingVerifyOtp: $loadingVerifyOtp, loadingRestoreAccount: $loadingRestoreAccount, successLoginUser: $successLoginUser, successLoginGuest: $successLoginGuest, successLoginAi: $successLoginAi, successRegister: $successRegister, successVerifyOtp: $successVerifyOtp, successCompleteProfile: $successCompleteProfile, successGoogleAuth: $successGoogleAuth, successRestoreAccount: $successRestoreAccount, needsCompletion: $needsCompletion, tempToken: $tempToken, googleName: $googleName, googleEmail: $googleEmail, verifyToken: $verifyToken, pendingEmail: $pendingEmail, resendIn: $resendIn, loginResponse: $loginResponse, loginSsoResponse: $loginSsoResponse, loginAiResponse: $loginAiResponse, registerResponse: $registerResponse, verifyOtpResponse: $verifyOtpResponse, completeProfileResponse: $completeProfileResponse, authDataHive: $authDataHive, authAiDataHive: $authAiDataHive, alert: $alert)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 String email, String password, String? message, String? messageVerifyOtp, String? messageTitle, String? messageTitleVerifyOtp, String? statusCode, int? statusCodeVerifyOtp, bool loading, bool loadingUser, bool loadingGuest, bool loadingAi, bool loadingSSO, bool loadingVerifyOtp, bool loadingRestoreAccount, bool successLoginUser, bool successLoginGuest, bool successLoginAi, bool successRegister, bool successVerifyOtp, bool successCompleteProfile, bool successGoogleAuth, bool successRestoreAccount, bool needsCompletion, String? tempToken, String? googleName, String? googleEmail, String? verifyToken, String? pendingEmail, int? resendIn, LoginResponse? loginResponse, LoginSsoResponse? loginSsoResponse, LoginResponAI? loginAiResponse, RegisterResponse? registerResponse, VerifyOtpResponse? verifyOtpResponse, CompleteProfileResponse? completeProfileResponse, AuthDataHive? authDataHive, AuthDataKatanaraHive? authAiDataHive, Alert? alert
});


$LoginResponseCopyWith<$Res>? get loginResponse;$LoginSsoResponseCopyWith<$Res>? get loginSsoResponse;$RegisterResponseCopyWith<$Res>? get registerResponse;$VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse;$CompleteProfileResponseCopyWith<$Res>? get completeProfileResponse;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? message = freezed,Object? messageVerifyOtp = freezed,Object? messageTitle = freezed,Object? messageTitleVerifyOtp = freezed,Object? statusCode = freezed,Object? statusCodeVerifyOtp = freezed,Object? loading = null,Object? loadingUser = null,Object? loadingGuest = null,Object? loadingAi = null,Object? loadingSSO = null,Object? loadingVerifyOtp = null,Object? loadingRestoreAccount = null,Object? successLoginUser = null,Object? successLoginGuest = null,Object? successLoginAi = null,Object? successRegister = null,Object? successVerifyOtp = null,Object? successCompleteProfile = null,Object? successGoogleAuth = null,Object? successRestoreAccount = null,Object? needsCompletion = null,Object? tempToken = freezed,Object? googleName = freezed,Object? googleEmail = freezed,Object? verifyToken = freezed,Object? pendingEmail = freezed,Object? resendIn = freezed,Object? loginResponse = freezed,Object? loginSsoResponse = freezed,Object? loginAiResponse = freezed,Object? registerResponse = freezed,Object? verifyOtpResponse = freezed,Object? completeProfileResponse = freezed,Object? authDataHive = freezed,Object? authAiDataHive = freezed,Object? alert = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageVerifyOtp: freezed == messageVerifyOtp ? _self.messageVerifyOtp : messageVerifyOtp // ignore: cast_nullable_to_non_nullable
as String?,messageTitle: freezed == messageTitle ? _self.messageTitle : messageTitle // ignore: cast_nullable_to_non_nullable
as String?,messageTitleVerifyOtp: freezed == messageTitleVerifyOtp ? _self.messageTitleVerifyOtp : messageTitleVerifyOtp // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,statusCodeVerifyOtp: freezed == statusCodeVerifyOtp ? _self.statusCodeVerifyOtp : statusCodeVerifyOtp // ignore: cast_nullable_to_non_nullable
as int?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,loadingUser: null == loadingUser ? _self.loadingUser : loadingUser // ignore: cast_nullable_to_non_nullable
as bool,loadingGuest: null == loadingGuest ? _self.loadingGuest : loadingGuest // ignore: cast_nullable_to_non_nullable
as bool,loadingAi: null == loadingAi ? _self.loadingAi : loadingAi // ignore: cast_nullable_to_non_nullable
as bool,loadingSSO: null == loadingSSO ? _self.loadingSSO : loadingSSO // ignore: cast_nullable_to_non_nullable
as bool,loadingVerifyOtp: null == loadingVerifyOtp ? _self.loadingVerifyOtp : loadingVerifyOtp // ignore: cast_nullable_to_non_nullable
as bool,loadingRestoreAccount: null == loadingRestoreAccount ? _self.loadingRestoreAccount : loadingRestoreAccount // ignore: cast_nullable_to_non_nullable
as bool,successLoginUser: null == successLoginUser ? _self.successLoginUser : successLoginUser // ignore: cast_nullable_to_non_nullable
as bool,successLoginGuest: null == successLoginGuest ? _self.successLoginGuest : successLoginGuest // ignore: cast_nullable_to_non_nullable
as bool,successLoginAi: null == successLoginAi ? _self.successLoginAi : successLoginAi // ignore: cast_nullable_to_non_nullable
as bool,successRegister: null == successRegister ? _self.successRegister : successRegister // ignore: cast_nullable_to_non_nullable
as bool,successVerifyOtp: null == successVerifyOtp ? _self.successVerifyOtp : successVerifyOtp // ignore: cast_nullable_to_non_nullable
as bool,successCompleteProfile: null == successCompleteProfile ? _self.successCompleteProfile : successCompleteProfile // ignore: cast_nullable_to_non_nullable
as bool,successGoogleAuth: null == successGoogleAuth ? _self.successGoogleAuth : successGoogleAuth // ignore: cast_nullable_to_non_nullable
as bool,successRestoreAccount: null == successRestoreAccount ? _self.successRestoreAccount : successRestoreAccount // ignore: cast_nullable_to_non_nullable
as bool,needsCompletion: null == needsCompletion ? _self.needsCompletion : needsCompletion // ignore: cast_nullable_to_non_nullable
as bool,tempToken: freezed == tempToken ? _self.tempToken : tempToken // ignore: cast_nullable_to_non_nullable
as String?,googleName: freezed == googleName ? _self.googleName : googleName // ignore: cast_nullable_to_non_nullable
as String?,googleEmail: freezed == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String?,verifyToken: freezed == verifyToken ? _self.verifyToken : verifyToken // ignore: cast_nullable_to_non_nullable
as String?,pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail // ignore: cast_nullable_to_non_nullable
as String?,resendIn: freezed == resendIn ? _self.resendIn : resendIn // ignore: cast_nullable_to_non_nullable
as int?,loginResponse: freezed == loginResponse ? _self.loginResponse : loginResponse // ignore: cast_nullable_to_non_nullable
as LoginResponse?,loginSsoResponse: freezed == loginSsoResponse ? _self.loginSsoResponse : loginSsoResponse // ignore: cast_nullable_to_non_nullable
as LoginSsoResponse?,loginAiResponse: freezed == loginAiResponse ? _self.loginAiResponse : loginAiResponse // ignore: cast_nullable_to_non_nullable
as LoginResponAI?,registerResponse: freezed == registerResponse ? _self.registerResponse : registerResponse // ignore: cast_nullable_to_non_nullable
as RegisterResponse?,verifyOtpResponse: freezed == verifyOtpResponse ? _self.verifyOtpResponse : verifyOtpResponse // ignore: cast_nullable_to_non_nullable
as VerifyOtpResponse?,completeProfileResponse: freezed == completeProfileResponse ? _self.completeProfileResponse : completeProfileResponse // ignore: cast_nullable_to_non_nullable
as CompleteProfileResponse?,authDataHive: freezed == authDataHive ? _self.authDataHive : authDataHive // ignore: cast_nullable_to_non_nullable
as AuthDataHive?,authAiDataHive: freezed == authAiDataHive ? _self.authAiDataHive : authAiDataHive // ignore: cast_nullable_to_non_nullable
as AuthDataKatanaraHive?,alert: freezed == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as Alert?,
  ));
}
/// Create a copy of AuthState
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
$LoginSsoResponseCopyWith<$Res>? get loginSsoResponse {
    if (_self.loginSsoResponse == null) {
    return null;
  }

  return $LoginSsoResponseCopyWith<$Res>(_self.loginSsoResponse!, (value) {
    return _then(_self.copyWith(loginSsoResponse: value));
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
$VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse {
    if (_self.verifyOtpResponse == null) {
    return null;
  }

  return $VerifyOtpResponseCopyWith<$Res>(_self.verifyOtpResponse!, (value) {
    return _then(_self.copyWith(verifyOtpResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompleteProfileResponseCopyWith<$Res>? get completeProfileResponse {
    if (_self.completeProfileResponse == null) {
    return null;
  }

  return $CompleteProfileResponseCopyWith<$Res>(_self.completeProfileResponse!, (value) {
    return _then(_self.copyWith(completeProfileResponse: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String? message,  String? messageVerifyOtp,  String? messageTitle,  String? messageTitleVerifyOtp,  String? statusCode,  int? statusCodeVerifyOtp,  bool loading,  bool loadingUser,  bool loadingGuest,  bool loadingAi,  bool loadingSSO,  bool loadingVerifyOtp,  bool loadingRestoreAccount,  bool successLoginUser,  bool successLoginGuest,  bool successLoginAi,  bool successRegister,  bool successVerifyOtp,  bool successCompleteProfile,  bool successGoogleAuth,  bool successRestoreAccount,  bool needsCompletion,  String? tempToken,  String? googleName,  String? googleEmail,  String? verifyToken,  String? pendingEmail,  int? resendIn,  LoginResponse? loginResponse,  LoginSsoResponse? loginSsoResponse,  LoginResponAI? loginAiResponse,  RegisterResponse? registerResponse,  VerifyOtpResponse? verifyOtpResponse,  CompleteProfileResponse? completeProfileResponse,  AuthDataHive? authDataHive,  AuthDataKatanaraHive? authAiDataHive,  Alert? alert)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.email,_that.password,_that.message,_that.messageVerifyOtp,_that.messageTitle,_that.messageTitleVerifyOtp,_that.statusCode,_that.statusCodeVerifyOtp,_that.loading,_that.loadingUser,_that.loadingGuest,_that.loadingAi,_that.loadingSSO,_that.loadingVerifyOtp,_that.loadingRestoreAccount,_that.successLoginUser,_that.successLoginGuest,_that.successLoginAi,_that.successRegister,_that.successVerifyOtp,_that.successCompleteProfile,_that.successGoogleAuth,_that.successRestoreAccount,_that.needsCompletion,_that.tempToken,_that.googleName,_that.googleEmail,_that.verifyToken,_that.pendingEmail,_that.resendIn,_that.loginResponse,_that.loginSsoResponse,_that.loginAiResponse,_that.registerResponse,_that.verifyOtpResponse,_that.completeProfileResponse,_that.authDataHive,_that.authAiDataHive,_that.alert);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String? message,  String? messageVerifyOtp,  String? messageTitle,  String? messageTitleVerifyOtp,  String? statusCode,  int? statusCodeVerifyOtp,  bool loading,  bool loadingUser,  bool loadingGuest,  bool loadingAi,  bool loadingSSO,  bool loadingVerifyOtp,  bool loadingRestoreAccount,  bool successLoginUser,  bool successLoginGuest,  bool successLoginAi,  bool successRegister,  bool successVerifyOtp,  bool successCompleteProfile,  bool successGoogleAuth,  bool successRestoreAccount,  bool needsCompletion,  String? tempToken,  String? googleName,  String? googleEmail,  String? verifyToken,  String? pendingEmail,  int? resendIn,  LoginResponse? loginResponse,  LoginSsoResponse? loginSsoResponse,  LoginResponAI? loginAiResponse,  RegisterResponse? registerResponse,  VerifyOtpResponse? verifyOtpResponse,  CompleteProfileResponse? completeProfileResponse,  AuthDataHive? authDataHive,  AuthDataKatanaraHive? authAiDataHive,  Alert? alert)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.email,_that.password,_that.message,_that.messageVerifyOtp,_that.messageTitle,_that.messageTitleVerifyOtp,_that.statusCode,_that.statusCodeVerifyOtp,_that.loading,_that.loadingUser,_that.loadingGuest,_that.loadingAi,_that.loadingSSO,_that.loadingVerifyOtp,_that.loadingRestoreAccount,_that.successLoginUser,_that.successLoginGuest,_that.successLoginAi,_that.successRegister,_that.successVerifyOtp,_that.successCompleteProfile,_that.successGoogleAuth,_that.successRestoreAccount,_that.needsCompletion,_that.tempToken,_that.googleName,_that.googleEmail,_that.verifyToken,_that.pendingEmail,_that.resendIn,_that.loginResponse,_that.loginSsoResponse,_that.loginAiResponse,_that.registerResponse,_that.verifyOtpResponse,_that.completeProfileResponse,_that.authDataHive,_that.authAiDataHive,_that.alert);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String? message,  String? messageVerifyOtp,  String? messageTitle,  String? messageTitleVerifyOtp,  String? statusCode,  int? statusCodeVerifyOtp,  bool loading,  bool loadingUser,  bool loadingGuest,  bool loadingAi,  bool loadingSSO,  bool loadingVerifyOtp,  bool loadingRestoreAccount,  bool successLoginUser,  bool successLoginGuest,  bool successLoginAi,  bool successRegister,  bool successVerifyOtp,  bool successCompleteProfile,  bool successGoogleAuth,  bool successRestoreAccount,  bool needsCompletion,  String? tempToken,  String? googleName,  String? googleEmail,  String? verifyToken,  String? pendingEmail,  int? resendIn,  LoginResponse? loginResponse,  LoginSsoResponse? loginSsoResponse,  LoginResponAI? loginAiResponse,  RegisterResponse? registerResponse,  VerifyOtpResponse? verifyOtpResponse,  CompleteProfileResponse? completeProfileResponse,  AuthDataHive? authDataHive,  AuthDataKatanaraHive? authAiDataHive,  Alert? alert)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.email,_that.password,_that.message,_that.messageVerifyOtp,_that.messageTitle,_that.messageTitleVerifyOtp,_that.statusCode,_that.statusCodeVerifyOtp,_that.loading,_that.loadingUser,_that.loadingGuest,_that.loadingAi,_that.loadingSSO,_that.loadingVerifyOtp,_that.loadingRestoreAccount,_that.successLoginUser,_that.successLoginGuest,_that.successLoginAi,_that.successRegister,_that.successVerifyOtp,_that.successCompleteProfile,_that.successGoogleAuth,_that.successRestoreAccount,_that.needsCompletion,_that.tempToken,_that.googleName,_that.googleEmail,_that.verifyToken,_that.pendingEmail,_that.resendIn,_that.loginResponse,_that.loginSsoResponse,_that.loginAiResponse,_that.registerResponse,_that.verifyOtpResponse,_that.completeProfileResponse,_that.authDataHive,_that.authAiDataHive,_that.alert);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial({required this.email, required this.password, required this.message, required this.messageVerifyOtp, required this.messageTitle, required this.messageTitleVerifyOtp, required this.statusCode, required this.statusCodeVerifyOtp, required this.loading, required this.loadingUser, required this.loadingGuest, required this.loadingAi, required this.loadingSSO, required this.loadingVerifyOtp, required this.loadingRestoreAccount, required this.successLoginUser, required this.successLoginGuest, required this.successLoginAi, required this.successRegister, required this.successVerifyOtp, required this.successCompleteProfile, required this.successGoogleAuth, required this.successRestoreAccount, required this.needsCompletion, required this.tempToken, required this.googleName, required this.googleEmail, required this.verifyToken, required this.pendingEmail, required this.resendIn, required this.loginResponse, required this.loginSsoResponse, required this.loginAiResponse, required this.registerResponse, required this.verifyOtpResponse, required this.completeProfileResponse, required this.authDataHive, required this.authAiDataHive, required this.alert});
  

@override final  String email;
@override final  String password;
@override final  String? message;
@override final  String? messageVerifyOtp;
@override final  String? messageTitle;
@override final  String? messageTitleVerifyOtp;
@override final  String? statusCode;
@override final  int? statusCodeVerifyOtp;
@override final  bool loading;
@override final  bool loadingUser;
@override final  bool loadingGuest;
@override final  bool loadingAi;
@override final  bool loadingSSO;
@override final  bool loadingVerifyOtp;
@override final  bool loadingRestoreAccount;
@override final  bool successLoginUser;
@override final  bool successLoginGuest;
@override final  bool successLoginAi;
@override final  bool successRegister;
@override final  bool successVerifyOtp;
@override final  bool successCompleteProfile;
@override final  bool successGoogleAuth;
@override final  bool successRestoreAccount;
@override final  bool needsCompletion;
@override final  String? tempToken;
@override final  String? googleName;
@override final  String? googleEmail;
@override final  String? verifyToken;
@override final  String? pendingEmail;
@override final  int? resendIn;
@override final  LoginResponse? loginResponse;
@override final  LoginSsoResponse? loginSsoResponse;
@override final  LoginResponAI? loginAiResponse;
@override final  RegisterResponse? registerResponse;
@override final  VerifyOtpResponse? verifyOtpResponse;
@override final  CompleteProfileResponse? completeProfileResponse;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageVerifyOtp, messageVerifyOtp) || other.messageVerifyOtp == messageVerifyOtp)&&(identical(other.messageTitle, messageTitle) || other.messageTitle == messageTitle)&&(identical(other.messageTitleVerifyOtp, messageTitleVerifyOtp) || other.messageTitleVerifyOtp == messageTitleVerifyOtp)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.statusCodeVerifyOtp, statusCodeVerifyOtp) || other.statusCodeVerifyOtp == statusCodeVerifyOtp)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.loadingUser, loadingUser) || other.loadingUser == loadingUser)&&(identical(other.loadingGuest, loadingGuest) || other.loadingGuest == loadingGuest)&&(identical(other.loadingAi, loadingAi) || other.loadingAi == loadingAi)&&(identical(other.loadingSSO, loadingSSO) || other.loadingSSO == loadingSSO)&&(identical(other.loadingVerifyOtp, loadingVerifyOtp) || other.loadingVerifyOtp == loadingVerifyOtp)&&(identical(other.loadingRestoreAccount, loadingRestoreAccount) || other.loadingRestoreAccount == loadingRestoreAccount)&&(identical(other.successLoginUser, successLoginUser) || other.successLoginUser == successLoginUser)&&(identical(other.successLoginGuest, successLoginGuest) || other.successLoginGuest == successLoginGuest)&&(identical(other.successLoginAi, successLoginAi) || other.successLoginAi == successLoginAi)&&(identical(other.successRegister, successRegister) || other.successRegister == successRegister)&&(identical(other.successVerifyOtp, successVerifyOtp) || other.successVerifyOtp == successVerifyOtp)&&(identical(other.successCompleteProfile, successCompleteProfile) || other.successCompleteProfile == successCompleteProfile)&&(identical(other.successGoogleAuth, successGoogleAuth) || other.successGoogleAuth == successGoogleAuth)&&(identical(other.successRestoreAccount, successRestoreAccount) || other.successRestoreAccount == successRestoreAccount)&&(identical(other.needsCompletion, needsCompletion) || other.needsCompletion == needsCompletion)&&(identical(other.tempToken, tempToken) || other.tempToken == tempToken)&&(identical(other.googleName, googleName) || other.googleName == googleName)&&(identical(other.googleEmail, googleEmail) || other.googleEmail == googleEmail)&&(identical(other.verifyToken, verifyToken) || other.verifyToken == verifyToken)&&(identical(other.pendingEmail, pendingEmail) || other.pendingEmail == pendingEmail)&&(identical(other.resendIn, resendIn) || other.resendIn == resendIn)&&(identical(other.loginResponse, loginResponse) || other.loginResponse == loginResponse)&&(identical(other.loginSsoResponse, loginSsoResponse) || other.loginSsoResponse == loginSsoResponse)&&(identical(other.loginAiResponse, loginAiResponse) || other.loginAiResponse == loginAiResponse)&&(identical(other.registerResponse, registerResponse) || other.registerResponse == registerResponse)&&(identical(other.verifyOtpResponse, verifyOtpResponse) || other.verifyOtpResponse == verifyOtpResponse)&&(identical(other.completeProfileResponse, completeProfileResponse) || other.completeProfileResponse == completeProfileResponse)&&(identical(other.authDataHive, authDataHive) || other.authDataHive == authDataHive)&&(identical(other.authAiDataHive, authAiDataHive) || other.authAiDataHive == authAiDataHive)&&(identical(other.alert, alert) || other.alert == alert));
}


@override
int get hashCode => Object.hashAll([runtimeType,email,password,message,messageVerifyOtp,messageTitle,messageTitleVerifyOtp,statusCode,statusCodeVerifyOtp,loading,loadingUser,loadingGuest,loadingAi,loadingSSO,loadingVerifyOtp,loadingRestoreAccount,successLoginUser,successLoginGuest,successLoginAi,successRegister,successVerifyOtp,successCompleteProfile,successGoogleAuth,successRestoreAccount,needsCompletion,tempToken,googleName,googleEmail,verifyToken,pendingEmail,resendIn,loginResponse,loginSsoResponse,loginAiResponse,registerResponse,verifyOtpResponse,completeProfileResponse,authDataHive,authAiDataHive,alert]);

@override
String toString() {
  return 'AuthState(email: $email, password: $password, message: $message, messageVerifyOtp: $messageVerifyOtp, messageTitle: $messageTitle, messageTitleVerifyOtp: $messageTitleVerifyOtp, statusCode: $statusCode, statusCodeVerifyOtp: $statusCodeVerifyOtp, loading: $loading, loadingUser: $loadingUser, loadingGuest: $loadingGuest, loadingAi: $loadingAi, loadingSSO: $loadingSSO, loadingVerifyOtp: $loadingVerifyOtp, loadingRestoreAccount: $loadingRestoreAccount, successLoginUser: $successLoginUser, successLoginGuest: $successLoginGuest, successLoginAi: $successLoginAi, successRegister: $successRegister, successVerifyOtp: $successVerifyOtp, successCompleteProfile: $successCompleteProfile, successGoogleAuth: $successGoogleAuth, successRestoreAccount: $successRestoreAccount, needsCompletion: $needsCompletion, tempToken: $tempToken, googleName: $googleName, googleEmail: $googleEmail, verifyToken: $verifyToken, pendingEmail: $pendingEmail, resendIn: $resendIn, loginResponse: $loginResponse, loginSsoResponse: $loginSsoResponse, loginAiResponse: $loginAiResponse, registerResponse: $registerResponse, verifyOtpResponse: $verifyOtpResponse, completeProfileResponse: $completeProfileResponse, authDataHive: $authDataHive, authAiDataHive: $authAiDataHive, alert: $alert)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String? message, String? messageVerifyOtp, String? messageTitle, String? messageTitleVerifyOtp, String? statusCode, int? statusCodeVerifyOtp, bool loading, bool loadingUser, bool loadingGuest, bool loadingAi, bool loadingSSO, bool loadingVerifyOtp, bool loadingRestoreAccount, bool successLoginUser, bool successLoginGuest, bool successLoginAi, bool successRegister, bool successVerifyOtp, bool successCompleteProfile, bool successGoogleAuth, bool successRestoreAccount, bool needsCompletion, String? tempToken, String? googleName, String? googleEmail, String? verifyToken, String? pendingEmail, int? resendIn, LoginResponse? loginResponse, LoginSsoResponse? loginSsoResponse, LoginResponAI? loginAiResponse, RegisterResponse? registerResponse, VerifyOtpResponse? verifyOtpResponse, CompleteProfileResponse? completeProfileResponse, AuthDataHive? authDataHive, AuthDataKatanaraHive? authAiDataHive, Alert? alert
});


@override $LoginResponseCopyWith<$Res>? get loginResponse;@override $LoginSsoResponseCopyWith<$Res>? get loginSsoResponse;@override $RegisterResponseCopyWith<$Res>? get registerResponse;@override $VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse;@override $CompleteProfileResponseCopyWith<$Res>? get completeProfileResponse;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? message = freezed,Object? messageVerifyOtp = freezed,Object? messageTitle = freezed,Object? messageTitleVerifyOtp = freezed,Object? statusCode = freezed,Object? statusCodeVerifyOtp = freezed,Object? loading = null,Object? loadingUser = null,Object? loadingGuest = null,Object? loadingAi = null,Object? loadingSSO = null,Object? loadingVerifyOtp = null,Object? loadingRestoreAccount = null,Object? successLoginUser = null,Object? successLoginGuest = null,Object? successLoginAi = null,Object? successRegister = null,Object? successVerifyOtp = null,Object? successCompleteProfile = null,Object? successGoogleAuth = null,Object? successRestoreAccount = null,Object? needsCompletion = null,Object? tempToken = freezed,Object? googleName = freezed,Object? googleEmail = freezed,Object? verifyToken = freezed,Object? pendingEmail = freezed,Object? resendIn = freezed,Object? loginResponse = freezed,Object? loginSsoResponse = freezed,Object? loginAiResponse = freezed,Object? registerResponse = freezed,Object? verifyOtpResponse = freezed,Object? completeProfileResponse = freezed,Object? authDataHive = freezed,Object? authAiDataHive = freezed,Object? alert = freezed,}) {
  return _then(_Initial(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageVerifyOtp: freezed == messageVerifyOtp ? _self.messageVerifyOtp : messageVerifyOtp // ignore: cast_nullable_to_non_nullable
as String?,messageTitle: freezed == messageTitle ? _self.messageTitle : messageTitle // ignore: cast_nullable_to_non_nullable
as String?,messageTitleVerifyOtp: freezed == messageTitleVerifyOtp ? _self.messageTitleVerifyOtp : messageTitleVerifyOtp // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,statusCodeVerifyOtp: freezed == statusCodeVerifyOtp ? _self.statusCodeVerifyOtp : statusCodeVerifyOtp // ignore: cast_nullable_to_non_nullable
as int?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,loadingUser: null == loadingUser ? _self.loadingUser : loadingUser // ignore: cast_nullable_to_non_nullable
as bool,loadingGuest: null == loadingGuest ? _self.loadingGuest : loadingGuest // ignore: cast_nullable_to_non_nullable
as bool,loadingAi: null == loadingAi ? _self.loadingAi : loadingAi // ignore: cast_nullable_to_non_nullable
as bool,loadingSSO: null == loadingSSO ? _self.loadingSSO : loadingSSO // ignore: cast_nullable_to_non_nullable
as bool,loadingVerifyOtp: null == loadingVerifyOtp ? _self.loadingVerifyOtp : loadingVerifyOtp // ignore: cast_nullable_to_non_nullable
as bool,loadingRestoreAccount: null == loadingRestoreAccount ? _self.loadingRestoreAccount : loadingRestoreAccount // ignore: cast_nullable_to_non_nullable
as bool,successLoginUser: null == successLoginUser ? _self.successLoginUser : successLoginUser // ignore: cast_nullable_to_non_nullable
as bool,successLoginGuest: null == successLoginGuest ? _self.successLoginGuest : successLoginGuest // ignore: cast_nullable_to_non_nullable
as bool,successLoginAi: null == successLoginAi ? _self.successLoginAi : successLoginAi // ignore: cast_nullable_to_non_nullable
as bool,successRegister: null == successRegister ? _self.successRegister : successRegister // ignore: cast_nullable_to_non_nullable
as bool,successVerifyOtp: null == successVerifyOtp ? _self.successVerifyOtp : successVerifyOtp // ignore: cast_nullable_to_non_nullable
as bool,successCompleteProfile: null == successCompleteProfile ? _self.successCompleteProfile : successCompleteProfile // ignore: cast_nullable_to_non_nullable
as bool,successGoogleAuth: null == successGoogleAuth ? _self.successGoogleAuth : successGoogleAuth // ignore: cast_nullable_to_non_nullable
as bool,successRestoreAccount: null == successRestoreAccount ? _self.successRestoreAccount : successRestoreAccount // ignore: cast_nullable_to_non_nullable
as bool,needsCompletion: null == needsCompletion ? _self.needsCompletion : needsCompletion // ignore: cast_nullable_to_non_nullable
as bool,tempToken: freezed == tempToken ? _self.tempToken : tempToken // ignore: cast_nullable_to_non_nullable
as String?,googleName: freezed == googleName ? _self.googleName : googleName // ignore: cast_nullable_to_non_nullable
as String?,googleEmail: freezed == googleEmail ? _self.googleEmail : googleEmail // ignore: cast_nullable_to_non_nullable
as String?,verifyToken: freezed == verifyToken ? _self.verifyToken : verifyToken // ignore: cast_nullable_to_non_nullable
as String?,pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail // ignore: cast_nullable_to_non_nullable
as String?,resendIn: freezed == resendIn ? _self.resendIn : resendIn // ignore: cast_nullable_to_non_nullable
as int?,loginResponse: freezed == loginResponse ? _self.loginResponse : loginResponse // ignore: cast_nullable_to_non_nullable
as LoginResponse?,loginSsoResponse: freezed == loginSsoResponse ? _self.loginSsoResponse : loginSsoResponse // ignore: cast_nullable_to_non_nullable
as LoginSsoResponse?,loginAiResponse: freezed == loginAiResponse ? _self.loginAiResponse : loginAiResponse // ignore: cast_nullable_to_non_nullable
as LoginResponAI?,registerResponse: freezed == registerResponse ? _self.registerResponse : registerResponse // ignore: cast_nullable_to_non_nullable
as RegisterResponse?,verifyOtpResponse: freezed == verifyOtpResponse ? _self.verifyOtpResponse : verifyOtpResponse // ignore: cast_nullable_to_non_nullable
as VerifyOtpResponse?,completeProfileResponse: freezed == completeProfileResponse ? _self.completeProfileResponse : completeProfileResponse // ignore: cast_nullable_to_non_nullable
as CompleteProfileResponse?,authDataHive: freezed == authDataHive ? _self.authDataHive : authDataHive // ignore: cast_nullable_to_non_nullable
as AuthDataHive?,authAiDataHive: freezed == authAiDataHive ? _self.authAiDataHive : authAiDataHive // ignore: cast_nullable_to_non_nullable
as AuthDataKatanaraHive?,alert: freezed == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as Alert?,
  ));
}

/// Create a copy of AuthState
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
$LoginSsoResponseCopyWith<$Res>? get loginSsoResponse {
    if (_self.loginSsoResponse == null) {
    return null;
  }

  return $LoginSsoResponseCopyWith<$Res>(_self.loginSsoResponse!, (value) {
    return _then(_self.copyWith(loginSsoResponse: value));
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
$VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse {
    if (_self.verifyOtpResponse == null) {
    return null;
  }

  return $VerifyOtpResponseCopyWith<$Res>(_self.verifyOtpResponse!, (value) {
    return _then(_self.copyWith(verifyOtpResponse: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompleteProfileResponseCopyWith<$Res>? get completeProfileResponse {
    if (_self.completeProfileResponse == null) {
    return null;
  }

  return $CompleteProfileResponseCopyWith<$Res>(_self.completeProfileResponse!, (value) {
    return _then(_self.copyWith(completeProfileResponse: value));
  });
}
}

// dart format on
