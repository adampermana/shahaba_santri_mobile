// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent()';
}


}

/// @nodoc
class $NewsEventCopyWith<$Res>  {
$NewsEventCopyWith(NewsEvent _, $Res Function(NewsEvent) __);
}


/// Adds pattern-matching-related methods to [NewsEvent].
extension NewsEventPatterns on NewsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchNewsList value)?  fetchNewsList,TResult Function( _FetchNewsDetail value)?  fetchNewsDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchNewsList() when fetchNewsList != null:
return fetchNewsList(_that);case _FetchNewsDetail() when fetchNewsDetail != null:
return fetchNewsDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchNewsList value)  fetchNewsList,required TResult Function( _FetchNewsDetail value)  fetchNewsDetail,}){
final _that = this;
switch (_that) {
case _FetchNewsList():
return fetchNewsList(_that);case _FetchNewsDetail():
return fetchNewsDetail(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchNewsList value)?  fetchNewsList,TResult? Function( _FetchNewsDetail value)?  fetchNewsDetail,}){
final _that = this;
switch (_that) {
case _FetchNewsList() when fetchNewsList != null:
return fetchNewsList(_that);case _FetchNewsDetail() when fetchNewsDetail != null:
return fetchNewsDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchNewsList,TResult Function( int id)?  fetchNewsDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchNewsList() when fetchNewsList != null:
return fetchNewsList();case _FetchNewsDetail() when fetchNewsDetail != null:
return fetchNewsDetail(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchNewsList,required TResult Function( int id)  fetchNewsDetail,}) {final _that = this;
switch (_that) {
case _FetchNewsList():
return fetchNewsList();case _FetchNewsDetail():
return fetchNewsDetail(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchNewsList,TResult? Function( int id)?  fetchNewsDetail,}) {final _that = this;
switch (_that) {
case _FetchNewsList() when fetchNewsList != null:
return fetchNewsList();case _FetchNewsDetail() when fetchNewsDetail != null:
return fetchNewsDetail(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _FetchNewsList implements NewsEvent {
  const _FetchNewsList();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchNewsList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent.fetchNewsList()';
}


}




/// @nodoc


class _FetchNewsDetail implements NewsEvent {
  const _FetchNewsDetail(this.id);
  

 final  int id;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchNewsDetailCopyWith<_FetchNewsDetail> get copyWith => __$FetchNewsDetailCopyWithImpl<_FetchNewsDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchNewsDetail&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'NewsEvent.fetchNewsDetail(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchNewsDetailCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory _$FetchNewsDetailCopyWith(_FetchNewsDetail value, $Res Function(_FetchNewsDetail) _then) = __$FetchNewsDetailCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchNewsDetailCopyWithImpl<$Res>
    implements _$FetchNewsDetailCopyWith<$Res> {
  __$FetchNewsDetailCopyWithImpl(this._self, this._then);

  final _FetchNewsDetail _self;
  final $Res Function(_FetchNewsDetail) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchNewsDetail(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$NewsState {

 bool get fetchNewsLoading; bool get fetchNewsSuccess; String get fetchNewsErrorMessage; int get fetchNewsStatusCode; NewsResponse? get newsResponse; bool get fetchDetailLoading; bool get fetchDetailSuccess; String get fetchDetailErrorMessage; NewsData? get newsDetail;
/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsStateCopyWith<NewsState> get copyWith => _$NewsStateCopyWithImpl<NewsState>(this as NewsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsState&&(identical(other.fetchNewsLoading, fetchNewsLoading) || other.fetchNewsLoading == fetchNewsLoading)&&(identical(other.fetchNewsSuccess, fetchNewsSuccess) || other.fetchNewsSuccess == fetchNewsSuccess)&&(identical(other.fetchNewsErrorMessage, fetchNewsErrorMessage) || other.fetchNewsErrorMessage == fetchNewsErrorMessage)&&(identical(other.fetchNewsStatusCode, fetchNewsStatusCode) || other.fetchNewsStatusCode == fetchNewsStatusCode)&&(identical(other.newsResponse, newsResponse) || other.newsResponse == newsResponse)&&(identical(other.fetchDetailLoading, fetchDetailLoading) || other.fetchDetailLoading == fetchDetailLoading)&&(identical(other.fetchDetailSuccess, fetchDetailSuccess) || other.fetchDetailSuccess == fetchDetailSuccess)&&(identical(other.fetchDetailErrorMessage, fetchDetailErrorMessage) || other.fetchDetailErrorMessage == fetchDetailErrorMessage)&&(identical(other.newsDetail, newsDetail) || other.newsDetail == newsDetail));
}


@override
int get hashCode => Object.hash(runtimeType,fetchNewsLoading,fetchNewsSuccess,fetchNewsErrorMessage,fetchNewsStatusCode,newsResponse,fetchDetailLoading,fetchDetailSuccess,fetchDetailErrorMessage,newsDetail);

@override
String toString() {
  return 'NewsState(fetchNewsLoading: $fetchNewsLoading, fetchNewsSuccess: $fetchNewsSuccess, fetchNewsErrorMessage: $fetchNewsErrorMessage, fetchNewsStatusCode: $fetchNewsStatusCode, newsResponse: $newsResponse, fetchDetailLoading: $fetchDetailLoading, fetchDetailSuccess: $fetchDetailSuccess, fetchDetailErrorMessage: $fetchDetailErrorMessage, newsDetail: $newsDetail)';
}


}

/// @nodoc
abstract mixin class $NewsStateCopyWith<$Res>  {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) _then) = _$NewsStateCopyWithImpl;
@useResult
$Res call({
 bool fetchNewsLoading, bool fetchNewsSuccess, String fetchNewsErrorMessage, int fetchNewsStatusCode, NewsResponse? newsResponse, bool fetchDetailLoading, bool fetchDetailSuccess, String fetchDetailErrorMessage, NewsData? newsDetail
});




}
/// @nodoc
class _$NewsStateCopyWithImpl<$Res>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._self, this._then);

  final NewsState _self;
  final $Res Function(NewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fetchNewsLoading = null,Object? fetchNewsSuccess = null,Object? fetchNewsErrorMessage = null,Object? fetchNewsStatusCode = null,Object? newsResponse = freezed,Object? fetchDetailLoading = null,Object? fetchDetailSuccess = null,Object? fetchDetailErrorMessage = null,Object? newsDetail = freezed,}) {
  return _then(_self.copyWith(
fetchNewsLoading: null == fetchNewsLoading ? _self.fetchNewsLoading : fetchNewsLoading // ignore: cast_nullable_to_non_nullable
as bool,fetchNewsSuccess: null == fetchNewsSuccess ? _self.fetchNewsSuccess : fetchNewsSuccess // ignore: cast_nullable_to_non_nullable
as bool,fetchNewsErrorMessage: null == fetchNewsErrorMessage ? _self.fetchNewsErrorMessage : fetchNewsErrorMessage // ignore: cast_nullable_to_non_nullable
as String,fetchNewsStatusCode: null == fetchNewsStatusCode ? _self.fetchNewsStatusCode : fetchNewsStatusCode // ignore: cast_nullable_to_non_nullable
as int,newsResponse: freezed == newsResponse ? _self.newsResponse : newsResponse // ignore: cast_nullable_to_non_nullable
as NewsResponse?,fetchDetailLoading: null == fetchDetailLoading ? _self.fetchDetailLoading : fetchDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,fetchDetailSuccess: null == fetchDetailSuccess ? _self.fetchDetailSuccess : fetchDetailSuccess // ignore: cast_nullable_to_non_nullable
as bool,fetchDetailErrorMessage: null == fetchDetailErrorMessage ? _self.fetchDetailErrorMessage : fetchDetailErrorMessage // ignore: cast_nullable_to_non_nullable
as String,newsDetail: freezed == newsDetail ? _self.newsDetail : newsDetail // ignore: cast_nullable_to_non_nullable
as NewsData?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsState value)  $default,){
final _that = this;
switch (_that) {
case _NewsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsState value)?  $default,){
final _that = this;
switch (_that) {
case _NewsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool fetchNewsLoading,  bool fetchNewsSuccess,  String fetchNewsErrorMessage,  int fetchNewsStatusCode,  NewsResponse? newsResponse,  bool fetchDetailLoading,  bool fetchDetailSuccess,  String fetchDetailErrorMessage,  NewsData? newsDetail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsState() when $default != null:
return $default(_that.fetchNewsLoading,_that.fetchNewsSuccess,_that.fetchNewsErrorMessage,_that.fetchNewsStatusCode,_that.newsResponse,_that.fetchDetailLoading,_that.fetchDetailSuccess,_that.fetchDetailErrorMessage,_that.newsDetail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool fetchNewsLoading,  bool fetchNewsSuccess,  String fetchNewsErrorMessage,  int fetchNewsStatusCode,  NewsResponse? newsResponse,  bool fetchDetailLoading,  bool fetchDetailSuccess,  String fetchDetailErrorMessage,  NewsData? newsDetail)  $default,) {final _that = this;
switch (_that) {
case _NewsState():
return $default(_that.fetchNewsLoading,_that.fetchNewsSuccess,_that.fetchNewsErrorMessage,_that.fetchNewsStatusCode,_that.newsResponse,_that.fetchDetailLoading,_that.fetchDetailSuccess,_that.fetchDetailErrorMessage,_that.newsDetail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool fetchNewsLoading,  bool fetchNewsSuccess,  String fetchNewsErrorMessage,  int fetchNewsStatusCode,  NewsResponse? newsResponse,  bool fetchDetailLoading,  bool fetchDetailSuccess,  String fetchDetailErrorMessage,  NewsData? newsDetail)?  $default,) {final _that = this;
switch (_that) {
case _NewsState() when $default != null:
return $default(_that.fetchNewsLoading,_that.fetchNewsSuccess,_that.fetchNewsErrorMessage,_that.fetchNewsStatusCode,_that.newsResponse,_that.fetchDetailLoading,_that.fetchDetailSuccess,_that.fetchDetailErrorMessage,_that.newsDetail);case _:
  return null;

}
}

}

/// @nodoc


class _NewsState implements NewsState {
  const _NewsState({required this.fetchNewsLoading, required this.fetchNewsSuccess, required this.fetchNewsErrorMessage, required this.fetchNewsStatusCode, required this.newsResponse, required this.fetchDetailLoading, required this.fetchDetailSuccess, required this.fetchDetailErrorMessage, required this.newsDetail});
  

@override final  bool fetchNewsLoading;
@override final  bool fetchNewsSuccess;
@override final  String fetchNewsErrorMessage;
@override final  int fetchNewsStatusCode;
@override final  NewsResponse? newsResponse;
@override final  bool fetchDetailLoading;
@override final  bool fetchDetailSuccess;
@override final  String fetchDetailErrorMessage;
@override final  NewsData? newsDetail;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsStateCopyWith<_NewsState> get copyWith => __$NewsStateCopyWithImpl<_NewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsState&&(identical(other.fetchNewsLoading, fetchNewsLoading) || other.fetchNewsLoading == fetchNewsLoading)&&(identical(other.fetchNewsSuccess, fetchNewsSuccess) || other.fetchNewsSuccess == fetchNewsSuccess)&&(identical(other.fetchNewsErrorMessage, fetchNewsErrorMessage) || other.fetchNewsErrorMessage == fetchNewsErrorMessage)&&(identical(other.fetchNewsStatusCode, fetchNewsStatusCode) || other.fetchNewsStatusCode == fetchNewsStatusCode)&&(identical(other.newsResponse, newsResponse) || other.newsResponse == newsResponse)&&(identical(other.fetchDetailLoading, fetchDetailLoading) || other.fetchDetailLoading == fetchDetailLoading)&&(identical(other.fetchDetailSuccess, fetchDetailSuccess) || other.fetchDetailSuccess == fetchDetailSuccess)&&(identical(other.fetchDetailErrorMessage, fetchDetailErrorMessage) || other.fetchDetailErrorMessage == fetchDetailErrorMessage)&&(identical(other.newsDetail, newsDetail) || other.newsDetail == newsDetail));
}


@override
int get hashCode => Object.hash(runtimeType,fetchNewsLoading,fetchNewsSuccess,fetchNewsErrorMessage,fetchNewsStatusCode,newsResponse,fetchDetailLoading,fetchDetailSuccess,fetchDetailErrorMessage,newsDetail);

@override
String toString() {
  return 'NewsState(fetchNewsLoading: $fetchNewsLoading, fetchNewsSuccess: $fetchNewsSuccess, fetchNewsErrorMessage: $fetchNewsErrorMessage, fetchNewsStatusCode: $fetchNewsStatusCode, newsResponse: $newsResponse, fetchDetailLoading: $fetchDetailLoading, fetchDetailSuccess: $fetchDetailSuccess, fetchDetailErrorMessage: $fetchDetailErrorMessage, newsDetail: $newsDetail)';
}


}

/// @nodoc
abstract mixin class _$NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$NewsStateCopyWith(_NewsState value, $Res Function(_NewsState) _then) = __$NewsStateCopyWithImpl;
@override @useResult
$Res call({
 bool fetchNewsLoading, bool fetchNewsSuccess, String fetchNewsErrorMessage, int fetchNewsStatusCode, NewsResponse? newsResponse, bool fetchDetailLoading, bool fetchDetailSuccess, String fetchDetailErrorMessage, NewsData? newsDetail
});




}
/// @nodoc
class __$NewsStateCopyWithImpl<$Res>
    implements _$NewsStateCopyWith<$Res> {
  __$NewsStateCopyWithImpl(this._self, this._then);

  final _NewsState _self;
  final $Res Function(_NewsState) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fetchNewsLoading = null,Object? fetchNewsSuccess = null,Object? fetchNewsErrorMessage = null,Object? fetchNewsStatusCode = null,Object? newsResponse = freezed,Object? fetchDetailLoading = null,Object? fetchDetailSuccess = null,Object? fetchDetailErrorMessage = null,Object? newsDetail = freezed,}) {
  return _then(_NewsState(
fetchNewsLoading: null == fetchNewsLoading ? _self.fetchNewsLoading : fetchNewsLoading // ignore: cast_nullable_to_non_nullable
as bool,fetchNewsSuccess: null == fetchNewsSuccess ? _self.fetchNewsSuccess : fetchNewsSuccess // ignore: cast_nullable_to_non_nullable
as bool,fetchNewsErrorMessage: null == fetchNewsErrorMessage ? _self.fetchNewsErrorMessage : fetchNewsErrorMessage // ignore: cast_nullable_to_non_nullable
as String,fetchNewsStatusCode: null == fetchNewsStatusCode ? _self.fetchNewsStatusCode : fetchNewsStatusCode // ignore: cast_nullable_to_non_nullable
as int,newsResponse: freezed == newsResponse ? _self.newsResponse : newsResponse // ignore: cast_nullable_to_non_nullable
as NewsResponse?,fetchDetailLoading: null == fetchDetailLoading ? _self.fetchDetailLoading : fetchDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,fetchDetailSuccess: null == fetchDetailSuccess ? _self.fetchDetailSuccess : fetchDetailSuccess // ignore: cast_nullable_to_non_nullable
as bool,fetchDetailErrorMessage: null == fetchDetailErrorMessage ? _self.fetchDetailErrorMessage : fetchDetailErrorMessage // ignore: cast_nullable_to_non_nullable
as String,newsDetail: freezed == newsDetail ? _self.newsDetail : newsDetail // ignore: cast_nullable_to_non_nullable
as NewsData?,
  ));
}


}

// dart format on
