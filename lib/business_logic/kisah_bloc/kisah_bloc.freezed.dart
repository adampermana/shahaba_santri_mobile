// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kisah_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KisahEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KisahEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KisahEvent()';
}


}

/// @nodoc
class $KisahEventCopyWith<$Res>  {
$KisahEventCopyWith(KisahEvent _, $Res Function(KisahEvent) __);
}


/// Adds pattern-matching-related methods to [KisahEvent].
extension KisahEventPatterns on KisahEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchKisahList value)?  fetchKisahList,TResult Function( _FetchKisahDetail value)?  fetchKisahDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchKisahList() when fetchKisahList != null:
return fetchKisahList(_that);case _FetchKisahDetail() when fetchKisahDetail != null:
return fetchKisahDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchKisahList value)  fetchKisahList,required TResult Function( _FetchKisahDetail value)  fetchKisahDetail,}){
final _that = this;
switch (_that) {
case _FetchKisahList():
return fetchKisahList(_that);case _FetchKisahDetail():
return fetchKisahDetail(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchKisahList value)?  fetchKisahList,TResult? Function( _FetchKisahDetail value)?  fetchKisahDetail,}){
final _that = this;
switch (_that) {
case _FetchKisahList() when fetchKisahList != null:
return fetchKisahList(_that);case _FetchKisahDetail() when fetchKisahDetail != null:
return fetchKisahDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchKisahList,TResult Function( int id)?  fetchKisahDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchKisahList() when fetchKisahList != null:
return fetchKisahList();case _FetchKisahDetail() when fetchKisahDetail != null:
return fetchKisahDetail(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchKisahList,required TResult Function( int id)  fetchKisahDetail,}) {final _that = this;
switch (_that) {
case _FetchKisahList():
return fetchKisahList();case _FetchKisahDetail():
return fetchKisahDetail(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchKisahList,TResult? Function( int id)?  fetchKisahDetail,}) {final _that = this;
switch (_that) {
case _FetchKisahList() when fetchKisahList != null:
return fetchKisahList();case _FetchKisahDetail() when fetchKisahDetail != null:
return fetchKisahDetail(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _FetchKisahList implements KisahEvent {
  const _FetchKisahList();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchKisahList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KisahEvent.fetchKisahList()';
}


}




/// @nodoc


class _FetchKisahDetail implements KisahEvent {
  const _FetchKisahDetail(this.id);
  

 final  int id;

/// Create a copy of KisahEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchKisahDetailCopyWith<_FetchKisahDetail> get copyWith => __$FetchKisahDetailCopyWithImpl<_FetchKisahDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchKisahDetail&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'KisahEvent.fetchKisahDetail(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchKisahDetailCopyWith<$Res> implements $KisahEventCopyWith<$Res> {
  factory _$FetchKisahDetailCopyWith(_FetchKisahDetail value, $Res Function(_FetchKisahDetail) _then) = __$FetchKisahDetailCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchKisahDetailCopyWithImpl<$Res>
    implements _$FetchKisahDetailCopyWith<$Res> {
  __$FetchKisahDetailCopyWithImpl(this._self, this._then);

  final _FetchKisahDetail _self;
  final $Res Function(_FetchKisahDetail) _then;

/// Create a copy of KisahEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchKisahDetail(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$KisahState {

 bool get fetchKisahLoading; bool get fetchKisahSuccess; String get fetchKisahErrorMessage; int get fetchKisahStatusCode; KisahResponse? get kisahResponse; bool get fetchDetailLoading; bool get fetchDetailSuccess; String get fetchDetailErrorMessage; KisahData? get kisahDetail;
/// Create a copy of KisahState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KisahStateCopyWith<KisahState> get copyWith => _$KisahStateCopyWithImpl<KisahState>(this as KisahState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KisahState&&(identical(other.fetchKisahLoading, fetchKisahLoading) || other.fetchKisahLoading == fetchKisahLoading)&&(identical(other.fetchKisahSuccess, fetchKisahSuccess) || other.fetchKisahSuccess == fetchKisahSuccess)&&(identical(other.fetchKisahErrorMessage, fetchKisahErrorMessage) || other.fetchKisahErrorMessage == fetchKisahErrorMessage)&&(identical(other.fetchKisahStatusCode, fetchKisahStatusCode) || other.fetchKisahStatusCode == fetchKisahStatusCode)&&(identical(other.kisahResponse, kisahResponse) || other.kisahResponse == kisahResponse)&&(identical(other.fetchDetailLoading, fetchDetailLoading) || other.fetchDetailLoading == fetchDetailLoading)&&(identical(other.fetchDetailSuccess, fetchDetailSuccess) || other.fetchDetailSuccess == fetchDetailSuccess)&&(identical(other.fetchDetailErrorMessage, fetchDetailErrorMessage) || other.fetchDetailErrorMessage == fetchDetailErrorMessage)&&(identical(other.kisahDetail, kisahDetail) || other.kisahDetail == kisahDetail));
}


@override
int get hashCode => Object.hash(runtimeType,fetchKisahLoading,fetchKisahSuccess,fetchKisahErrorMessage,fetchKisahStatusCode,kisahResponse,fetchDetailLoading,fetchDetailSuccess,fetchDetailErrorMessage,kisahDetail);

@override
String toString() {
  return 'KisahState(fetchKisahLoading: $fetchKisahLoading, fetchKisahSuccess: $fetchKisahSuccess, fetchKisahErrorMessage: $fetchKisahErrorMessage, fetchKisahStatusCode: $fetchKisahStatusCode, kisahResponse: $kisahResponse, fetchDetailLoading: $fetchDetailLoading, fetchDetailSuccess: $fetchDetailSuccess, fetchDetailErrorMessage: $fetchDetailErrorMessage, kisahDetail: $kisahDetail)';
}


}

/// @nodoc
abstract mixin class $KisahStateCopyWith<$Res>  {
  factory $KisahStateCopyWith(KisahState value, $Res Function(KisahState) _then) = _$KisahStateCopyWithImpl;
@useResult
$Res call({
 bool fetchKisahLoading, bool fetchKisahSuccess, String fetchKisahErrorMessage, int fetchKisahStatusCode, KisahResponse? kisahResponse, bool fetchDetailLoading, bool fetchDetailSuccess, String fetchDetailErrorMessage, KisahData? kisahDetail
});




}
/// @nodoc
class _$KisahStateCopyWithImpl<$Res>
    implements $KisahStateCopyWith<$Res> {
  _$KisahStateCopyWithImpl(this._self, this._then);

  final KisahState _self;
  final $Res Function(KisahState) _then;

/// Create a copy of KisahState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fetchKisahLoading = null,Object? fetchKisahSuccess = null,Object? fetchKisahErrorMessage = null,Object? fetchKisahStatusCode = null,Object? kisahResponse = freezed,Object? fetchDetailLoading = null,Object? fetchDetailSuccess = null,Object? fetchDetailErrorMessage = null,Object? kisahDetail = freezed,}) {
  return _then(_self.copyWith(
fetchKisahLoading: null == fetchKisahLoading ? _self.fetchKisahLoading : fetchKisahLoading // ignore: cast_nullable_to_non_nullable
as bool,fetchKisahSuccess: null == fetchKisahSuccess ? _self.fetchKisahSuccess : fetchKisahSuccess // ignore: cast_nullable_to_non_nullable
as bool,fetchKisahErrorMessage: null == fetchKisahErrorMessage ? _self.fetchKisahErrorMessage : fetchKisahErrorMessage // ignore: cast_nullable_to_non_nullable
as String,fetchKisahStatusCode: null == fetchKisahStatusCode ? _self.fetchKisahStatusCode : fetchKisahStatusCode // ignore: cast_nullable_to_non_nullable
as int,kisahResponse: freezed == kisahResponse ? _self.kisahResponse : kisahResponse // ignore: cast_nullable_to_non_nullable
as KisahResponse?,fetchDetailLoading: null == fetchDetailLoading ? _self.fetchDetailLoading : fetchDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,fetchDetailSuccess: null == fetchDetailSuccess ? _self.fetchDetailSuccess : fetchDetailSuccess // ignore: cast_nullable_to_non_nullable
as bool,fetchDetailErrorMessage: null == fetchDetailErrorMessage ? _self.fetchDetailErrorMessage : fetchDetailErrorMessage // ignore: cast_nullable_to_non_nullable
as String,kisahDetail: freezed == kisahDetail ? _self.kisahDetail : kisahDetail // ignore: cast_nullable_to_non_nullable
as KisahData?,
  ));
}

}


/// Adds pattern-matching-related methods to [KisahState].
extension KisahStatePatterns on KisahState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KisahState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KisahState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KisahState value)  $default,){
final _that = this;
switch (_that) {
case _KisahState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KisahState value)?  $default,){
final _that = this;
switch (_that) {
case _KisahState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool fetchKisahLoading,  bool fetchKisahSuccess,  String fetchKisahErrorMessage,  int fetchKisahStatusCode,  KisahResponse? kisahResponse,  bool fetchDetailLoading,  bool fetchDetailSuccess,  String fetchDetailErrorMessage,  KisahData? kisahDetail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KisahState() when $default != null:
return $default(_that.fetchKisahLoading,_that.fetchKisahSuccess,_that.fetchKisahErrorMessage,_that.fetchKisahStatusCode,_that.kisahResponse,_that.fetchDetailLoading,_that.fetchDetailSuccess,_that.fetchDetailErrorMessage,_that.kisahDetail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool fetchKisahLoading,  bool fetchKisahSuccess,  String fetchKisahErrorMessage,  int fetchKisahStatusCode,  KisahResponse? kisahResponse,  bool fetchDetailLoading,  bool fetchDetailSuccess,  String fetchDetailErrorMessage,  KisahData? kisahDetail)  $default,) {final _that = this;
switch (_that) {
case _KisahState():
return $default(_that.fetchKisahLoading,_that.fetchKisahSuccess,_that.fetchKisahErrorMessage,_that.fetchKisahStatusCode,_that.kisahResponse,_that.fetchDetailLoading,_that.fetchDetailSuccess,_that.fetchDetailErrorMessage,_that.kisahDetail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool fetchKisahLoading,  bool fetchKisahSuccess,  String fetchKisahErrorMessage,  int fetchKisahStatusCode,  KisahResponse? kisahResponse,  bool fetchDetailLoading,  bool fetchDetailSuccess,  String fetchDetailErrorMessage,  KisahData? kisahDetail)?  $default,) {final _that = this;
switch (_that) {
case _KisahState() when $default != null:
return $default(_that.fetchKisahLoading,_that.fetchKisahSuccess,_that.fetchKisahErrorMessage,_that.fetchKisahStatusCode,_that.kisahResponse,_that.fetchDetailLoading,_that.fetchDetailSuccess,_that.fetchDetailErrorMessage,_that.kisahDetail);case _:
  return null;

}
}

}

/// @nodoc


class _KisahState implements KisahState {
  const _KisahState({required this.fetchKisahLoading, required this.fetchKisahSuccess, required this.fetchKisahErrorMessage, required this.fetchKisahStatusCode, required this.kisahResponse, required this.fetchDetailLoading, required this.fetchDetailSuccess, required this.fetchDetailErrorMessage, required this.kisahDetail});
  

@override final  bool fetchKisahLoading;
@override final  bool fetchKisahSuccess;
@override final  String fetchKisahErrorMessage;
@override final  int fetchKisahStatusCode;
@override final  KisahResponse? kisahResponse;
@override final  bool fetchDetailLoading;
@override final  bool fetchDetailSuccess;
@override final  String fetchDetailErrorMessage;
@override final  KisahData? kisahDetail;

/// Create a copy of KisahState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KisahStateCopyWith<_KisahState> get copyWith => __$KisahStateCopyWithImpl<_KisahState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KisahState&&(identical(other.fetchKisahLoading, fetchKisahLoading) || other.fetchKisahLoading == fetchKisahLoading)&&(identical(other.fetchKisahSuccess, fetchKisahSuccess) || other.fetchKisahSuccess == fetchKisahSuccess)&&(identical(other.fetchKisahErrorMessage, fetchKisahErrorMessage) || other.fetchKisahErrorMessage == fetchKisahErrorMessage)&&(identical(other.fetchKisahStatusCode, fetchKisahStatusCode) || other.fetchKisahStatusCode == fetchKisahStatusCode)&&(identical(other.kisahResponse, kisahResponse) || other.kisahResponse == kisahResponse)&&(identical(other.fetchDetailLoading, fetchDetailLoading) || other.fetchDetailLoading == fetchDetailLoading)&&(identical(other.fetchDetailSuccess, fetchDetailSuccess) || other.fetchDetailSuccess == fetchDetailSuccess)&&(identical(other.fetchDetailErrorMessage, fetchDetailErrorMessage) || other.fetchDetailErrorMessage == fetchDetailErrorMessage)&&(identical(other.kisahDetail, kisahDetail) || other.kisahDetail == kisahDetail));
}


@override
int get hashCode => Object.hash(runtimeType,fetchKisahLoading,fetchKisahSuccess,fetchKisahErrorMessage,fetchKisahStatusCode,kisahResponse,fetchDetailLoading,fetchDetailSuccess,fetchDetailErrorMessage,kisahDetail);

@override
String toString() {
  return 'KisahState(fetchKisahLoading: $fetchKisahLoading, fetchKisahSuccess: $fetchKisahSuccess, fetchKisahErrorMessage: $fetchKisahErrorMessage, fetchKisahStatusCode: $fetchKisahStatusCode, kisahResponse: $kisahResponse, fetchDetailLoading: $fetchDetailLoading, fetchDetailSuccess: $fetchDetailSuccess, fetchDetailErrorMessage: $fetchDetailErrorMessage, kisahDetail: $kisahDetail)';
}


}

/// @nodoc
abstract mixin class _$KisahStateCopyWith<$Res> implements $KisahStateCopyWith<$Res> {
  factory _$KisahStateCopyWith(_KisahState value, $Res Function(_KisahState) _then) = __$KisahStateCopyWithImpl;
@override @useResult
$Res call({
 bool fetchKisahLoading, bool fetchKisahSuccess, String fetchKisahErrorMessage, int fetchKisahStatusCode, KisahResponse? kisahResponse, bool fetchDetailLoading, bool fetchDetailSuccess, String fetchDetailErrorMessage, KisahData? kisahDetail
});




}
/// @nodoc
class __$KisahStateCopyWithImpl<$Res>
    implements _$KisahStateCopyWith<$Res> {
  __$KisahStateCopyWithImpl(this._self, this._then);

  final _KisahState _self;
  final $Res Function(_KisahState) _then;

/// Create a copy of KisahState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fetchKisahLoading = null,Object? fetchKisahSuccess = null,Object? fetchKisahErrorMessage = null,Object? fetchKisahStatusCode = null,Object? kisahResponse = freezed,Object? fetchDetailLoading = null,Object? fetchDetailSuccess = null,Object? fetchDetailErrorMessage = null,Object? kisahDetail = freezed,}) {
  return _then(_KisahState(
fetchKisahLoading: null == fetchKisahLoading ? _self.fetchKisahLoading : fetchKisahLoading // ignore: cast_nullable_to_non_nullable
as bool,fetchKisahSuccess: null == fetchKisahSuccess ? _self.fetchKisahSuccess : fetchKisahSuccess // ignore: cast_nullable_to_non_nullable
as bool,fetchKisahErrorMessage: null == fetchKisahErrorMessage ? _self.fetchKisahErrorMessage : fetchKisahErrorMessage // ignore: cast_nullable_to_non_nullable
as String,fetchKisahStatusCode: null == fetchKisahStatusCode ? _self.fetchKisahStatusCode : fetchKisahStatusCode // ignore: cast_nullable_to_non_nullable
as int,kisahResponse: freezed == kisahResponse ? _self.kisahResponse : kisahResponse // ignore: cast_nullable_to_non_nullable
as KisahResponse?,fetchDetailLoading: null == fetchDetailLoading ? _self.fetchDetailLoading : fetchDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,fetchDetailSuccess: null == fetchDetailSuccess ? _self.fetchDetailSuccess : fetchDetailSuccess // ignore: cast_nullable_to_non_nullable
as bool,fetchDetailErrorMessage: null == fetchDetailErrorMessage ? _self.fetchDetailErrorMessage : fetchDetailErrorMessage // ignore: cast_nullable_to_non_nullable
as String,kisahDetail: freezed == kisahDetail ? _self.kisahDetail : kisahDetail // ignore: cast_nullable_to_non_nullable
as KisahData?,
  ));
}


}

// dart format on
