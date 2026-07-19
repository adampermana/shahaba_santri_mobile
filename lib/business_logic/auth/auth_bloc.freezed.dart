// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AuthEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AuthEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$PostloginGuestImplCopyWith<$Res> {
  factory _$$PostloginGuestImplCopyWith(
    _$PostloginGuestImpl value,
    $Res Function(_$PostloginGuestImpl) then,
  ) = __$$PostloginGuestImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostloginGuestImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostloginGuestImpl>
    implements _$$PostloginGuestImplCopyWith<$Res> {
  __$$PostloginGuestImplCopyWithImpl(
    _$PostloginGuestImpl _value,
    $Res Function(_$PostloginGuestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostloginGuestImpl implements _PostloginGuest {
  const _$PostloginGuestImpl();

  @override
  String toString() {
    return 'AuthEvent.postloginGuest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostloginGuestImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postloginGuest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postloginGuest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postloginGuest != null) {
      return postloginGuest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postloginGuest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postloginGuest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postloginGuest != null) {
      return postloginGuest(this);
    }
    return orElse();
  }
}

abstract class _PostloginGuest implements AuthEvent {
  const factory _PostloginGuest() = _$PostloginGuestImpl;
}

/// @nodoc
abstract class _$$PostloginImplCopyWith<$Res> {
  factory _$$PostloginImplCopyWith(
    _$PostloginImpl value,
    $Res Function(_$PostloginImpl) then,
  ) = __$$PostloginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$PostloginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostloginImpl>
    implements _$$PostloginImplCopyWith<$Res> {
  __$$PostloginImplCopyWithImpl(
    _$PostloginImpl _value,
    $Res Function(_$PostloginImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$PostloginImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostloginImpl implements _Postlogin {
  const _$PostloginImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.postloginUser(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostloginImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostloginImplCopyWith<_$PostloginImpl> get copyWith =>
      __$$PostloginImplCopyWithImpl<_$PostloginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postloginUser(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postloginUser?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postloginUser != null) {
      return postloginUser(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postloginUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postloginUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postloginUser != null) {
      return postloginUser(this);
    }
    return orElse();
  }
}

abstract class _Postlogin implements AuthEvent {
  const factory _Postlogin({
    required final String email,
    required final String password,
  }) = _$PostloginImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostloginImplCopyWith<_$PostloginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostSSOImplCopyWith<$Res> {
  factory _$$PostSSOImplCopyWith(
    _$PostSSOImpl value,
    $Res Function(_$PostSSOImpl) then,
  ) = __$$PostSSOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostSSOImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostSSOImpl>
    implements _$$PostSSOImplCopyWith<$Res> {
  __$$PostSSOImplCopyWithImpl(
    _$PostSSOImpl _value,
    $Res Function(_$PostSSOImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostSSOImpl implements _PostSSO {
  const _$PostSSOImpl();

  @override
  String toString() {
    return 'AuthEvent.postSSO()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostSSOImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postSSO();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postSSO?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postSSO != null) {
      return postSSO();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postSSO(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postSSO?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postSSO != null) {
      return postSSO(this);
    }
    return orElse();
  }
}

abstract class _PostSSO implements AuthEvent {
  const factory _PostSSO() = _$PostSSOImpl;
}

/// @nodoc
abstract class _$$PostAppleSSOImplCopyWith<$Res> {
  factory _$$PostAppleSSOImplCopyWith(
    _$PostAppleSSOImpl value,
    $Res Function(_$PostAppleSSOImpl) then,
  ) = __$$PostAppleSSOImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostAppleSSOImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostAppleSSOImpl>
    implements _$$PostAppleSSOImplCopyWith<$Res> {
  __$$PostAppleSSOImplCopyWithImpl(
    _$PostAppleSSOImpl _value,
    $Res Function(_$PostAppleSSOImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PostAppleSSOImpl implements _PostAppleSSO {
  const _$PostAppleSSOImpl();

  @override
  String toString() {
    return 'AuthEvent.postAppleSSO()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostAppleSSOImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postAppleSSO();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postAppleSSO?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postAppleSSO != null) {
      return postAppleSSO();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postAppleSSO(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postAppleSSO?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postAppleSSO != null) {
      return postAppleSSO(this);
    }
    return orElse();
  }
}

abstract class _PostAppleSSO implements AuthEvent {
  const factory _PostAppleSSO() = _$PostAppleSSOImpl;
}

/// @nodoc
abstract class _$$PostRegisterImplCopyWith<$Res> {
  factory _$$PostRegisterImplCopyWith(
    _$PostRegisterImpl value,
    $Res Function(_$PostRegisterImpl) then,
  ) = __$$PostRegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$PostRegisterImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostRegisterImpl>
    implements _$$PostRegisterImplCopyWith<$Res> {
  __$$PostRegisterImplCopyWithImpl(
    _$PostRegisterImpl _value,
    $Res Function(_$PostRegisterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$PostRegisterImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostRegisterImpl implements _PostRegister {
  const _$PostRegisterImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.postRegister(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostRegisterImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostRegisterImplCopyWith<_$PostRegisterImpl> get copyWith =>
      __$$PostRegisterImplCopyWithImpl<_$PostRegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postRegister(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postRegister?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postRegister != null) {
      return postRegister(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postRegister != null) {
      return postRegister(this);
    }
    return orElse();
  }
}

abstract class _PostRegister implements AuthEvent {
  const factory _PostRegister({required final String email}) =
      _$PostRegisterImpl;

  String get email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostRegisterImplCopyWith<_$PostRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostVerifyOtpImplCopyWith<$Res> {
  factory _$$PostVerifyOtpImplCopyWith(
    _$PostVerifyOtpImpl value,
    $Res Function(_$PostVerifyOtpImpl) then,
  ) = __$$PostVerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class __$$PostVerifyOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostVerifyOtpImpl>
    implements _$$PostVerifyOtpImplCopyWith<$Res> {
  __$$PostVerifyOtpImplCopyWithImpl(
    _$PostVerifyOtpImpl _value,
    $Res Function(_$PostVerifyOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? otp = null}) {
    return _then(
      _$PostVerifyOtpImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        otp: null == otp
            ? _value.otp
            : otp // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostVerifyOtpImpl implements _PostVerifyOtp {
  const _$PostVerifyOtpImpl({required this.email, required this.otp});

  @override
  final String email;
  @override
  final String otp;

  @override
  String toString() {
    return 'AuthEvent.postVerifyOtp(email: $email, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostVerifyOtpImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostVerifyOtpImplCopyWith<_$PostVerifyOtpImpl> get copyWith =>
      __$$PostVerifyOtpImplCopyWithImpl<_$PostVerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postVerifyOtp(email, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postVerifyOtp?.call(email, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postVerifyOtp != null) {
      return postVerifyOtp(email, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postVerifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postVerifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postVerifyOtp != null) {
      return postVerifyOtp(this);
    }
    return orElse();
  }
}

abstract class _PostVerifyOtp implements AuthEvent {
  const factory _PostVerifyOtp({
    required final String email,
    required final String otp,
  }) = _$PostVerifyOtpImpl;

  String get email;
  String get otp;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostVerifyOtpImplCopyWith<_$PostVerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostForgotPasswordImplCopyWith<$Res> {
  factory _$$PostForgotPasswordImplCopyWith(
    _$PostForgotPasswordImpl value,
    $Res Function(_$PostForgotPasswordImpl) then,
  ) = __$$PostForgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$PostForgotPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostForgotPasswordImpl>
    implements _$$PostForgotPasswordImplCopyWith<$Res> {
  __$$PostForgotPasswordImplCopyWithImpl(
    _$PostForgotPasswordImpl _value,
    $Res Function(_$PostForgotPasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$PostForgotPasswordImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostForgotPasswordImpl implements _PostForgotPassword {
  const _$PostForgotPasswordImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.postForgotPassword(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostForgotPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostForgotPasswordImplCopyWith<_$PostForgotPasswordImpl> get copyWith =>
      __$$PostForgotPasswordImplCopyWithImpl<_$PostForgotPasswordImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postForgotPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postForgotPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postForgotPassword != null) {
      return postForgotPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postForgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postForgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postForgotPassword != null) {
      return postForgotPassword(this);
    }
    return orElse();
  }
}

abstract class _PostForgotPassword implements AuthEvent {
  const factory _PostForgotPassword({required final String email}) =
      _$PostForgotPasswordImpl;

  String get email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostForgotPasswordImplCopyWith<_$PostForgotPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostCompleteRegisterProfileImplCopyWith<$Res> {
  factory _$$PostCompleteRegisterProfileImplCopyWith(
    _$PostCompleteRegisterProfileImpl value,
    $Res Function(_$PostCompleteRegisterProfileImpl) then,
  ) = __$$PostCompleteRegisterProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String confirmPassword,
    String deviceToken,
    String email,
    String name,
    String newPassword,
    String phoneNumber,
    String platform,
    String verifyToken,
  });
}

/// @nodoc
class __$$PostCompleteRegisterProfileImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostCompleteRegisterProfileImpl>
    implements _$$PostCompleteRegisterProfileImplCopyWith<$Res> {
  __$$PostCompleteRegisterProfileImplCopyWithImpl(
    _$PostCompleteRegisterProfileImpl _value,
    $Res Function(_$PostCompleteRegisterProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmPassword = null,
    Object? deviceToken = null,
    Object? email = null,
    Object? name = null,
    Object? newPassword = null,
    Object? phoneNumber = null,
    Object? platform = null,
    Object? verifyToken = null,
  }) {
    return _then(
      _$PostCompleteRegisterProfileImpl(
        confirmPassword: null == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceToken: null == deviceToken
            ? _value.deviceToken
            : deviceToken // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _value.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
        verifyToken: null == verifyToken
            ? _value.verifyToken
            : verifyToken // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostCompleteRegisterProfileImpl
    implements _PostCompleteRegisterProfile {
  const _$PostCompleteRegisterProfileImpl({
    required this.confirmPassword,
    required this.deviceToken,
    required this.email,
    required this.name,
    required this.newPassword,
    required this.phoneNumber,
    required this.platform,
    required this.verifyToken,
  });

  @override
  final String confirmPassword;
  @override
  final String deviceToken;
  @override
  final String email;
  @override
  final String name;
  @override
  final String newPassword;
  @override
  final String phoneNumber;
  @override
  final String platform;
  @override
  final String verifyToken;

  @override
  String toString() {
    return 'AuthEvent.postCompleteRegisterProfile(confirmPassword: $confirmPassword, deviceToken: $deviceToken, email: $email, name: $name, newPassword: $newPassword, phoneNumber: $phoneNumber, platform: $platform, verifyToken: $verifyToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCompleteRegisterProfileImpl &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.verifyToken, verifyToken) ||
                other.verifyToken == verifyToken));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    confirmPassword,
    deviceToken,
    email,
    name,
    newPassword,
    phoneNumber,
    platform,
    verifyToken,
  );

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCompleteRegisterProfileImplCopyWith<_$PostCompleteRegisterProfileImpl>
  get copyWith =>
      __$$PostCompleteRegisterProfileImplCopyWithImpl<
        _$PostCompleteRegisterProfileImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postCompleteRegisterProfile(
      confirmPassword,
      deviceToken,
      email,
      name,
      newPassword,
      phoneNumber,
      platform,
      verifyToken,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postCompleteRegisterProfile?.call(
      confirmPassword,
      deviceToken,
      email,
      name,
      newPassword,
      phoneNumber,
      platform,
      verifyToken,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postCompleteRegisterProfile != null) {
      return postCompleteRegisterProfile(
        confirmPassword,
        deviceToken,
        email,
        name,
        newPassword,
        phoneNumber,
        platform,
        verifyToken,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postCompleteRegisterProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postCompleteRegisterProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postCompleteRegisterProfile != null) {
      return postCompleteRegisterProfile(this);
    }
    return orElse();
  }
}

abstract class _PostCompleteRegisterProfile implements AuthEvent {
  const factory _PostCompleteRegisterProfile({
    required final String confirmPassword,
    required final String deviceToken,
    required final String email,
    required final String name,
    required final String newPassword,
    required final String phoneNumber,
    required final String platform,
    required final String verifyToken,
  }) = _$PostCompleteRegisterProfileImpl;

  String get confirmPassword;
  String get deviceToken;
  String get email;
  String get name;
  String get newPassword;
  String get phoneNumber;
  String get platform;
  String get verifyToken;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostCompleteRegisterProfileImplCopyWith<_$PostCompleteRegisterProfileImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostCompleteSsoProfileImplCopyWith<$Res> {
  factory _$$PostCompleteSsoProfileImplCopyWith(
    _$PostCompleteSsoProfileImpl value,
    $Res Function(_$PostCompleteSsoProfileImpl) then,
  ) = __$$PostCompleteSsoProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String phoneNumber});
}

/// @nodoc
class __$$PostCompleteSsoProfileImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostCompleteSsoProfileImpl>
    implements _$$PostCompleteSsoProfileImplCopyWith<$Res> {
  __$$PostCompleteSsoProfileImplCopyWithImpl(
    _$PostCompleteSsoProfileImpl _value,
    $Res Function(_$PostCompleteSsoProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? phoneNumber = null}) {
    return _then(
      _$PostCompleteSsoProfileImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostCompleteSsoProfileImpl implements _PostCompleteSsoProfile {
  const _$PostCompleteSsoProfileImpl({
    required this.name,
    required this.phoneNumber,
  });

  @override
  final String name;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.postCompleteSsoProfile(name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCompleteSsoProfileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCompleteSsoProfileImplCopyWith<_$PostCompleteSsoProfileImpl>
  get copyWith =>
      __$$PostCompleteSsoProfileImplCopyWithImpl<_$PostCompleteSsoProfileImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postCompleteSsoProfile(name, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postCompleteSsoProfile?.call(name, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postCompleteSsoProfile != null) {
      return postCompleteSsoProfile(name, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postCompleteSsoProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postCompleteSsoProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postCompleteSsoProfile != null) {
      return postCompleteSsoProfile(this);
    }
    return orElse();
  }
}

abstract class _PostCompleteSsoProfile implements AuthEvent {
  const factory _PostCompleteSsoProfile({
    required final String name,
    required final String phoneNumber,
  }) = _$PostCompleteSsoProfileImpl;

  String get name;
  String get phoneNumber;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostCompleteSsoProfileImplCopyWith<_$PostCompleteSsoProfileImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostCompleteAppleSsoProfileImplCopyWith<$Res> {
  factory _$$PostCompleteAppleSsoProfileImplCopyWith(
    _$PostCompleteAppleSsoProfileImpl value,
    $Res Function(_$PostCompleteAppleSsoProfileImpl) then,
  ) = __$$PostCompleteAppleSsoProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String phoneNumber});
}

/// @nodoc
class __$$PostCompleteAppleSsoProfileImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostCompleteAppleSsoProfileImpl>
    implements _$$PostCompleteAppleSsoProfileImplCopyWith<$Res> {
  __$$PostCompleteAppleSsoProfileImplCopyWithImpl(
    _$PostCompleteAppleSsoProfileImpl _value,
    $Res Function(_$PostCompleteAppleSsoProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? phoneNumber = null}) {
    return _then(
      _$PostCompleteAppleSsoProfileImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostCompleteAppleSsoProfileImpl
    implements _PostCompleteAppleSsoProfile {
  const _$PostCompleteAppleSsoProfileImpl({
    required this.name,
    required this.phoneNumber,
  });

  @override
  final String name;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.postCompleteAppleSsoProfile(name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCompleteAppleSsoProfileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCompleteAppleSsoProfileImplCopyWith<_$PostCompleteAppleSsoProfileImpl>
  get copyWith =>
      __$$PostCompleteAppleSsoProfileImplCopyWithImpl<
        _$PostCompleteAppleSsoProfileImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postCompleteAppleSsoProfile(name, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postCompleteAppleSsoProfile?.call(name, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postCompleteAppleSsoProfile != null) {
      return postCompleteAppleSsoProfile(name, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postCompleteAppleSsoProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postCompleteAppleSsoProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postCompleteAppleSsoProfile != null) {
      return postCompleteAppleSsoProfile(this);
    }
    return orElse();
  }
}

abstract class _PostCompleteAppleSsoProfile implements AuthEvent {
  const factory _PostCompleteAppleSsoProfile({
    required final String name,
    required final String phoneNumber,
  }) = _$PostCompleteAppleSsoProfileImpl;

  String get name;
  String get phoneNumber;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostCompleteAppleSsoProfileImplCopyWith<_$PostCompleteAppleSsoProfileImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostRestoreAccountImplCopyWith<$Res> {
  factory _$$PostRestoreAccountImplCopyWith(
    _$PostRestoreAccountImpl value,
    $Res Function(_$PostRestoreAccountImpl) then,
  ) = __$$PostRestoreAccountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String jwt});
}

/// @nodoc
class __$$PostRestoreAccountImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PostRestoreAccountImpl>
    implements _$$PostRestoreAccountImplCopyWith<$Res> {
  __$$PostRestoreAccountImplCopyWithImpl(
    _$PostRestoreAccountImpl _value,
    $Res Function(_$PostRestoreAccountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? jwt = null}) {
    return _then(
      _$PostRestoreAccountImpl(
        jwt: null == jwt
            ? _value.jwt
            : jwt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PostRestoreAccountImpl implements _PostRestoreAccount {
  const _$PostRestoreAccountImpl({required this.jwt});

  @override
  final String jwt;

  @override
  String toString() {
    return 'AuthEvent.postRestoreAccount(jwt: $jwt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostRestoreAccountImpl &&
            (identical(other.jwt, jwt) || other.jwt == jwt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jwt);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostRestoreAccountImplCopyWith<_$PostRestoreAccountImpl> get copyWith =>
      __$$PostRestoreAccountImplCopyWithImpl<_$PostRestoreAccountImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() postloginGuest,
    required TResult Function(String email, String password) postloginUser,
    required TResult Function() postSSO,
    required TResult Function() postAppleSSO,
    required TResult Function(String email) postRegister,
    required TResult Function(String email, String otp) postVerifyOtp,
    required TResult Function(String email) postForgotPassword,
    required TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )
    postCompleteRegisterProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteSsoProfile,
    required TResult Function(String name, String phoneNumber)
    postCompleteAppleSsoProfile,
    required TResult Function(String jwt) postRestoreAccount,
  }) {
    return postRestoreAccount(jwt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? postloginGuest,
    TResult? Function(String email, String password)? postloginUser,
    TResult? Function()? postSSO,
    TResult? Function()? postAppleSSO,
    TResult? Function(String email)? postRegister,
    TResult? Function(String email, String otp)? postVerifyOtp,
    TResult? Function(String email)? postForgotPassword,
    TResult? Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult? Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult? Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult? Function(String jwt)? postRestoreAccount,
  }) {
    return postRestoreAccount?.call(jwt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? postloginGuest,
    TResult Function(String email, String password)? postloginUser,
    TResult Function()? postSSO,
    TResult Function()? postAppleSSO,
    TResult Function(String email)? postRegister,
    TResult Function(String email, String otp)? postVerifyOtp,
    TResult Function(String email)? postForgotPassword,
    TResult Function(
      String confirmPassword,
      String deviceToken,
      String email,
      String name,
      String newPassword,
      String phoneNumber,
      String platform,
      String verifyToken,
    )?
    postCompleteRegisterProfile,
    TResult Function(String name, String phoneNumber)? postCompleteSsoProfile,
    TResult Function(String name, String phoneNumber)?
    postCompleteAppleSsoProfile,
    TResult Function(String jwt)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postRestoreAccount != null) {
      return postRestoreAccount(jwt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PostloginGuest value) postloginGuest,
    required TResult Function(_Postlogin value) postloginUser,
    required TResult Function(_PostSSO value) postSSO,
    required TResult Function(_PostAppleSSO value) postAppleSSO,
    required TResult Function(_PostRegister value) postRegister,
    required TResult Function(_PostVerifyOtp value) postVerifyOtp,
    required TResult Function(_PostForgotPassword value) postForgotPassword,
    required TResult Function(_PostCompleteRegisterProfile value)
    postCompleteRegisterProfile,
    required TResult Function(_PostCompleteSsoProfile value)
    postCompleteSsoProfile,
    required TResult Function(_PostCompleteAppleSsoProfile value)
    postCompleteAppleSsoProfile,
    required TResult Function(_PostRestoreAccount value) postRestoreAccount,
  }) {
    return postRestoreAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PostloginGuest value)? postloginGuest,
    TResult? Function(_Postlogin value)? postloginUser,
    TResult? Function(_PostSSO value)? postSSO,
    TResult? Function(_PostAppleSSO value)? postAppleSSO,
    TResult? Function(_PostRegister value)? postRegister,
    TResult? Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult? Function(_PostForgotPassword value)? postForgotPassword,
    TResult? Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult? Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult? Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult? Function(_PostRestoreAccount value)? postRestoreAccount,
  }) {
    return postRestoreAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PostloginGuest value)? postloginGuest,
    TResult Function(_Postlogin value)? postloginUser,
    TResult Function(_PostSSO value)? postSSO,
    TResult Function(_PostAppleSSO value)? postAppleSSO,
    TResult Function(_PostRegister value)? postRegister,
    TResult Function(_PostVerifyOtp value)? postVerifyOtp,
    TResult Function(_PostForgotPassword value)? postForgotPassword,
    TResult Function(_PostCompleteRegisterProfile value)?
    postCompleteRegisterProfile,
    TResult Function(_PostCompleteSsoProfile value)? postCompleteSsoProfile,
    TResult Function(_PostCompleteAppleSsoProfile value)?
    postCompleteAppleSsoProfile,
    TResult Function(_PostRestoreAccount value)? postRestoreAccount,
    required TResult orElse(),
  }) {
    if (postRestoreAccount != null) {
      return postRestoreAccount(this);
    }
    return orElse();
  }
}

abstract class _PostRestoreAccount implements AuthEvent {
  const factory _PostRestoreAccount({required final String jwt}) =
      _$PostRestoreAccountImpl;

  String get jwt;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostRestoreAccountImplCopyWith<_$PostRestoreAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get messageVerifyOtp => throw _privateConstructorUsedError;
  String? get messageTitle => throw _privateConstructorUsedError;
  String? get messageTitleVerifyOtp => throw _privateConstructorUsedError;
  String? get statusCode => throw _privateConstructorUsedError;
  int? get statusCodeVerifyOtp => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get loadingUser => throw _privateConstructorUsedError;
  bool get loadingGuest => throw _privateConstructorUsedError;
  bool get loadingSSO => throw _privateConstructorUsedError;
  bool get loadingVerifyOtp => throw _privateConstructorUsedError;
  bool get loadingRestoreAccount => throw _privateConstructorUsedError;
  bool get successLoginUser => throw _privateConstructorUsedError;
  bool get successLoginGuest => throw _privateConstructorUsedError;
  bool get successRegister => throw _privateConstructorUsedError;
  bool get successVerifyOtp => throw _privateConstructorUsedError;
  bool get successCompleteProfile => throw _privateConstructorUsedError;
  bool get successGoogleAuth => throw _privateConstructorUsedError;
  bool get successRestoreAccount => throw _privateConstructorUsedError;
  bool get needsCompletion => throw _privateConstructorUsedError;
  String? get tempToken => throw _privateConstructorUsedError;
  String? get googleName => throw _privateConstructorUsedError;
  String? get googleEmail => throw _privateConstructorUsedError;
  String? get verifyToken => throw _privateConstructorUsedError;
  String? get pendingEmail => throw _privateConstructorUsedError;
  int? get resendIn => throw _privateConstructorUsedError;
  LoginResponse? get loginResponse => throw _privateConstructorUsedError;
  LoginSsoResponse? get loginSsoResponse => throw _privateConstructorUsedError;
  RegisterResponse? get registerResponse => throw _privateConstructorUsedError;
  VerifyOtpResponse? get verifyOtpResponse =>
      throw _privateConstructorUsedError;
  CompleteProfileResponse? get completeProfileResponse =>
      throw _privateConstructorUsedError;
  Alert? get alert => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({
    String email,
    String password,
    String? message,
    String? messageVerifyOtp,
    String? messageTitle,
    String? messageTitleVerifyOtp,
    String? statusCode,
    int? statusCodeVerifyOtp,
    bool loading,
    bool loadingUser,
    bool loadingGuest,
    bool loadingSSO,
    bool loadingVerifyOtp,
    bool loadingRestoreAccount,
    bool successLoginUser,
    bool successLoginGuest,
    bool successRegister,
    bool successVerifyOtp,
    bool successCompleteProfile,
    bool successGoogleAuth,
    bool successRestoreAccount,
    bool needsCompletion,
    String? tempToken,
    String? googleName,
    String? googleEmail,
    String? verifyToken,
    String? pendingEmail,
    int? resendIn,
    LoginResponse? loginResponse,
    LoginSsoResponse? loginSsoResponse,
    RegisterResponse? registerResponse,
    VerifyOtpResponse? verifyOtpResponse,
    CompleteProfileResponse? completeProfileResponse,
    Alert? alert,
  });

  $LoginResponseCopyWith<$Res>? get loginResponse;
  $LoginSsoResponseCopyWith<$Res>? get loginSsoResponse;
  $RegisterResponseCopyWith<$Res>? get registerResponse;
  $VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse;
  $CompleteProfileResponseCopyWith<$Res>? get completeProfileResponse;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? message = freezed,
    Object? messageVerifyOtp = freezed,
    Object? messageTitle = freezed,
    Object? messageTitleVerifyOtp = freezed,
    Object? statusCode = freezed,
    Object? statusCodeVerifyOtp = freezed,
    Object? loading = null,
    Object? loadingUser = null,
    Object? loadingGuest = null,
    Object? loadingSSO = null,
    Object? loadingVerifyOtp = null,
    Object? loadingRestoreAccount = null,
    Object? successLoginUser = null,
    Object? successLoginGuest = null,
    Object? successRegister = null,
    Object? successVerifyOtp = null,
    Object? successCompleteProfile = null,
    Object? successGoogleAuth = null,
    Object? successRestoreAccount = null,
    Object? needsCompletion = null,
    Object? tempToken = freezed,
    Object? googleName = freezed,
    Object? googleEmail = freezed,
    Object? verifyToken = freezed,
    Object? pendingEmail = freezed,
    Object? resendIn = freezed,
    Object? loginResponse = freezed,
    Object? loginSsoResponse = freezed,
    Object? registerResponse = freezed,
    Object? verifyOtpResponse = freezed,
    Object? completeProfileResponse = freezed,
    Object? alert = freezed,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageVerifyOtp: freezed == messageVerifyOtp
                ? _value.messageVerifyOtp
                : messageVerifyOtp // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageTitle: freezed == messageTitle
                ? _value.messageTitle
                : messageTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageTitleVerifyOtp: freezed == messageTitleVerifyOtp
                ? _value.messageTitleVerifyOtp
                : messageTitleVerifyOtp // ignore: cast_nullable_to_non_nullable
                      as String?,
            statusCode: freezed == statusCode
                ? _value.statusCode
                : statusCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            statusCodeVerifyOtp: freezed == statusCodeVerifyOtp
                ? _value.statusCodeVerifyOtp
                : statusCodeVerifyOtp // ignore: cast_nullable_to_non_nullable
                      as int?,
            loading: null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                      as bool,
            loadingUser: null == loadingUser
                ? _value.loadingUser
                : loadingUser // ignore: cast_nullable_to_non_nullable
                      as bool,
            loadingGuest: null == loadingGuest
                ? _value.loadingGuest
                : loadingGuest // ignore: cast_nullable_to_non_nullable
                      as bool,
            loadingSSO: null == loadingSSO
                ? _value.loadingSSO
                : loadingSSO // ignore: cast_nullable_to_non_nullable
                      as bool,
            loadingVerifyOtp: null == loadingVerifyOtp
                ? _value.loadingVerifyOtp
                : loadingVerifyOtp // ignore: cast_nullable_to_non_nullable
                      as bool,
            loadingRestoreAccount: null == loadingRestoreAccount
                ? _value.loadingRestoreAccount
                : loadingRestoreAccount // ignore: cast_nullable_to_non_nullable
                      as bool,
            successLoginUser: null == successLoginUser
                ? _value.successLoginUser
                : successLoginUser // ignore: cast_nullable_to_non_nullable
                      as bool,
            successLoginGuest: null == successLoginGuest
                ? _value.successLoginGuest
                : successLoginGuest // ignore: cast_nullable_to_non_nullable
                      as bool,
            successRegister: null == successRegister
                ? _value.successRegister
                : successRegister // ignore: cast_nullable_to_non_nullable
                      as bool,
            successVerifyOtp: null == successVerifyOtp
                ? _value.successVerifyOtp
                : successVerifyOtp // ignore: cast_nullable_to_non_nullable
                      as bool,
            successCompleteProfile: null == successCompleteProfile
                ? _value.successCompleteProfile
                : successCompleteProfile // ignore: cast_nullable_to_non_nullable
                      as bool,
            successGoogleAuth: null == successGoogleAuth
                ? _value.successGoogleAuth
                : successGoogleAuth // ignore: cast_nullable_to_non_nullable
                      as bool,
            successRestoreAccount: null == successRestoreAccount
                ? _value.successRestoreAccount
                : successRestoreAccount // ignore: cast_nullable_to_non_nullable
                      as bool,
            needsCompletion: null == needsCompletion
                ? _value.needsCompletion
                : needsCompletion // ignore: cast_nullable_to_non_nullable
                      as bool,
            tempToken: freezed == tempToken
                ? _value.tempToken
                : tempToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            googleName: freezed == googleName
                ? _value.googleName
                : googleName // ignore: cast_nullable_to_non_nullable
                      as String?,
            googleEmail: freezed == googleEmail
                ? _value.googleEmail
                : googleEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            verifyToken: freezed == verifyToken
                ? _value.verifyToken
                : verifyToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            pendingEmail: freezed == pendingEmail
                ? _value.pendingEmail
                : pendingEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            resendIn: freezed == resendIn
                ? _value.resendIn
                : resendIn // ignore: cast_nullable_to_non_nullable
                      as int?,
            loginResponse: freezed == loginResponse
                ? _value.loginResponse
                : loginResponse // ignore: cast_nullable_to_non_nullable
                      as LoginResponse?,
            loginSsoResponse: freezed == loginSsoResponse
                ? _value.loginSsoResponse
                : loginSsoResponse // ignore: cast_nullable_to_non_nullable
                      as LoginSsoResponse?,
            registerResponse: freezed == registerResponse
                ? _value.registerResponse
                : registerResponse // ignore: cast_nullable_to_non_nullable
                      as RegisterResponse?,
            verifyOtpResponse: freezed == verifyOtpResponse
                ? _value.verifyOtpResponse
                : verifyOtpResponse // ignore: cast_nullable_to_non_nullable
                      as VerifyOtpResponse?,
            completeProfileResponse: freezed == completeProfileResponse
                ? _value.completeProfileResponse
                : completeProfileResponse // ignore: cast_nullable_to_non_nullable
                      as CompleteProfileResponse?,
            alert: freezed == alert
                ? _value.alert
                : alert // ignore: cast_nullable_to_non_nullable
                      as Alert?,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginResponseCopyWith<$Res>? get loginResponse {
    if (_value.loginResponse == null) {
      return null;
    }

    return $LoginResponseCopyWith<$Res>(_value.loginResponse!, (value) {
      return _then(_value.copyWith(loginResponse: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginSsoResponseCopyWith<$Res>? get loginSsoResponse {
    if (_value.loginSsoResponse == null) {
      return null;
    }

    return $LoginSsoResponseCopyWith<$Res>(_value.loginSsoResponse!, (value) {
      return _then(_value.copyWith(loginSsoResponse: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegisterResponseCopyWith<$Res>? get registerResponse {
    if (_value.registerResponse == null) {
      return null;
    }

    return $RegisterResponseCopyWith<$Res>(_value.registerResponse!, (value) {
      return _then(_value.copyWith(registerResponse: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse {
    if (_value.verifyOtpResponse == null) {
      return null;
    }

    return $VerifyOtpResponseCopyWith<$Res>(_value.verifyOtpResponse!, (value) {
      return _then(_value.copyWith(verifyOtpResponse: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompleteProfileResponseCopyWith<$Res>? get completeProfileResponse {
    if (_value.completeProfileResponse == null) {
      return null;
    }

    return $CompleteProfileResponseCopyWith<$Res>(
      _value.completeProfileResponse!,
      (value) {
        return _then(_value.copyWith(completeProfileResponse: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String password,
    String? message,
    String? messageVerifyOtp,
    String? messageTitle,
    String? messageTitleVerifyOtp,
    String? statusCode,
    int? statusCodeVerifyOtp,
    bool loading,
    bool loadingUser,
    bool loadingGuest,
    bool loadingSSO,
    bool loadingVerifyOtp,
    bool loadingRestoreAccount,
    bool successLoginUser,
    bool successLoginGuest,
    bool successRegister,
    bool successVerifyOtp,
    bool successCompleteProfile,
    bool successGoogleAuth,
    bool successRestoreAccount,
    bool needsCompletion,
    String? tempToken,
    String? googleName,
    String? googleEmail,
    String? verifyToken,
    String? pendingEmail,
    int? resendIn,
    LoginResponse? loginResponse,
    LoginSsoResponse? loginSsoResponse,
    RegisterResponse? registerResponse,
    VerifyOtpResponse? verifyOtpResponse,
    CompleteProfileResponse? completeProfileResponse,
    Alert? alert,
  });

  @override
  $LoginResponseCopyWith<$Res>? get loginResponse;
  @override
  $LoginSsoResponseCopyWith<$Res>? get loginSsoResponse;
  @override
  $RegisterResponseCopyWith<$Res>? get registerResponse;
  @override
  $VerifyOtpResponseCopyWith<$Res>? get verifyOtpResponse;
  @override
  $CompleteProfileResponseCopyWith<$Res>? get completeProfileResponse;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? message = freezed,
    Object? messageVerifyOtp = freezed,
    Object? messageTitle = freezed,
    Object? messageTitleVerifyOtp = freezed,
    Object? statusCode = freezed,
    Object? statusCodeVerifyOtp = freezed,
    Object? loading = null,
    Object? loadingUser = null,
    Object? loadingGuest = null,
    Object? loadingSSO = null,
    Object? loadingVerifyOtp = null,
    Object? loadingRestoreAccount = null,
    Object? successLoginUser = null,
    Object? successLoginGuest = null,
    Object? successRegister = null,
    Object? successVerifyOtp = null,
    Object? successCompleteProfile = null,
    Object? successGoogleAuth = null,
    Object? successRestoreAccount = null,
    Object? needsCompletion = null,
    Object? tempToken = freezed,
    Object? googleName = freezed,
    Object? googleEmail = freezed,
    Object? verifyToken = freezed,
    Object? pendingEmail = freezed,
    Object? resendIn = freezed,
    Object? loginResponse = freezed,
    Object? loginSsoResponse = freezed,
    Object? registerResponse = freezed,
    Object? verifyOtpResponse = freezed,
    Object? completeProfileResponse = freezed,
    Object? alert = freezed,
  }) {
    return _then(
      _$InitialImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageVerifyOtp: freezed == messageVerifyOtp
            ? _value.messageVerifyOtp
            : messageVerifyOtp // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageTitle: freezed == messageTitle
            ? _value.messageTitle
            : messageTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageTitleVerifyOtp: freezed == messageTitleVerifyOtp
            ? _value.messageTitleVerifyOtp
            : messageTitleVerifyOtp // ignore: cast_nullable_to_non_nullable
                  as String?,
        statusCode: freezed == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        statusCodeVerifyOtp: freezed == statusCodeVerifyOtp
            ? _value.statusCodeVerifyOtp
            : statusCodeVerifyOtp // ignore: cast_nullable_to_non_nullable
                  as int?,
        loading: null == loading
            ? _value.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        loadingUser: null == loadingUser
            ? _value.loadingUser
            : loadingUser // ignore: cast_nullable_to_non_nullable
                  as bool,
        loadingGuest: null == loadingGuest
            ? _value.loadingGuest
            : loadingGuest // ignore: cast_nullable_to_non_nullable
                  as bool,
        loadingSSO: null == loadingSSO
            ? _value.loadingSSO
            : loadingSSO // ignore: cast_nullable_to_non_nullable
                  as bool,
        loadingVerifyOtp: null == loadingVerifyOtp
            ? _value.loadingVerifyOtp
            : loadingVerifyOtp // ignore: cast_nullable_to_non_nullable
                  as bool,
        loadingRestoreAccount: null == loadingRestoreAccount
            ? _value.loadingRestoreAccount
            : loadingRestoreAccount // ignore: cast_nullable_to_non_nullable
                  as bool,
        successLoginUser: null == successLoginUser
            ? _value.successLoginUser
            : successLoginUser // ignore: cast_nullable_to_non_nullable
                  as bool,
        successLoginGuest: null == successLoginGuest
            ? _value.successLoginGuest
            : successLoginGuest // ignore: cast_nullable_to_non_nullable
                  as bool,
        successRegister: null == successRegister
            ? _value.successRegister
            : successRegister // ignore: cast_nullable_to_non_nullable
                  as bool,
        successVerifyOtp: null == successVerifyOtp
            ? _value.successVerifyOtp
            : successVerifyOtp // ignore: cast_nullable_to_non_nullable
                  as bool,
        successCompleteProfile: null == successCompleteProfile
            ? _value.successCompleteProfile
            : successCompleteProfile // ignore: cast_nullable_to_non_nullable
                  as bool,
        successGoogleAuth: null == successGoogleAuth
            ? _value.successGoogleAuth
            : successGoogleAuth // ignore: cast_nullable_to_non_nullable
                  as bool,
        successRestoreAccount: null == successRestoreAccount
            ? _value.successRestoreAccount
            : successRestoreAccount // ignore: cast_nullable_to_non_nullable
                  as bool,
        needsCompletion: null == needsCompletion
            ? _value.needsCompletion
            : needsCompletion // ignore: cast_nullable_to_non_nullable
                  as bool,
        tempToken: freezed == tempToken
            ? _value.tempToken
            : tempToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        googleName: freezed == googleName
            ? _value.googleName
            : googleName // ignore: cast_nullable_to_non_nullable
                  as String?,
        googleEmail: freezed == googleEmail
            ? _value.googleEmail
            : googleEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifyToken: freezed == verifyToken
            ? _value.verifyToken
            : verifyToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingEmail: freezed == pendingEmail
            ? _value.pendingEmail
            : pendingEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        resendIn: freezed == resendIn
            ? _value.resendIn
            : resendIn // ignore: cast_nullable_to_non_nullable
                  as int?,
        loginResponse: freezed == loginResponse
            ? _value.loginResponse
            : loginResponse // ignore: cast_nullable_to_non_nullable
                  as LoginResponse?,
        loginSsoResponse: freezed == loginSsoResponse
            ? _value.loginSsoResponse
            : loginSsoResponse // ignore: cast_nullable_to_non_nullable
                  as LoginSsoResponse?,
        registerResponse: freezed == registerResponse
            ? _value.registerResponse
            : registerResponse // ignore: cast_nullable_to_non_nullable
                  as RegisterResponse?,
        verifyOtpResponse: freezed == verifyOtpResponse
            ? _value.verifyOtpResponse
            : verifyOtpResponse // ignore: cast_nullable_to_non_nullable
                  as VerifyOtpResponse?,
        completeProfileResponse: freezed == completeProfileResponse
            ? _value.completeProfileResponse
            : completeProfileResponse // ignore: cast_nullable_to_non_nullable
                  as CompleteProfileResponse?,
        alert: freezed == alert
            ? _value.alert
            : alert // ignore: cast_nullable_to_non_nullable
                  as Alert?,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({
    required this.email,
    required this.password,
    required this.message,
    required this.messageVerifyOtp,
    required this.messageTitle,
    required this.messageTitleVerifyOtp,
    required this.statusCode,
    required this.statusCodeVerifyOtp,
    required this.loading,
    required this.loadingUser,
    required this.loadingGuest,
    required this.loadingSSO,
    required this.loadingVerifyOtp,
    required this.loadingRestoreAccount,
    required this.successLoginUser,
    required this.successLoginGuest,
    required this.successRegister,
    required this.successVerifyOtp,
    required this.successCompleteProfile,
    required this.successGoogleAuth,
    required this.successRestoreAccount,
    required this.needsCompletion,
    required this.tempToken,
    required this.googleName,
    required this.googleEmail,
    required this.verifyToken,
    required this.pendingEmail,
    required this.resendIn,
    required this.loginResponse,
    required this.loginSsoResponse,
    required this.registerResponse,
    required this.verifyOtpResponse,
    required this.completeProfileResponse,
    required this.alert,
  });

  @override
  final String email;
  @override
  final String password;
  @override
  final String? message;
  @override
  final String? messageVerifyOtp;
  @override
  final String? messageTitle;
  @override
  final String? messageTitleVerifyOtp;
  @override
  final String? statusCode;
  @override
  final int? statusCodeVerifyOtp;
  @override
  final bool loading;
  @override
  final bool loadingUser;
  @override
  final bool loadingGuest;
  @override
  final bool loadingSSO;
  @override
  final bool loadingVerifyOtp;
  @override
  final bool loadingRestoreAccount;
  @override
  final bool successLoginUser;
  @override
  final bool successLoginGuest;
  @override
  final bool successRegister;
  @override
  final bool successVerifyOtp;
  @override
  final bool successCompleteProfile;
  @override
  final bool successGoogleAuth;
  @override
  final bool successRestoreAccount;
  @override
  final bool needsCompletion;
  @override
  final String? tempToken;
  @override
  final String? googleName;
  @override
  final String? googleEmail;
  @override
  final String? verifyToken;
  @override
  final String? pendingEmail;
  @override
  final int? resendIn;
  @override
  final LoginResponse? loginResponse;
  @override
  final LoginSsoResponse? loginSsoResponse;
  @override
  final RegisterResponse? registerResponse;
  @override
  final VerifyOtpResponse? verifyOtpResponse;
  @override
  final CompleteProfileResponse? completeProfileResponse;
  @override
  final Alert? alert;

  @override
  String toString() {
    return 'AuthState(email: $email, password: $password, message: $message, messageVerifyOtp: $messageVerifyOtp, messageTitle: $messageTitle, messageTitleVerifyOtp: $messageTitleVerifyOtp, statusCode: $statusCode, statusCodeVerifyOtp: $statusCodeVerifyOtp, loading: $loading, loadingUser: $loadingUser, loadingGuest: $loadingGuest, loadingSSO: $loadingSSO, loadingVerifyOtp: $loadingVerifyOtp, loadingRestoreAccount: $loadingRestoreAccount, successLoginUser: $successLoginUser, successLoginGuest: $successLoginGuest, successRegister: $successRegister, successVerifyOtp: $successVerifyOtp, successCompleteProfile: $successCompleteProfile, successGoogleAuth: $successGoogleAuth, successRestoreAccount: $successRestoreAccount, needsCompletion: $needsCompletion, tempToken: $tempToken, googleName: $googleName, googleEmail: $googleEmail, verifyToken: $verifyToken, pendingEmail: $pendingEmail, resendIn: $resendIn, loginResponse: $loginResponse, loginSsoResponse: $loginSsoResponse, registerResponse: $registerResponse, verifyOtpResponse: $verifyOtpResponse, completeProfileResponse: $completeProfileResponse, alert: $alert)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageVerifyOtp, messageVerifyOtp) ||
                other.messageVerifyOtp == messageVerifyOtp) &&
            (identical(other.messageTitle, messageTitle) ||
                other.messageTitle == messageTitle) &&
            (identical(other.messageTitleVerifyOtp, messageTitleVerifyOtp) ||
                other.messageTitleVerifyOtp == messageTitleVerifyOtp) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusCodeVerifyOtp, statusCodeVerifyOtp) ||
                other.statusCodeVerifyOtp == statusCodeVerifyOtp) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.loadingUser, loadingUser) ||
                other.loadingUser == loadingUser) &&
            (identical(other.loadingGuest, loadingGuest) ||
                other.loadingGuest == loadingGuest) &&
            (identical(other.loadingSSO, loadingSSO) ||
                other.loadingSSO == loadingSSO) &&
            (identical(other.loadingVerifyOtp, loadingVerifyOtp) ||
                other.loadingVerifyOtp == loadingVerifyOtp) &&
            (identical(other.loadingRestoreAccount, loadingRestoreAccount) ||
                other.loadingRestoreAccount == loadingRestoreAccount) &&
            (identical(other.successLoginUser, successLoginUser) ||
                other.successLoginUser == successLoginUser) &&
            (identical(other.successLoginGuest, successLoginGuest) ||
                other.successLoginGuest == successLoginGuest) &&
            (identical(other.successRegister, successRegister) ||
                other.successRegister == successRegister) &&
            (identical(other.successVerifyOtp, successVerifyOtp) ||
                other.successVerifyOtp == successVerifyOtp) &&
            (identical(other.successCompleteProfile, successCompleteProfile) ||
                other.successCompleteProfile == successCompleteProfile) &&
            (identical(other.successGoogleAuth, successGoogleAuth) ||
                other.successGoogleAuth == successGoogleAuth) &&
            (identical(other.successRestoreAccount, successRestoreAccount) ||
                other.successRestoreAccount == successRestoreAccount) &&
            (identical(other.needsCompletion, needsCompletion) ||
                other.needsCompletion == needsCompletion) &&
            (identical(other.tempToken, tempToken) ||
                other.tempToken == tempToken) &&
            (identical(other.googleName, googleName) ||
                other.googleName == googleName) &&
            (identical(other.googleEmail, googleEmail) ||
                other.googleEmail == googleEmail) &&
            (identical(other.verifyToken, verifyToken) ||
                other.verifyToken == verifyToken) &&
            (identical(other.pendingEmail, pendingEmail) ||
                other.pendingEmail == pendingEmail) &&
            (identical(other.resendIn, resendIn) ||
                other.resendIn == resendIn) &&
            (identical(other.loginResponse, loginResponse) ||
                other.loginResponse == loginResponse) &&
            (identical(other.loginSsoResponse, loginSsoResponse) ||
                other.loginSsoResponse == loginSsoResponse) &&
            (identical(other.registerResponse, registerResponse) ||
                other.registerResponse == registerResponse) &&
            (identical(other.verifyOtpResponse, verifyOtpResponse) ||
                other.verifyOtpResponse == verifyOtpResponse) &&
            (identical(
                  other.completeProfileResponse,
                  completeProfileResponse,
                ) ||
                other.completeProfileResponse == completeProfileResponse) &&
            (identical(other.alert, alert) || other.alert == alert));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    email,
    password,
    message,
    messageVerifyOtp,
    messageTitle,
    messageTitleVerifyOtp,
    statusCode,
    statusCodeVerifyOtp,
    loading,
    loadingUser,
    loadingGuest,
    loadingSSO,
    loadingVerifyOtp,
    loadingRestoreAccount,
    successLoginUser,
    successLoginGuest,
    successRegister,
    successVerifyOtp,
    successCompleteProfile,
    successGoogleAuth,
    successRestoreAccount,
    needsCompletion,
    tempToken,
    googleName,
    googleEmail,
    verifyToken,
    pendingEmail,
    resendIn,
    loginResponse,
    loginSsoResponse,
    registerResponse,
    verifyOtpResponse,
    completeProfileResponse,
    alert,
  ]);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements AuthState {
  const factory _Initial({
    required final String email,
    required final String password,
    required final String? message,
    required final String? messageVerifyOtp,
    required final String? messageTitle,
    required final String? messageTitleVerifyOtp,
    required final String? statusCode,
    required final int? statusCodeVerifyOtp,
    required final bool loading,
    required final bool loadingUser,
    required final bool loadingGuest,
    required final bool loadingSSO,
    required final bool loadingVerifyOtp,
    required final bool loadingRestoreAccount,
    required final bool successLoginUser,
    required final bool successLoginGuest,
    required final bool successRegister,
    required final bool successVerifyOtp,
    required final bool successCompleteProfile,
    required final bool successGoogleAuth,
    required final bool successRestoreAccount,
    required final bool needsCompletion,
    required final String? tempToken,
    required final String? googleName,
    required final String? googleEmail,
    required final String? verifyToken,
    required final String? pendingEmail,
    required final int? resendIn,
    required final LoginResponse? loginResponse,
    required final LoginSsoResponse? loginSsoResponse,
    required final RegisterResponse? registerResponse,
    required final VerifyOtpResponse? verifyOtpResponse,
    required final CompleteProfileResponse? completeProfileResponse,
    required final Alert? alert,
  }) = _$InitialImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String? get message;
  @override
  String? get messageVerifyOtp;
  @override
  String? get messageTitle;
  @override
  String? get messageTitleVerifyOtp;
  @override
  String? get statusCode;
  @override
  int? get statusCodeVerifyOtp;
  @override
  bool get loading;
  @override
  bool get loadingUser;
  @override
  bool get loadingGuest;
  @override
  bool get loadingSSO;
  @override
  bool get loadingVerifyOtp;
  @override
  bool get loadingRestoreAccount;
  @override
  bool get successLoginUser;
  @override
  bool get successLoginGuest;
  @override
  bool get successRegister;
  @override
  bool get successVerifyOtp;
  @override
  bool get successCompleteProfile;
  @override
  bool get successGoogleAuth;
  @override
  bool get successRestoreAccount;
  @override
  bool get needsCompletion;
  @override
  String? get tempToken;
  @override
  String? get googleName;
  @override
  String? get googleEmail;
  @override
  String? get verifyToken;
  @override
  String? get pendingEmail;
  @override
  int? get resendIn;
  @override
  LoginResponse? get loginResponse;
  @override
  LoginSsoResponse? get loginSsoResponse;
  @override
  RegisterResponse? get registerResponse;
  @override
  VerifyOtpResponse? get verifyOtpResponse;
  @override
  CompleteProfileResponse? get completeProfileResponse;
  @override
  Alert? get alert;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
