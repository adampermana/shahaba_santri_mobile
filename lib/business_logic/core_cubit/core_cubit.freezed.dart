// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoreState {

 int get tabIndex; bool get isSubmmitBoard; bool get isBoarding; String? get titleErrorMessage; String? get errorMessage;
/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoreStateCopyWith<CoreState> get copyWith => _$CoreStateCopyWithImpl<CoreState>(this as CoreState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoreState&&(identical(other.tabIndex, tabIndex) || other.tabIndex == tabIndex)&&(identical(other.isSubmmitBoard, isSubmmitBoard) || other.isSubmmitBoard == isSubmmitBoard)&&(identical(other.isBoarding, isBoarding) || other.isBoarding == isBoarding)&&(identical(other.titleErrorMessage, titleErrorMessage) || other.titleErrorMessage == titleErrorMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,tabIndex,isSubmmitBoard,isBoarding,titleErrorMessage,errorMessage);

@override
String toString() {
  return 'CoreState(tabIndex: $tabIndex, isSubmmitBoard: $isSubmmitBoard, isBoarding: $isBoarding, titleErrorMessage: $titleErrorMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CoreStateCopyWith<$Res>  {
  factory $CoreStateCopyWith(CoreState value, $Res Function(CoreState) _then) = _$CoreStateCopyWithImpl;
@useResult
$Res call({
 int tabIndex, bool isSubmmitBoard, bool isBoarding, String? titleErrorMessage, String? errorMessage
});




}
/// @nodoc
class _$CoreStateCopyWithImpl<$Res>
    implements $CoreStateCopyWith<$Res> {
  _$CoreStateCopyWithImpl(this._self, this._then);

  final CoreState _self;
  final $Res Function(CoreState) _then;

/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabIndex = null,Object? isSubmmitBoard = null,Object? isBoarding = null,Object? titleErrorMessage = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
tabIndex: null == tabIndex ? _self.tabIndex : tabIndex // ignore: cast_nullable_to_non_nullable
as int,isSubmmitBoard: null == isSubmmitBoard ? _self.isSubmmitBoard : isSubmmitBoard // ignore: cast_nullable_to_non_nullable
as bool,isBoarding: null == isBoarding ? _self.isBoarding : isBoarding // ignore: cast_nullable_to_non_nullable
as bool,titleErrorMessage: freezed == titleErrorMessage ? _self.titleErrorMessage : titleErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoreState].
extension CoreStatePatterns on CoreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoreState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoreState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoreState value)  $default,){
final _that = this;
switch (_that) {
case _CoreState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoreState value)?  $default,){
final _that = this;
switch (_that) {
case _CoreState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tabIndex,  bool isSubmmitBoard,  bool isBoarding,  String? titleErrorMessage,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoreState() when $default != null:
return $default(_that.tabIndex,_that.isSubmmitBoard,_that.isBoarding,_that.titleErrorMessage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tabIndex,  bool isSubmmitBoard,  bool isBoarding,  String? titleErrorMessage,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CoreState():
return $default(_that.tabIndex,_that.isSubmmitBoard,_that.isBoarding,_that.titleErrorMessage,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tabIndex,  bool isSubmmitBoard,  bool isBoarding,  String? titleErrorMessage,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CoreState() when $default != null:
return $default(_that.tabIndex,_that.isSubmmitBoard,_that.isBoarding,_that.titleErrorMessage,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CoreState implements CoreState {
  const _CoreState({required this.tabIndex, required this.isSubmmitBoard, required this.isBoarding, required this.titleErrorMessage, required this.errorMessage});
  

@override final  int tabIndex;
@override final  bool isSubmmitBoard;
@override final  bool isBoarding;
@override final  String? titleErrorMessage;
@override final  String? errorMessage;

/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoreStateCopyWith<_CoreState> get copyWith => __$CoreStateCopyWithImpl<_CoreState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoreState&&(identical(other.tabIndex, tabIndex) || other.tabIndex == tabIndex)&&(identical(other.isSubmmitBoard, isSubmmitBoard) || other.isSubmmitBoard == isSubmmitBoard)&&(identical(other.isBoarding, isBoarding) || other.isBoarding == isBoarding)&&(identical(other.titleErrorMessage, titleErrorMessage) || other.titleErrorMessage == titleErrorMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,tabIndex,isSubmmitBoard,isBoarding,titleErrorMessage,errorMessage);

@override
String toString() {
  return 'CoreState(tabIndex: $tabIndex, isSubmmitBoard: $isSubmmitBoard, isBoarding: $isBoarding, titleErrorMessage: $titleErrorMessage, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CoreStateCopyWith<$Res> implements $CoreStateCopyWith<$Res> {
  factory _$CoreStateCopyWith(_CoreState value, $Res Function(_CoreState) _then) = __$CoreStateCopyWithImpl;
@override @useResult
$Res call({
 int tabIndex, bool isSubmmitBoard, bool isBoarding, String? titleErrorMessage, String? errorMessage
});




}
/// @nodoc
class __$CoreStateCopyWithImpl<$Res>
    implements _$CoreStateCopyWith<$Res> {
  __$CoreStateCopyWithImpl(this._self, this._then);

  final _CoreState _self;
  final $Res Function(_CoreState) _then;

/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabIndex = null,Object? isSubmmitBoard = null,Object? isBoarding = null,Object? titleErrorMessage = freezed,Object? errorMessage = freezed,}) {
  return _then(_CoreState(
tabIndex: null == tabIndex ? _self.tabIndex : tabIndex // ignore: cast_nullable_to_non_nullable
as int,isSubmmitBoard: null == isSubmmitBoard ? _self.isSubmmitBoard : isSubmmitBoard // ignore: cast_nullable_to_non_nullable
as bool,isBoarding: null == isBoarding ? _self.isBoarding : isBoarding // ignore: cast_nullable_to_non_nullable
as bool,titleErrorMessage: freezed == titleErrorMessage ? _self.titleErrorMessage : titleErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
