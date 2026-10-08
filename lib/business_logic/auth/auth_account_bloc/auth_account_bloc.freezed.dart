// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthAccountEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAccountEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthAccountEvent()';
}


}

/// @nodoc
class $AuthAccountEventCopyWith<$Res>  {
$AuthAccountEventCopyWith(AuthAccountEvent _, $Res Function(AuthAccountEvent) __);
}


/// Adds pattern-matching-related methods to [AuthAccountEvent].
extension AuthAccountEventPatterns on AuthAccountEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CheckAuthStatus value)?  checkAuthStatus,TResult Function( _SignedOut value)?  signedOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case _SignedOut() when signedOut != null:
return signedOut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CheckAuthStatus value)  checkAuthStatus,required TResult Function( _SignedOut value)  signedOut,}){
final _that = this;
switch (_that) {
case _CheckAuthStatus():
return checkAuthStatus(_that);case _SignedOut():
return signedOut(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CheckAuthStatus value)?  checkAuthStatus,TResult? Function( _SignedOut value)?  signedOut,}){
final _that = this;
switch (_that) {
case _CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case _SignedOut() when signedOut != null:
return signedOut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuthStatus,TResult Function()?  signedOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case _SignedOut() when signedOut != null:
return signedOut();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuthStatus,required TResult Function()  signedOut,}) {final _that = this;
switch (_that) {
case _CheckAuthStatus():
return checkAuthStatus();case _SignedOut():
return signedOut();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuthStatus,TResult? Function()?  signedOut,}) {final _that = this;
switch (_that) {
case _CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case _SignedOut() when signedOut != null:
return signedOut();case _:
  return null;

}
}

}

/// @nodoc


class _CheckAuthStatus implements AuthAccountEvent {
  const _CheckAuthStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckAuthStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthAccountEvent.checkAuthStatus()';
}


}




/// @nodoc


class _SignedOut implements AuthAccountEvent {
  const _SignedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthAccountEvent.signedOut()';
}


}




/// @nodoc
mixin _$AuthAccountState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthAccountState()';
}


}

/// @nodoc
class $AuthAccountStateCopyWith<$Res>  {
$AuthAccountStateCopyWith(AuthAccountState _, $Res Function(AuthAccountState) __);
}


/// Adds pattern-matching-related methods to [AuthAccountState].
extension AuthAccountStatePatterns on AuthAccountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthAccountLoading value)?  loading,TResult Function( AuthAccountUnauthenticated value)?  unauthenticated,TResult Function( AuthAccountAuthenticatedUser value)?  authenticatedUser,TResult Function( AuthAccountAuthenticatedGuest value)?  authenticatedGuest,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthAccountLoading() when loading != null:
return loading(_that);case AuthAccountUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthAccountAuthenticatedUser() when authenticatedUser != null:
return authenticatedUser(_that);case AuthAccountAuthenticatedGuest() when authenticatedGuest != null:
return authenticatedGuest(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthAccountLoading value)  loading,required TResult Function( AuthAccountUnauthenticated value)  unauthenticated,required TResult Function( AuthAccountAuthenticatedUser value)  authenticatedUser,required TResult Function( AuthAccountAuthenticatedGuest value)  authenticatedGuest,}){
final _that = this;
switch (_that) {
case AuthAccountLoading():
return loading(_that);case AuthAccountUnauthenticated():
return unauthenticated(_that);case AuthAccountAuthenticatedUser():
return authenticatedUser(_that);case AuthAccountAuthenticatedGuest():
return authenticatedGuest(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthAccountLoading value)?  loading,TResult? Function( AuthAccountUnauthenticated value)?  unauthenticated,TResult? Function( AuthAccountAuthenticatedUser value)?  authenticatedUser,TResult? Function( AuthAccountAuthenticatedGuest value)?  authenticatedGuest,}){
final _that = this;
switch (_that) {
case AuthAccountLoading() when loading != null:
return loading(_that);case AuthAccountUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthAccountAuthenticatedUser() when authenticatedUser != null:
return authenticatedUser(_that);case AuthAccountAuthenticatedGuest() when authenticatedGuest != null:
return authenticatedGuest(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  unauthenticated,TResult Function( AuthDataHive authData,  AuthDataKatanaraHive? aiData)?  authenticatedUser,TResult Function( AuthDataHive authData)?  authenticatedGuest,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthAccountLoading() when loading != null:
return loading();case AuthAccountUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthAccountAuthenticatedUser() when authenticatedUser != null:
return authenticatedUser(_that.authData,_that.aiData);case AuthAccountAuthenticatedGuest() when authenticatedGuest != null:
return authenticatedGuest(_that.authData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  unauthenticated,required TResult Function( AuthDataHive authData,  AuthDataKatanaraHive? aiData)  authenticatedUser,required TResult Function( AuthDataHive authData)  authenticatedGuest,}) {final _that = this;
switch (_that) {
case AuthAccountLoading():
return loading();case AuthAccountUnauthenticated():
return unauthenticated();case AuthAccountAuthenticatedUser():
return authenticatedUser(_that.authData,_that.aiData);case AuthAccountAuthenticatedGuest():
return authenticatedGuest(_that.authData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  unauthenticated,TResult? Function( AuthDataHive authData,  AuthDataKatanaraHive? aiData)?  authenticatedUser,TResult? Function( AuthDataHive authData)?  authenticatedGuest,}) {final _that = this;
switch (_that) {
case AuthAccountLoading() when loading != null:
return loading();case AuthAccountUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthAccountAuthenticatedUser() when authenticatedUser != null:
return authenticatedUser(_that.authData,_that.aiData);case AuthAccountAuthenticatedGuest() when authenticatedGuest != null:
return authenticatedGuest(_that.authData);case _:
  return null;

}
}

}

/// @nodoc


class AuthAccountLoading implements AuthAccountState {
  const AuthAccountLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAccountLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthAccountState.loading()';
}


}




/// @nodoc


class AuthAccountUnauthenticated implements AuthAccountState {
  const AuthAccountUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAccountUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthAccountState.unauthenticated()';
}


}




/// @nodoc


class AuthAccountAuthenticatedUser implements AuthAccountState {
  const AuthAccountAuthenticatedUser(this.authData, [this.aiData]);
  

 final  AuthDataHive authData;
 final  AuthDataKatanaraHive? aiData;

/// Create a copy of AuthAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAccountAuthenticatedUserCopyWith<AuthAccountAuthenticatedUser> get copyWith => _$AuthAccountAuthenticatedUserCopyWithImpl<AuthAccountAuthenticatedUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAccountAuthenticatedUser&&(identical(other.authData, authData) || other.authData == authData)&&(identical(other.aiData, aiData) || other.aiData == aiData));
}


@override
int get hashCode => Object.hash(runtimeType,authData,aiData);

@override
String toString() {
  return 'AuthAccountState.authenticatedUser(authData: $authData, aiData: $aiData)';
}


}

/// @nodoc
abstract mixin class $AuthAccountAuthenticatedUserCopyWith<$Res> implements $AuthAccountStateCopyWith<$Res> {
  factory $AuthAccountAuthenticatedUserCopyWith(AuthAccountAuthenticatedUser value, $Res Function(AuthAccountAuthenticatedUser) _then) = _$AuthAccountAuthenticatedUserCopyWithImpl;
@useResult
$Res call({
 AuthDataHive authData, AuthDataKatanaraHive? aiData
});




}
/// @nodoc
class _$AuthAccountAuthenticatedUserCopyWithImpl<$Res>
    implements $AuthAccountAuthenticatedUserCopyWith<$Res> {
  _$AuthAccountAuthenticatedUserCopyWithImpl(this._self, this._then);

  final AuthAccountAuthenticatedUser _self;
  final $Res Function(AuthAccountAuthenticatedUser) _then;

/// Create a copy of AuthAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authData = null,Object? aiData = freezed,}) {
  return _then(AuthAccountAuthenticatedUser(
null == authData ? _self.authData : authData // ignore: cast_nullable_to_non_nullable
as AuthDataHive,freezed == aiData ? _self.aiData : aiData // ignore: cast_nullable_to_non_nullable
as AuthDataKatanaraHive?,
  ));
}


}

/// @nodoc


class AuthAccountAuthenticatedGuest implements AuthAccountState {
  const AuthAccountAuthenticatedGuest(this.authData);
  

 final  AuthDataHive authData;

/// Create a copy of AuthAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAccountAuthenticatedGuestCopyWith<AuthAccountAuthenticatedGuest> get copyWith => _$AuthAccountAuthenticatedGuestCopyWithImpl<AuthAccountAuthenticatedGuest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAccountAuthenticatedGuest&&(identical(other.authData, authData) || other.authData == authData));
}


@override
int get hashCode => Object.hash(runtimeType,authData);

@override
String toString() {
  return 'AuthAccountState.authenticatedGuest(authData: $authData)';
}


}

/// @nodoc
abstract mixin class $AuthAccountAuthenticatedGuestCopyWith<$Res> implements $AuthAccountStateCopyWith<$Res> {
  factory $AuthAccountAuthenticatedGuestCopyWith(AuthAccountAuthenticatedGuest value, $Res Function(AuthAccountAuthenticatedGuest) _then) = _$AuthAccountAuthenticatedGuestCopyWithImpl;
@useResult
$Res call({
 AuthDataHive authData
});




}
/// @nodoc
class _$AuthAccountAuthenticatedGuestCopyWithImpl<$Res>
    implements $AuthAccountAuthenticatedGuestCopyWith<$Res> {
  _$AuthAccountAuthenticatedGuestCopyWithImpl(this._self, this._then);

  final AuthAccountAuthenticatedGuest _self;
  final $Res Function(AuthAccountAuthenticatedGuest) _then;

/// Create a copy of AuthAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authData = null,}) {
  return _then(AuthAccountAuthenticatedGuest(
null == authData ? _self.authData : authData // ignore: cast_nullable_to_non_nullable
as AuthDataHive,
  ));
}


}

// dart format on
