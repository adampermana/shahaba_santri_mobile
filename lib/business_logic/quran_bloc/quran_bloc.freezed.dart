// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuranEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuranEvent()';
}


}

/// @nodoc
class $QuranEventCopyWith<$Res>  {
$QuranEventCopyWith(QuranEvent _, $Res Function(QuranEvent) __);
}


/// Adds pattern-matching-related methods to [QuranEvent].
extension QuranEventPatterns on QuranEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadSurahs value)?  loadSurahs,TResult Function( _LoadJuz value)?  loadJuz,TResult Function( _ChangeTab value)?  changeTab,TResult Function( _Search value)?  search,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadSurahs() when loadSurahs != null:
return loadSurahs(_that);case _LoadJuz() when loadJuz != null:
return loadJuz(_that);case _ChangeTab() when changeTab != null:
return changeTab(_that);case _Search() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadSurahs value)  loadSurahs,required TResult Function( _LoadJuz value)  loadJuz,required TResult Function( _ChangeTab value)  changeTab,required TResult Function( _Search value)  search,}){
final _that = this;
switch (_that) {
case _LoadSurahs():
return loadSurahs(_that);case _LoadJuz():
return loadJuz(_that);case _ChangeTab():
return changeTab(_that);case _Search():
return search(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadSurahs value)?  loadSurahs,TResult? Function( _LoadJuz value)?  loadJuz,TResult? Function( _ChangeTab value)?  changeTab,TResult? Function( _Search value)?  search,}){
final _that = this;
switch (_that) {
case _LoadSurahs() when loadSurahs != null:
return loadSurahs(_that);case _LoadJuz() when loadJuz != null:
return loadJuz(_that);case _ChangeTab() when changeTab != null:
return changeTab(_that);case _Search() when search != null:
return search(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadSurahs,TResult Function()?  loadJuz,TResult Function( int index)?  changeTab,TResult Function( String keyword)?  search,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadSurahs() when loadSurahs != null:
return loadSurahs();case _LoadJuz() when loadJuz != null:
return loadJuz();case _ChangeTab() when changeTab != null:
return changeTab(_that.index);case _Search() when search != null:
return search(_that.keyword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadSurahs,required TResult Function()  loadJuz,required TResult Function( int index)  changeTab,required TResult Function( String keyword)  search,}) {final _that = this;
switch (_that) {
case _LoadSurahs():
return loadSurahs();case _LoadJuz():
return loadJuz();case _ChangeTab():
return changeTab(_that.index);case _Search():
return search(_that.keyword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadSurahs,TResult? Function()?  loadJuz,TResult? Function( int index)?  changeTab,TResult? Function( String keyword)?  search,}) {final _that = this;
switch (_that) {
case _LoadSurahs() when loadSurahs != null:
return loadSurahs();case _LoadJuz() when loadJuz != null:
return loadJuz();case _ChangeTab() when changeTab != null:
return changeTab(_that.index);case _Search() when search != null:
return search(_that.keyword);case _:
  return null;

}
}

}

/// @nodoc


class _LoadSurahs implements QuranEvent {
  const _LoadSurahs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadSurahs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuranEvent.loadSurahs()';
}


}




/// @nodoc


class _LoadJuz implements QuranEvent {
  const _LoadJuz();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadJuz);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuranEvent.loadJuz()';
}


}




/// @nodoc


class _ChangeTab implements QuranEvent {
  const _ChangeTab(this.index);
  

 final  int index;

/// Create a copy of QuranEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeTabCopyWith<_ChangeTab> get copyWith => __$ChangeTabCopyWithImpl<_ChangeTab>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeTab&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'QuranEvent.changeTab(index: $index)';
}


}

/// @nodoc
abstract mixin class _$ChangeTabCopyWith<$Res> implements $QuranEventCopyWith<$Res> {
  factory _$ChangeTabCopyWith(_ChangeTab value, $Res Function(_ChangeTab) _then) = __$ChangeTabCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$ChangeTabCopyWithImpl<$Res>
    implements _$ChangeTabCopyWith<$Res> {
  __$ChangeTabCopyWithImpl(this._self, this._then);

  final _ChangeTab _self;
  final $Res Function(_ChangeTab) _then;

/// Create a copy of QuranEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_ChangeTab(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Search implements QuranEvent {
  const _Search(this.keyword);
  

 final  String keyword;

/// Create a copy of QuranEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCopyWith<_Search> get copyWith => __$SearchCopyWithImpl<_Search>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search&&(identical(other.keyword, keyword) || other.keyword == keyword));
}


@override
int get hashCode => Object.hash(runtimeType,keyword);

@override
String toString() {
  return 'QuranEvent.search(keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $QuranEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) = __$SearchCopyWithImpl;
@useResult
$Res call({
 String keyword
});




}
/// @nodoc
class __$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

/// Create a copy of QuranEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? keyword = null,}) {
  return _then(_Search(
null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$QuranState {

 int get currentTab; bool get surahsLoading; bool get surahsSuccess; String get surahsError; List<SurahModel> get surahs; bool get juzLoading; bool get juzSuccess; String get juzError; List<JuzModel> get juzList; String get searchKeyword; List<SurahModel> get filteredSurahs; List<JuzModel> get filteredJuz;
/// Create a copy of QuranState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranStateCopyWith<QuranState> get copyWith => _$QuranStateCopyWithImpl<QuranState>(this as QuranState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.surahsLoading, surahsLoading) || other.surahsLoading == surahsLoading)&&(identical(other.surahsSuccess, surahsSuccess) || other.surahsSuccess == surahsSuccess)&&(identical(other.surahsError, surahsError) || other.surahsError == surahsError)&&const DeepCollectionEquality().equals(other.surahs, surahs)&&(identical(other.juzLoading, juzLoading) || other.juzLoading == juzLoading)&&(identical(other.juzSuccess, juzSuccess) || other.juzSuccess == juzSuccess)&&(identical(other.juzError, juzError) || other.juzError == juzError)&&const DeepCollectionEquality().equals(other.juzList, juzList)&&(identical(other.searchKeyword, searchKeyword) || other.searchKeyword == searchKeyword)&&const DeepCollectionEquality().equals(other.filteredSurahs, filteredSurahs)&&const DeepCollectionEquality().equals(other.filteredJuz, filteredJuz));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,surahsLoading,surahsSuccess,surahsError,const DeepCollectionEquality().hash(surahs),juzLoading,juzSuccess,juzError,const DeepCollectionEquality().hash(juzList),searchKeyword,const DeepCollectionEquality().hash(filteredSurahs),const DeepCollectionEquality().hash(filteredJuz));

@override
String toString() {
  return 'QuranState(currentTab: $currentTab, surahsLoading: $surahsLoading, surahsSuccess: $surahsSuccess, surahsError: $surahsError, surahs: $surahs, juzLoading: $juzLoading, juzSuccess: $juzSuccess, juzError: $juzError, juzList: $juzList, searchKeyword: $searchKeyword, filteredSurahs: $filteredSurahs, filteredJuz: $filteredJuz)';
}


}

/// @nodoc
abstract mixin class $QuranStateCopyWith<$Res>  {
  factory $QuranStateCopyWith(QuranState value, $Res Function(QuranState) _then) = _$QuranStateCopyWithImpl;
@useResult
$Res call({
 int currentTab, bool surahsLoading, bool surahsSuccess, String surahsError, List<SurahModel> surahs, bool juzLoading, bool juzSuccess, String juzError, List<JuzModel> juzList, String searchKeyword, List<SurahModel> filteredSurahs, List<JuzModel> filteredJuz
});




}
/// @nodoc
class _$QuranStateCopyWithImpl<$Res>
    implements $QuranStateCopyWith<$Res> {
  _$QuranStateCopyWithImpl(this._self, this._then);

  final QuranState _self;
  final $Res Function(QuranState) _then;

/// Create a copy of QuranState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTab = null,Object? surahsLoading = null,Object? surahsSuccess = null,Object? surahsError = null,Object? surahs = null,Object? juzLoading = null,Object? juzSuccess = null,Object? juzError = null,Object? juzList = null,Object? searchKeyword = null,Object? filteredSurahs = null,Object? filteredJuz = null,}) {
  return _then(_self.copyWith(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as int,surahsLoading: null == surahsLoading ? _self.surahsLoading : surahsLoading // ignore: cast_nullable_to_non_nullable
as bool,surahsSuccess: null == surahsSuccess ? _self.surahsSuccess : surahsSuccess // ignore: cast_nullable_to_non_nullable
as bool,surahsError: null == surahsError ? _self.surahsError : surahsError // ignore: cast_nullable_to_non_nullable
as String,surahs: null == surahs ? _self.surahs : surahs // ignore: cast_nullable_to_non_nullable
as List<SurahModel>,juzLoading: null == juzLoading ? _self.juzLoading : juzLoading // ignore: cast_nullable_to_non_nullable
as bool,juzSuccess: null == juzSuccess ? _self.juzSuccess : juzSuccess // ignore: cast_nullable_to_non_nullable
as bool,juzError: null == juzError ? _self.juzError : juzError // ignore: cast_nullable_to_non_nullable
as String,juzList: null == juzList ? _self.juzList : juzList // ignore: cast_nullable_to_non_nullable
as List<JuzModel>,searchKeyword: null == searchKeyword ? _self.searchKeyword : searchKeyword // ignore: cast_nullable_to_non_nullable
as String,filteredSurahs: null == filteredSurahs ? _self.filteredSurahs : filteredSurahs // ignore: cast_nullable_to_non_nullable
as List<SurahModel>,filteredJuz: null == filteredJuz ? _self.filteredJuz : filteredJuz // ignore: cast_nullable_to_non_nullable
as List<JuzModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuranState].
extension QuranStatePatterns on QuranState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuranState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuranState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuranState value)  $default,){
final _that = this;
switch (_that) {
case _QuranState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuranState value)?  $default,){
final _that = this;
switch (_that) {
case _QuranState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentTab,  bool surahsLoading,  bool surahsSuccess,  String surahsError,  List<SurahModel> surahs,  bool juzLoading,  bool juzSuccess,  String juzError,  List<JuzModel> juzList,  String searchKeyword,  List<SurahModel> filteredSurahs,  List<JuzModel> filteredJuz)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuranState() when $default != null:
return $default(_that.currentTab,_that.surahsLoading,_that.surahsSuccess,_that.surahsError,_that.surahs,_that.juzLoading,_that.juzSuccess,_that.juzError,_that.juzList,_that.searchKeyword,_that.filteredSurahs,_that.filteredJuz);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentTab,  bool surahsLoading,  bool surahsSuccess,  String surahsError,  List<SurahModel> surahs,  bool juzLoading,  bool juzSuccess,  String juzError,  List<JuzModel> juzList,  String searchKeyword,  List<SurahModel> filteredSurahs,  List<JuzModel> filteredJuz)  $default,) {final _that = this;
switch (_that) {
case _QuranState():
return $default(_that.currentTab,_that.surahsLoading,_that.surahsSuccess,_that.surahsError,_that.surahs,_that.juzLoading,_that.juzSuccess,_that.juzError,_that.juzList,_that.searchKeyword,_that.filteredSurahs,_that.filteredJuz);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentTab,  bool surahsLoading,  bool surahsSuccess,  String surahsError,  List<SurahModel> surahs,  bool juzLoading,  bool juzSuccess,  String juzError,  List<JuzModel> juzList,  String searchKeyword,  List<SurahModel> filteredSurahs,  List<JuzModel> filteredJuz)?  $default,) {final _that = this;
switch (_that) {
case _QuranState() when $default != null:
return $default(_that.currentTab,_that.surahsLoading,_that.surahsSuccess,_that.surahsError,_that.surahs,_that.juzLoading,_that.juzSuccess,_that.juzError,_that.juzList,_that.searchKeyword,_that.filteredSurahs,_that.filteredJuz);case _:
  return null;

}
}

}

/// @nodoc


class _QuranState implements QuranState {
  const _QuranState({this.currentTab = 0, this.surahsLoading = false, this.surahsSuccess = false, this.surahsError = '', final  List<SurahModel> surahs = const <SurahModel>[], this.juzLoading = false, this.juzSuccess = false, this.juzError = '', final  List<JuzModel> juzList = const <JuzModel>[], this.searchKeyword = '', final  List<SurahModel> filteredSurahs = const <SurahModel>[], final  List<JuzModel> filteredJuz = const <JuzModel>[]}): _surahs = surahs,_juzList = juzList,_filteredSurahs = filteredSurahs,_filteredJuz = filteredJuz;
  

@override@JsonKey() final  int currentTab;
@override@JsonKey() final  bool surahsLoading;
@override@JsonKey() final  bool surahsSuccess;
@override@JsonKey() final  String surahsError;
 final  List<SurahModel> _surahs;
@override@JsonKey() List<SurahModel> get surahs {
  if (_surahs is EqualUnmodifiableListView) return _surahs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_surahs);
}

@override@JsonKey() final  bool juzLoading;
@override@JsonKey() final  bool juzSuccess;
@override@JsonKey() final  String juzError;
 final  List<JuzModel> _juzList;
@override@JsonKey() List<JuzModel> get juzList {
  if (_juzList is EqualUnmodifiableListView) return _juzList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_juzList);
}

@override@JsonKey() final  String searchKeyword;
 final  List<SurahModel> _filteredSurahs;
@override@JsonKey() List<SurahModel> get filteredSurahs {
  if (_filteredSurahs is EqualUnmodifiableListView) return _filteredSurahs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredSurahs);
}

 final  List<JuzModel> _filteredJuz;
@override@JsonKey() List<JuzModel> get filteredJuz {
  if (_filteredJuz is EqualUnmodifiableListView) return _filteredJuz;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredJuz);
}


/// Create a copy of QuranState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuranStateCopyWith<_QuranState> get copyWith => __$QuranStateCopyWithImpl<_QuranState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuranState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.surahsLoading, surahsLoading) || other.surahsLoading == surahsLoading)&&(identical(other.surahsSuccess, surahsSuccess) || other.surahsSuccess == surahsSuccess)&&(identical(other.surahsError, surahsError) || other.surahsError == surahsError)&&const DeepCollectionEquality().equals(other._surahs, _surahs)&&(identical(other.juzLoading, juzLoading) || other.juzLoading == juzLoading)&&(identical(other.juzSuccess, juzSuccess) || other.juzSuccess == juzSuccess)&&(identical(other.juzError, juzError) || other.juzError == juzError)&&const DeepCollectionEquality().equals(other._juzList, _juzList)&&(identical(other.searchKeyword, searchKeyword) || other.searchKeyword == searchKeyword)&&const DeepCollectionEquality().equals(other._filteredSurahs, _filteredSurahs)&&const DeepCollectionEquality().equals(other._filteredJuz, _filteredJuz));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,surahsLoading,surahsSuccess,surahsError,const DeepCollectionEquality().hash(_surahs),juzLoading,juzSuccess,juzError,const DeepCollectionEquality().hash(_juzList),searchKeyword,const DeepCollectionEquality().hash(_filteredSurahs),const DeepCollectionEquality().hash(_filteredJuz));

@override
String toString() {
  return 'QuranState(currentTab: $currentTab, surahsLoading: $surahsLoading, surahsSuccess: $surahsSuccess, surahsError: $surahsError, surahs: $surahs, juzLoading: $juzLoading, juzSuccess: $juzSuccess, juzError: $juzError, juzList: $juzList, searchKeyword: $searchKeyword, filteredSurahs: $filteredSurahs, filteredJuz: $filteredJuz)';
}


}

/// @nodoc
abstract mixin class _$QuranStateCopyWith<$Res> implements $QuranStateCopyWith<$Res> {
  factory _$QuranStateCopyWith(_QuranState value, $Res Function(_QuranState) _then) = __$QuranStateCopyWithImpl;
@override @useResult
$Res call({
 int currentTab, bool surahsLoading, bool surahsSuccess, String surahsError, List<SurahModel> surahs, bool juzLoading, bool juzSuccess, String juzError, List<JuzModel> juzList, String searchKeyword, List<SurahModel> filteredSurahs, List<JuzModel> filteredJuz
});




}
/// @nodoc
class __$QuranStateCopyWithImpl<$Res>
    implements _$QuranStateCopyWith<$Res> {
  __$QuranStateCopyWithImpl(this._self, this._then);

  final _QuranState _self;
  final $Res Function(_QuranState) _then;

/// Create a copy of QuranState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTab = null,Object? surahsLoading = null,Object? surahsSuccess = null,Object? surahsError = null,Object? surahs = null,Object? juzLoading = null,Object? juzSuccess = null,Object? juzError = null,Object? juzList = null,Object? searchKeyword = null,Object? filteredSurahs = null,Object? filteredJuz = null,}) {
  return _then(_QuranState(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as int,surahsLoading: null == surahsLoading ? _self.surahsLoading : surahsLoading // ignore: cast_nullable_to_non_nullable
as bool,surahsSuccess: null == surahsSuccess ? _self.surahsSuccess : surahsSuccess // ignore: cast_nullable_to_non_nullable
as bool,surahsError: null == surahsError ? _self.surahsError : surahsError // ignore: cast_nullable_to_non_nullable
as String,surahs: null == surahs ? _self._surahs : surahs // ignore: cast_nullable_to_non_nullable
as List<SurahModel>,juzLoading: null == juzLoading ? _self.juzLoading : juzLoading // ignore: cast_nullable_to_non_nullable
as bool,juzSuccess: null == juzSuccess ? _self.juzSuccess : juzSuccess // ignore: cast_nullable_to_non_nullable
as bool,juzError: null == juzError ? _self.juzError : juzError // ignore: cast_nullable_to_non_nullable
as String,juzList: null == juzList ? _self._juzList : juzList // ignore: cast_nullable_to_non_nullable
as List<JuzModel>,searchKeyword: null == searchKeyword ? _self.searchKeyword : searchKeyword // ignore: cast_nullable_to_non_nullable
as String,filteredSurahs: null == filteredSurahs ? _self._filteredSurahs : filteredSurahs // ignore: cast_nullable_to_non_nullable
as List<SurahModel>,filteredJuz: null == filteredJuz ? _self._filteredJuz : filteredJuz // ignore: cast_nullable_to_non_nullable
as List<JuzModel>,
  ));
}


}

// dart format on
