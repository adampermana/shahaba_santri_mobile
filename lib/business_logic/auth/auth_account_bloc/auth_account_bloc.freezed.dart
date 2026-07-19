// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'auth_account_bloc.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//   'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
// );

// /// @nodoc
// mixin _$AuthAccountEvent {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() checkAuthStatus,
//     required TResult Function(int userId) signedOutUser,
//     required TResult Function() signedOutGuest,
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? checkAuthStatus,
//     TResult? Function(int userId)? signedOutUser,
//     TResult? Function()? signedOutGuest,
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? checkAuthStatus,
//     TResult Function(int userId)? signedOutUser,
//     TResult Function()? signedOutGuest,
//     required TResult orElse(),
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_CheckAuthStatus value) checkAuthStatus,
//     required TResult Function(_SignedOutUser value) signedOutUser,
//     required TResult Function(_SignedOutGuest value) signedOutGuest,
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
//     TResult? Function(_SignedOutUser value)? signedOutUser,
//     TResult? Function(_SignedOutGuest value)? signedOutGuest,
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_CheckAuthStatus value)? checkAuthStatus,
//     TResult Function(_SignedOutUser value)? signedOutUser,
//     TResult Function(_SignedOutGuest value)? signedOutGuest,
//     required TResult orElse(),
//   }) => throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $AuthAccountEventCopyWith<$Res> {
//   factory $AuthAccountEventCopyWith(
//     AuthAccountEvent value,
//     $Res Function(AuthAccountEvent) then,
//   ) = _$AuthAccountEventCopyWithImpl<$Res, AuthAccountEvent>;
// }

// /// @nodoc
// class _$AuthAccountEventCopyWithImpl<$Res, $Val extends AuthAccountEvent>
//     implements $AuthAccountEventCopyWith<$Res> {
//   _$AuthAccountEventCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   /// Create a copy of AuthAccountEvent
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc
// abstract class _$$CheckAuthStatusImplCopyWith<$Res> {
//   factory _$$CheckAuthStatusImplCopyWith(
//     _$CheckAuthStatusImpl value,
//     $Res Function(_$CheckAuthStatusImpl) then,
//   ) = __$$CheckAuthStatusImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$CheckAuthStatusImplCopyWithImpl<$Res>
//     extends _$AuthAccountEventCopyWithImpl<$Res, _$CheckAuthStatusImpl>
//     implements _$$CheckAuthStatusImplCopyWith<$Res> {
//   __$$CheckAuthStatusImplCopyWithImpl(
//     _$CheckAuthStatusImpl _value,
//     $Res Function(_$CheckAuthStatusImpl) _then,
//   ) : super(_value, _then);

//   /// Create a copy of AuthAccountEvent
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc

// class _$CheckAuthStatusImpl
//     with DiagnosticableTreeMixin
//     implements _CheckAuthStatus {
//   const _$CheckAuthStatusImpl();

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'AuthAccountEvent.checkAuthStatus()';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty('type', 'AuthAccountEvent.checkAuthStatus'));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$CheckAuthStatusImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() checkAuthStatus,
//     required TResult Function(int userId) signedOutUser,
//     required TResult Function() signedOutGuest,
//   }) {
//     return checkAuthStatus();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? checkAuthStatus,
//     TResult? Function(int userId)? signedOutUser,
//     TResult? Function()? signedOutGuest,
//   }) {
//     return checkAuthStatus?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? checkAuthStatus,
//     TResult Function(int userId)? signedOutUser,
//     TResult Function()? signedOutGuest,
//     required TResult orElse(),
//   }) {
//     if (checkAuthStatus != null) {
//       return checkAuthStatus();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_CheckAuthStatus value) checkAuthStatus,
//     required TResult Function(_SignedOutUser value) signedOutUser,
//     required TResult Function(_SignedOutGuest value) signedOutGuest,
//   }) {
//     return checkAuthStatus(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
//     TResult? Function(_SignedOutUser value)? signedOutUser,
//     TResult? Function(_SignedOutGuest value)? signedOutGuest,
//   }) {
//     return checkAuthStatus?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_CheckAuthStatus value)? checkAuthStatus,
//     TResult Function(_SignedOutUser value)? signedOutUser,
//     TResult Function(_SignedOutGuest value)? signedOutGuest,
//     required TResult orElse(),
//   }) {
//     if (checkAuthStatus != null) {
//       return checkAuthStatus(this);
//     }
//     return orElse();
//   }
// }

// abstract class _CheckAuthStatus implements AuthAccountEvent {
//   const factory _CheckAuthStatus() = _$CheckAuthStatusImpl;
// }

// /// @nodoc
// abstract class _$$SignedOutUserImplCopyWith<$Res> {
//   factory _$$SignedOutUserImplCopyWith(
//     _$SignedOutUserImpl value,
//     $Res Function(_$SignedOutUserImpl) then,
//   ) = __$$SignedOutUserImplCopyWithImpl<$Res>;
//   @useResult
//   $Res call({int userId});
// }

// /// @nodoc
// class __$$SignedOutUserImplCopyWithImpl<$Res>
//     extends _$AuthAccountEventCopyWithImpl<$Res, _$SignedOutUserImpl>
//     implements _$$SignedOutUserImplCopyWith<$Res> {
//   __$$SignedOutUserImplCopyWithImpl(
//     _$SignedOutUserImpl _value,
//     $Res Function(_$SignedOutUserImpl) _then,
//   ) : super(_value, _then);

//   /// Create a copy of AuthAccountEvent
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({Object? userId = null}) {
//     return _then(
//       _$SignedOutUserImpl(
//         userId: null == userId
//             ? _value.userId
//             : userId // ignore: cast_nullable_to_non_nullable
//                   as int,
//       ),
//     );
//   }
// }

// /// @nodoc

// class _$SignedOutUserImpl
//     with DiagnosticableTreeMixin
//     implements _SignedOutUser {
//   const _$SignedOutUserImpl({required this.userId});

//   @override
//   final int userId;

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'AuthAccountEvent.signedOutUser(userId: $userId)';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty('type', 'AuthAccountEvent.signedOutUser'))
//       ..add(DiagnosticsProperty('userId', userId));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$SignedOutUserImpl &&
//             (identical(other.userId, userId) || other.userId == userId));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, userId);

//   /// Create a copy of AuthAccountEvent
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$SignedOutUserImplCopyWith<_$SignedOutUserImpl> get copyWith =>
//       __$$SignedOutUserImplCopyWithImpl<_$SignedOutUserImpl>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() checkAuthStatus,
//     required TResult Function(int userId) signedOutUser,
//     required TResult Function() signedOutGuest,
//   }) {
//     return signedOutUser(userId);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? checkAuthStatus,
//     TResult? Function(int userId)? signedOutUser,
//     TResult? Function()? signedOutGuest,
//   }) {
//     return signedOutUser?.call(userId);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? checkAuthStatus,
//     TResult Function(int userId)? signedOutUser,
//     TResult Function()? signedOutGuest,
//     required TResult orElse(),
//   }) {
//     if (signedOutUser != null) {
//       return signedOutUser(userId);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_CheckAuthStatus value) checkAuthStatus,
//     required TResult Function(_SignedOutUser value) signedOutUser,
//     required TResult Function(_SignedOutGuest value) signedOutGuest,
//   }) {
//     return signedOutUser(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
//     TResult? Function(_SignedOutUser value)? signedOutUser,
//     TResult? Function(_SignedOutGuest value)? signedOutGuest,
//   }) {
//     return signedOutUser?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_CheckAuthStatus value)? checkAuthStatus,
//     TResult Function(_SignedOutUser value)? signedOutUser,
//     TResult Function(_SignedOutGuest value)? signedOutGuest,
//     required TResult orElse(),
//   }) {
//     if (signedOutUser != null) {
//       return signedOutUser(this);
//     }
//     return orElse();
//   }
// }

// abstract class _SignedOutUser implements AuthAccountEvent {
//   const factory _SignedOutUser({required final int userId}) =
//       _$SignedOutUserImpl;

//   int get userId;

//   /// Create a copy of AuthAccountEvent
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   _$$SignedOutUserImplCopyWith<_$SignedOutUserImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class _$$SignedOutGuestImplCopyWith<$Res> {
//   factory _$$SignedOutGuestImplCopyWith(
//     _$SignedOutGuestImpl value,
//     $Res Function(_$SignedOutGuestImpl) then,
//   ) = __$$SignedOutGuestImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$SignedOutGuestImplCopyWithImpl<$Res>
//     extends _$AuthAccountEventCopyWithImpl<$Res, _$SignedOutGuestImpl>
//     implements _$$SignedOutGuestImplCopyWith<$Res> {
//   __$$SignedOutGuestImplCopyWithImpl(
//     _$SignedOutGuestImpl _value,
//     $Res Function(_$SignedOutGuestImpl) _then,
//   ) : super(_value, _then);

//   /// Create a copy of AuthAccountEvent
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc

// class _$SignedOutGuestImpl
//     with DiagnosticableTreeMixin
//     implements _SignedOutGuest {
//   const _$SignedOutGuestImpl();

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'AuthAccountEvent.signedOutGuest()';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty('type', 'AuthAccountEvent.signedOutGuest'));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$SignedOutGuestImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() checkAuthStatus,
//     required TResult Function(int userId) signedOutUser,
//     required TResult Function() signedOutGuest,
//   }) {
//     return signedOutGuest();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? checkAuthStatus,
//     TResult? Function(int userId)? signedOutUser,
//     TResult? Function()? signedOutGuest,
//   }) {
//     return signedOutGuest?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? checkAuthStatus,
//     TResult Function(int userId)? signedOutUser,
//     TResult Function()? signedOutGuest,
//     required TResult orElse(),
//   }) {
//     if (signedOutGuest != null) {
//       return signedOutGuest();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(_CheckAuthStatus value) checkAuthStatus,
//     required TResult Function(_SignedOutUser value) signedOutUser,
//     required TResult Function(_SignedOutGuest value) signedOutGuest,
//   }) {
//     return signedOutGuest(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
//     TResult? Function(_SignedOutUser value)? signedOutUser,
//     TResult? Function(_SignedOutGuest value)? signedOutGuest,
//   }) {
//     return signedOutGuest?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(_CheckAuthStatus value)? checkAuthStatus,
//     TResult Function(_SignedOutUser value)? signedOutUser,
//     TResult Function(_SignedOutGuest value)? signedOutGuest,
//     required TResult orElse(),
//   }) {
//     if (signedOutGuest != null) {
//       return signedOutGuest(this);
//     }
//     return orElse();
//   }
// }

// abstract class _SignedOutGuest implements AuthAccountEvent {
//   const factory _SignedOutGuest() = _$SignedOutGuestImpl;
// }

// /// @nodoc
// mixin _$AuthAccountState {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() unauthenticated,
//     required TResult Function(AuthDataUserIsar auth) authenticatedUser,
//     required TResult Function(AuthDataGuestIsar auth) authenticatedGuest,
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? unauthenticated,
//     TResult? Function(AuthDataUserIsar auth)? authenticatedUser,
//     TResult? Function(AuthDataGuestIsar auth)? authenticatedGuest,
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? unauthenticated,
//     TResult Function(AuthDataUserIsar auth)? authenticatedUser,
//     TResult Function(AuthDataGuestIsar auth)? authenticatedGuest,
//     required TResult orElse(),
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Unauthenticated value) unauthenticated,
//     required TResult Function(AuthenticatedUser value) authenticatedUser,
//     required TResult Function(AuthenticatedGuest value) authenticatedGuest,
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Unauthenticated value)? unauthenticated,
//     TResult? Function(AuthenticatedUser value)? authenticatedUser,
//     TResult? Function(AuthenticatedGuest value)? authenticatedGuest,
//   }) => throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Unauthenticated value)? unauthenticated,
//     TResult Function(AuthenticatedUser value)? authenticatedUser,
//     TResult Function(AuthenticatedGuest value)? authenticatedGuest,
//     required TResult orElse(),
//   }) => throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $AuthAccountStateCopyWith<$Res> {
//   factory $AuthAccountStateCopyWith(
//     AuthAccountState value,
//     $Res Function(AuthAccountState) then,
//   ) = _$AuthAccountStateCopyWithImpl<$Res, AuthAccountState>;
// }

// /// @nodoc
// class _$AuthAccountStateCopyWithImpl<$Res, $Val extends AuthAccountState>
//     implements $AuthAccountStateCopyWith<$Res> {
//   _$AuthAccountStateCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   /// Create a copy of AuthAccountState
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc
// abstract class _$$UnauthenticatedImplCopyWith<$Res> {
//   factory _$$UnauthenticatedImplCopyWith(
//     _$UnauthenticatedImpl value,
//     $Res Function(_$UnauthenticatedImpl) then,
//   ) = __$$UnauthenticatedImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$UnauthenticatedImplCopyWithImpl<$Res>
//     extends _$AuthAccountStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
//     implements _$$UnauthenticatedImplCopyWith<$Res> {
//   __$$UnauthenticatedImplCopyWithImpl(
//     _$UnauthenticatedImpl _value,
//     $Res Function(_$UnauthenticatedImpl) _then,
//   ) : super(_value, _then);

//   /// Create a copy of AuthAccountState
//   /// with the given fields replaced by the non-null parameter values.
// }

// /// @nodoc

// class _$UnauthenticatedImpl
//     with DiagnosticableTreeMixin
//     implements Unauthenticated {
//   _$UnauthenticatedImpl();

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'AuthAccountState.unauthenticated()';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty('type', 'AuthAccountState.unauthenticated'));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() unauthenticated,
//     required TResult Function(AuthDataUserIsar auth) authenticatedUser,
//     required TResult Function(AuthDataGuestIsar auth) authenticatedGuest,
//   }) {
//     return unauthenticated();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? unauthenticated,
//     TResult? Function(AuthDataUserIsar auth)? authenticatedUser,
//     TResult? Function(AuthDataGuestIsar auth)? authenticatedGuest,
//   }) {
//     return unauthenticated?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? unauthenticated,
//     TResult Function(AuthDataUserIsar auth)? authenticatedUser,
//     TResult Function(AuthDataGuestIsar auth)? authenticatedGuest,
//     required TResult orElse(),
//   }) {
//     if (unauthenticated != null) {
//       return unauthenticated();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Unauthenticated value) unauthenticated,
//     required TResult Function(AuthenticatedUser value) authenticatedUser,
//     required TResult Function(AuthenticatedGuest value) authenticatedGuest,
//   }) {
//     return unauthenticated(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Unauthenticated value)? unauthenticated,
//     TResult? Function(AuthenticatedUser value)? authenticatedUser,
//     TResult? Function(AuthenticatedGuest value)? authenticatedGuest,
//   }) {
//     return unauthenticated?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Unauthenticated value)? unauthenticated,
//     TResult Function(AuthenticatedUser value)? authenticatedUser,
//     TResult Function(AuthenticatedGuest value)? authenticatedGuest,
//     required TResult orElse(),
//   }) {
//     if (unauthenticated != null) {
//       return unauthenticated(this);
//     }
//     return orElse();
//   }
// }

// abstract class Unauthenticated implements AuthAccountState {
//   factory Unauthenticated() = _$UnauthenticatedImpl;
// }

// /// @nodoc
// abstract class _$$AuthenticatedUserImplCopyWith<$Res> {
//   factory _$$AuthenticatedUserImplCopyWith(
//     _$AuthenticatedUserImpl value,
//     $Res Function(_$AuthenticatedUserImpl) then,
//   ) = __$$AuthenticatedUserImplCopyWithImpl<$Res>;
//   @useResult
//   $Res call({AuthDataUserIsar auth});
// }

// /// @nodoc
// class __$$AuthenticatedUserImplCopyWithImpl<$Res>
//     extends _$AuthAccountStateCopyWithImpl<$Res, _$AuthenticatedUserImpl>
//     implements _$$AuthenticatedUserImplCopyWith<$Res> {
//   __$$AuthenticatedUserImplCopyWithImpl(
//     _$AuthenticatedUserImpl _value,
//     $Res Function(_$AuthenticatedUserImpl) _then,
//   ) : super(_value, _then);

//   /// Create a copy of AuthAccountState
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({Object? auth = null}) {
//     return _then(
//       _$AuthenticatedUserImpl(
//         null == auth
//             ? _value.auth
//             : auth // ignore: cast_nullable_to_non_nullable
//                   as AuthDataUserIsar,
//       ),
//     );
//   }
// }

// /// @nodoc

// class _$AuthenticatedUserImpl
//     with DiagnosticableTreeMixin
//     implements AuthenticatedUser {
//   const _$AuthenticatedUserImpl(this.auth);

//   @override
//   final AuthDataUserIsar auth;

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'AuthAccountState.authenticatedUser(auth: $auth)';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty('type', 'AuthAccountState.authenticatedUser'))
//       ..add(DiagnosticsProperty('auth', auth));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$AuthenticatedUserImpl &&
//             (identical(other.auth, auth) || other.auth == auth));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, auth);

//   /// Create a copy of AuthAccountState
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$AuthenticatedUserImplCopyWith<_$AuthenticatedUserImpl> get copyWith =>
//       __$$AuthenticatedUserImplCopyWithImpl<_$AuthenticatedUserImpl>(
//         this,
//         _$identity,
//       );

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() unauthenticated,
//     required TResult Function(AuthDataUserIsar auth) authenticatedUser,
//     required TResult Function(AuthDataGuestIsar auth) authenticatedGuest,
//   }) {
//     return authenticatedUser(auth);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? unauthenticated,
//     TResult? Function(AuthDataUserIsar auth)? authenticatedUser,
//     TResult? Function(AuthDataGuestIsar auth)? authenticatedGuest,
//   }) {
//     return authenticatedUser?.call(auth);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? unauthenticated,
//     TResult Function(AuthDataUserIsar auth)? authenticatedUser,
//     TResult Function(AuthDataGuestIsar auth)? authenticatedGuest,
//     required TResult orElse(),
//   }) {
//     if (authenticatedUser != null) {
//       return authenticatedUser(auth);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Unauthenticated value) unauthenticated,
//     required TResult Function(AuthenticatedUser value) authenticatedUser,
//     required TResult Function(AuthenticatedGuest value) authenticatedGuest,
//   }) {
//     return authenticatedUser(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Unauthenticated value)? unauthenticated,
//     TResult? Function(AuthenticatedUser value)? authenticatedUser,
//     TResult? Function(AuthenticatedGuest value)? authenticatedGuest,
//   }) {
//     return authenticatedUser?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Unauthenticated value)? unauthenticated,
//     TResult Function(AuthenticatedUser value)? authenticatedUser,
//     TResult Function(AuthenticatedGuest value)? authenticatedGuest,
//     required TResult orElse(),
//   }) {
//     if (authenticatedUser != null) {
//       return authenticatedUser(this);
//     }
//     return orElse();
//   }
// }

// abstract class AuthenticatedUser implements AuthAccountState {
//   const factory AuthenticatedUser(final AuthDataUserIsar auth) =
//       _$AuthenticatedUserImpl;

//   AuthDataUserIsar get auth;

//   /// Create a copy of AuthAccountState
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   _$$AuthenticatedUserImplCopyWith<_$AuthenticatedUserImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class _$$AuthenticatedGuestImplCopyWith<$Res> {
//   factory _$$AuthenticatedGuestImplCopyWith(
//     _$AuthenticatedGuestImpl value,
//     $Res Function(_$AuthenticatedGuestImpl) then,
//   ) = __$$AuthenticatedGuestImplCopyWithImpl<$Res>;
//   @useResult
//   $Res call({AuthDataGuestIsar auth});
// }

// /// @nodoc
// class __$$AuthenticatedGuestImplCopyWithImpl<$Res>
//     extends _$AuthAccountStateCopyWithImpl<$Res, _$AuthenticatedGuestImpl>
//     implements _$$AuthenticatedGuestImplCopyWith<$Res> {
//   __$$AuthenticatedGuestImplCopyWithImpl(
//     _$AuthenticatedGuestImpl _value,
//     $Res Function(_$AuthenticatedGuestImpl) _then,
//   ) : super(_value, _then);

//   /// Create a copy of AuthAccountState
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({Object? auth = null}) {
//     return _then(
//       _$AuthenticatedGuestImpl(
//         null == auth
//             ? _value.auth
//             : auth // ignore: cast_nullable_to_non_nullable
//                   as AuthDataGuestIsar,
//       ),
//     );
//   }
// }

// /// @nodoc

// class _$AuthenticatedGuestImpl
//     with DiagnosticableTreeMixin
//     implements AuthenticatedGuest {
//   const _$AuthenticatedGuestImpl(this.auth);

//   @override
//   final AuthDataGuestIsar auth;

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'AuthAccountState.authenticatedGuest(auth: $auth)';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty('type', 'AuthAccountState.authenticatedGuest'))
//       ..add(DiagnosticsProperty('auth', auth));
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$AuthenticatedGuestImpl &&
//             (identical(other.auth, auth) || other.auth == auth));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, auth);

//   /// Create a copy of AuthAccountState
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$AuthenticatedGuestImplCopyWith<_$AuthenticatedGuestImpl> get copyWith =>
//       __$$AuthenticatedGuestImplCopyWithImpl<_$AuthenticatedGuestImpl>(
//         this,
//         _$identity,
//       );

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() unauthenticated,
//     required TResult Function(AuthDataUserIsar auth) authenticatedUser,
//     required TResult Function(AuthDataGuestIsar auth) authenticatedGuest,
//   }) {
//     return authenticatedGuest(auth);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? unauthenticated,
//     TResult? Function(AuthDataUserIsar auth)? authenticatedUser,
//     TResult? Function(AuthDataGuestIsar auth)? authenticatedGuest,
//   }) {
//     return authenticatedGuest?.call(auth);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? unauthenticated,
//     TResult Function(AuthDataUserIsar auth)? authenticatedUser,
//     TResult Function(AuthDataGuestIsar auth)? authenticatedGuest,
//     required TResult orElse(),
//   }) {
//     if (authenticatedGuest != null) {
//       return authenticatedGuest(auth);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Unauthenticated value) unauthenticated,
//     required TResult Function(AuthenticatedUser value) authenticatedUser,
//     required TResult Function(AuthenticatedGuest value) authenticatedGuest,
//   }) {
//     return authenticatedGuest(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Unauthenticated value)? unauthenticated,
//     TResult? Function(AuthenticatedUser value)? authenticatedUser,
//     TResult? Function(AuthenticatedGuest value)? authenticatedGuest,
//   }) {
//     return authenticatedGuest?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Unauthenticated value)? unauthenticated,
//     TResult Function(AuthenticatedUser value)? authenticatedUser,
//     TResult Function(AuthenticatedGuest value)? authenticatedGuest,
//     required TResult orElse(),
//   }) {
//     if (authenticatedGuest != null) {
//       return authenticatedGuest(this);
//     }
//     return orElse();
//   }
// }

// abstract class AuthenticatedGuest implements AuthAccountState {
//   const factory AuthenticatedGuest(final AuthDataGuestIsar auth) =
//       _$AuthenticatedGuestImpl;

//   AuthDataGuestIsar get auth;

//   /// Create a copy of AuthAccountState
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   _$$AuthenticatedGuestImplCopyWith<_$AuthenticatedGuestImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }
