// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CitySearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CitySearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CitySearchEvent()';
}


}

/// @nodoc
class $CitySearchEventCopyWith<$Res>  {
$CitySearchEventCopyWith(CitySearchEvent _, $Res Function(CitySearchEvent) __);
}


/// Adds pattern-matching-related methods to [CitySearchEvent].
extension CitySearchEventPatterns on CitySearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetAllCities value)?  getAllCities,TResult Function( _SearchCity value)?  searchCity,TResult Function( _ClearSearch value)?  clearSearch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAllCities() when getAllCities != null:
return getAllCities(_that);case _SearchCity() when searchCity != null:
return searchCity(_that);case _ClearSearch() when clearSearch != null:
return clearSearch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetAllCities value)  getAllCities,required TResult Function( _SearchCity value)  searchCity,required TResult Function( _ClearSearch value)  clearSearch,}){
final _that = this;
switch (_that) {
case _GetAllCities():
return getAllCities(_that);case _SearchCity():
return searchCity(_that);case _ClearSearch():
return clearSearch(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetAllCities value)?  getAllCities,TResult? Function( _SearchCity value)?  searchCity,TResult? Function( _ClearSearch value)?  clearSearch,}){
final _that = this;
switch (_that) {
case _GetAllCities() when getAllCities != null:
return getAllCities(_that);case _SearchCity() when searchCity != null:
return searchCity(_that);case _ClearSearch() when clearSearch != null:
return clearSearch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getAllCities,TResult Function( String keyword)?  searchCity,TResult Function()?  clearSearch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAllCities() when getAllCities != null:
return getAllCities();case _SearchCity() when searchCity != null:
return searchCity(_that.keyword);case _ClearSearch() when clearSearch != null:
return clearSearch();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getAllCities,required TResult Function( String keyword)  searchCity,required TResult Function()  clearSearch,}) {final _that = this;
switch (_that) {
case _GetAllCities():
return getAllCities();case _SearchCity():
return searchCity(_that.keyword);case _ClearSearch():
return clearSearch();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getAllCities,TResult? Function( String keyword)?  searchCity,TResult? Function()?  clearSearch,}) {final _that = this;
switch (_that) {
case _GetAllCities() when getAllCities != null:
return getAllCities();case _SearchCity() when searchCity != null:
return searchCity(_that.keyword);case _ClearSearch() when clearSearch != null:
return clearSearch();case _:
  return null;

}
}

}

/// @nodoc


class _GetAllCities implements CitySearchEvent {
  const _GetAllCities();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllCities);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CitySearchEvent.getAllCities()';
}


}




/// @nodoc


class _SearchCity implements CitySearchEvent {
  const _SearchCity(this.keyword);
  

 final  String keyword;

/// Create a copy of CitySearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCityCopyWith<_SearchCity> get copyWith => __$SearchCityCopyWithImpl<_SearchCity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchCity&&(identical(other.keyword, keyword) || other.keyword == keyword));
}


@override
int get hashCode => Object.hash(runtimeType,keyword);

@override
String toString() {
  return 'CitySearchEvent.searchCity(keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class _$SearchCityCopyWith<$Res> implements $CitySearchEventCopyWith<$Res> {
  factory _$SearchCityCopyWith(_SearchCity value, $Res Function(_SearchCity) _then) = __$SearchCityCopyWithImpl;
@useResult
$Res call({
 String keyword
});




}
/// @nodoc
class __$SearchCityCopyWithImpl<$Res>
    implements _$SearchCityCopyWith<$Res> {
  __$SearchCityCopyWithImpl(this._self, this._then);

  final _SearchCity _self;
  final $Res Function(_SearchCity) _then;

/// Create a copy of CitySearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? keyword = null,}) {
  return _then(_SearchCity(
null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ClearSearch implements CitySearchEvent {
  const _ClearSearch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearSearch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CitySearchEvent.clearSearch()';
}


}




/// @nodoc
mixin _$CitySearchState {

 bool get getAllCitiesLoading; bool get getAllCitiesSuccess; String get getAllCitiesErrorMessage; List<CityModel> get cities; bool get searchCityLoading; bool get searchCitySuccess; String get searchCityErrorMessage; List<CityModel> get searchResults;
/// Create a copy of CitySearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CitySearchStateCopyWith<CitySearchState> get copyWith => _$CitySearchStateCopyWithImpl<CitySearchState>(this as CitySearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CitySearchState&&(identical(other.getAllCitiesLoading, getAllCitiesLoading) || other.getAllCitiesLoading == getAllCitiesLoading)&&(identical(other.getAllCitiesSuccess, getAllCitiesSuccess) || other.getAllCitiesSuccess == getAllCitiesSuccess)&&(identical(other.getAllCitiesErrorMessage, getAllCitiesErrorMessage) || other.getAllCitiesErrorMessage == getAllCitiesErrorMessage)&&const DeepCollectionEquality().equals(other.cities, cities)&&(identical(other.searchCityLoading, searchCityLoading) || other.searchCityLoading == searchCityLoading)&&(identical(other.searchCitySuccess, searchCitySuccess) || other.searchCitySuccess == searchCitySuccess)&&(identical(other.searchCityErrorMessage, searchCityErrorMessage) || other.searchCityErrorMessage == searchCityErrorMessage)&&const DeepCollectionEquality().equals(other.searchResults, searchResults));
}


@override
int get hashCode => Object.hash(runtimeType,getAllCitiesLoading,getAllCitiesSuccess,getAllCitiesErrorMessage,const DeepCollectionEquality().hash(cities),searchCityLoading,searchCitySuccess,searchCityErrorMessage,const DeepCollectionEquality().hash(searchResults));

@override
String toString() {
  return 'CitySearchState(getAllCitiesLoading: $getAllCitiesLoading, getAllCitiesSuccess: $getAllCitiesSuccess, getAllCitiesErrorMessage: $getAllCitiesErrorMessage, cities: $cities, searchCityLoading: $searchCityLoading, searchCitySuccess: $searchCitySuccess, searchCityErrorMessage: $searchCityErrorMessage, searchResults: $searchResults)';
}


}

/// @nodoc
abstract mixin class $CitySearchStateCopyWith<$Res>  {
  factory $CitySearchStateCopyWith(CitySearchState value, $Res Function(CitySearchState) _then) = _$CitySearchStateCopyWithImpl;
@useResult
$Res call({
 bool getAllCitiesLoading, bool getAllCitiesSuccess, String getAllCitiesErrorMessage, List<CityModel> cities, bool searchCityLoading, bool searchCitySuccess, String searchCityErrorMessage, List<CityModel> searchResults
});




}
/// @nodoc
class _$CitySearchStateCopyWithImpl<$Res>
    implements $CitySearchStateCopyWith<$Res> {
  _$CitySearchStateCopyWithImpl(this._self, this._then);

  final CitySearchState _self;
  final $Res Function(CitySearchState) _then;

/// Create a copy of CitySearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? getAllCitiesLoading = null,Object? getAllCitiesSuccess = null,Object? getAllCitiesErrorMessage = null,Object? cities = null,Object? searchCityLoading = null,Object? searchCitySuccess = null,Object? searchCityErrorMessage = null,Object? searchResults = null,}) {
  return _then(_self.copyWith(
getAllCitiesLoading: null == getAllCitiesLoading ? _self.getAllCitiesLoading : getAllCitiesLoading // ignore: cast_nullable_to_non_nullable
as bool,getAllCitiesSuccess: null == getAllCitiesSuccess ? _self.getAllCitiesSuccess : getAllCitiesSuccess // ignore: cast_nullable_to_non_nullable
as bool,getAllCitiesErrorMessage: null == getAllCitiesErrorMessage ? _self.getAllCitiesErrorMessage : getAllCitiesErrorMessage // ignore: cast_nullable_to_non_nullable
as String,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,searchCityLoading: null == searchCityLoading ? _self.searchCityLoading : searchCityLoading // ignore: cast_nullable_to_non_nullable
as bool,searchCitySuccess: null == searchCitySuccess ? _self.searchCitySuccess : searchCitySuccess // ignore: cast_nullable_to_non_nullable
as bool,searchCityErrorMessage: null == searchCityErrorMessage ? _self.searchCityErrorMessage : searchCityErrorMessage // ignore: cast_nullable_to_non_nullable
as String,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<CityModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CitySearchState].
extension CitySearchStatePatterns on CitySearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CitySearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CitySearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CitySearchState value)  $default,){
final _that = this;
switch (_that) {
case _CitySearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CitySearchState value)?  $default,){
final _that = this;
switch (_that) {
case _CitySearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool getAllCitiesLoading,  bool getAllCitiesSuccess,  String getAllCitiesErrorMessage,  List<CityModel> cities,  bool searchCityLoading,  bool searchCitySuccess,  String searchCityErrorMessage,  List<CityModel> searchResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CitySearchState() when $default != null:
return $default(_that.getAllCitiesLoading,_that.getAllCitiesSuccess,_that.getAllCitiesErrorMessage,_that.cities,_that.searchCityLoading,_that.searchCitySuccess,_that.searchCityErrorMessage,_that.searchResults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool getAllCitiesLoading,  bool getAllCitiesSuccess,  String getAllCitiesErrorMessage,  List<CityModel> cities,  bool searchCityLoading,  bool searchCitySuccess,  String searchCityErrorMessage,  List<CityModel> searchResults)  $default,) {final _that = this;
switch (_that) {
case _CitySearchState():
return $default(_that.getAllCitiesLoading,_that.getAllCitiesSuccess,_that.getAllCitiesErrorMessage,_that.cities,_that.searchCityLoading,_that.searchCitySuccess,_that.searchCityErrorMessage,_that.searchResults);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool getAllCitiesLoading,  bool getAllCitiesSuccess,  String getAllCitiesErrorMessage,  List<CityModel> cities,  bool searchCityLoading,  bool searchCitySuccess,  String searchCityErrorMessage,  List<CityModel> searchResults)?  $default,) {final _that = this;
switch (_that) {
case _CitySearchState() when $default != null:
return $default(_that.getAllCitiesLoading,_that.getAllCitiesSuccess,_that.getAllCitiesErrorMessage,_that.cities,_that.searchCityLoading,_that.searchCitySuccess,_that.searchCityErrorMessage,_that.searchResults);case _:
  return null;

}
}

}

/// @nodoc


class _CitySearchState implements CitySearchState {
  const _CitySearchState({this.getAllCitiesLoading = false, this.getAllCitiesSuccess = false, this.getAllCitiesErrorMessage = '', final  List<CityModel> cities = const <CityModel>[], this.searchCityLoading = false, this.searchCitySuccess = false, this.searchCityErrorMessage = '', final  List<CityModel> searchResults = const <CityModel>[]}): _cities = cities,_searchResults = searchResults;
  

@override@JsonKey() final  bool getAllCitiesLoading;
@override@JsonKey() final  bool getAllCitiesSuccess;
@override@JsonKey() final  String getAllCitiesErrorMessage;
 final  List<CityModel> _cities;
@override@JsonKey() List<CityModel> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

@override@JsonKey() final  bool searchCityLoading;
@override@JsonKey() final  bool searchCitySuccess;
@override@JsonKey() final  String searchCityErrorMessage;
 final  List<CityModel> _searchResults;
@override@JsonKey() List<CityModel> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}


/// Create a copy of CitySearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CitySearchStateCopyWith<_CitySearchState> get copyWith => __$CitySearchStateCopyWithImpl<_CitySearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CitySearchState&&(identical(other.getAllCitiesLoading, getAllCitiesLoading) || other.getAllCitiesLoading == getAllCitiesLoading)&&(identical(other.getAllCitiesSuccess, getAllCitiesSuccess) || other.getAllCitiesSuccess == getAllCitiesSuccess)&&(identical(other.getAllCitiesErrorMessage, getAllCitiesErrorMessage) || other.getAllCitiesErrorMessage == getAllCitiesErrorMessage)&&const DeepCollectionEquality().equals(other._cities, _cities)&&(identical(other.searchCityLoading, searchCityLoading) || other.searchCityLoading == searchCityLoading)&&(identical(other.searchCitySuccess, searchCitySuccess) || other.searchCitySuccess == searchCitySuccess)&&(identical(other.searchCityErrorMessage, searchCityErrorMessage) || other.searchCityErrorMessage == searchCityErrorMessage)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults));
}


@override
int get hashCode => Object.hash(runtimeType,getAllCitiesLoading,getAllCitiesSuccess,getAllCitiesErrorMessage,const DeepCollectionEquality().hash(_cities),searchCityLoading,searchCitySuccess,searchCityErrorMessage,const DeepCollectionEquality().hash(_searchResults));

@override
String toString() {
  return 'CitySearchState(getAllCitiesLoading: $getAllCitiesLoading, getAllCitiesSuccess: $getAllCitiesSuccess, getAllCitiesErrorMessage: $getAllCitiesErrorMessage, cities: $cities, searchCityLoading: $searchCityLoading, searchCitySuccess: $searchCitySuccess, searchCityErrorMessage: $searchCityErrorMessage, searchResults: $searchResults)';
}


}

/// @nodoc
abstract mixin class _$CitySearchStateCopyWith<$Res> implements $CitySearchStateCopyWith<$Res> {
  factory _$CitySearchStateCopyWith(_CitySearchState value, $Res Function(_CitySearchState) _then) = __$CitySearchStateCopyWithImpl;
@override @useResult
$Res call({
 bool getAllCitiesLoading, bool getAllCitiesSuccess, String getAllCitiesErrorMessage, List<CityModel> cities, bool searchCityLoading, bool searchCitySuccess, String searchCityErrorMessage, List<CityModel> searchResults
});




}
/// @nodoc
class __$CitySearchStateCopyWithImpl<$Res>
    implements _$CitySearchStateCopyWith<$Res> {
  __$CitySearchStateCopyWithImpl(this._self, this._then);

  final _CitySearchState _self;
  final $Res Function(_CitySearchState) _then;

/// Create a copy of CitySearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? getAllCitiesLoading = null,Object? getAllCitiesSuccess = null,Object? getAllCitiesErrorMessage = null,Object? cities = null,Object? searchCityLoading = null,Object? searchCitySuccess = null,Object? searchCityErrorMessage = null,Object? searchResults = null,}) {
  return _then(_CitySearchState(
getAllCitiesLoading: null == getAllCitiesLoading ? _self.getAllCitiesLoading : getAllCitiesLoading // ignore: cast_nullable_to_non_nullable
as bool,getAllCitiesSuccess: null == getAllCitiesSuccess ? _self.getAllCitiesSuccess : getAllCitiesSuccess // ignore: cast_nullable_to_non_nullable
as bool,getAllCitiesErrorMessage: null == getAllCitiesErrorMessage ? _self.getAllCitiesErrorMessage : getAllCitiesErrorMessage // ignore: cast_nullable_to_non_nullable
as String,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,searchCityLoading: null == searchCityLoading ? _self.searchCityLoading : searchCityLoading // ignore: cast_nullable_to_non_nullable
as bool,searchCitySuccess: null == searchCitySuccess ? _self.searchCitySuccess : searchCitySuccess // ignore: cast_nullable_to_non_nullable
as bool,searchCityErrorMessage: null == searchCityErrorMessage ? _self.searchCityErrorMessage : searchCityErrorMessage // ignore: cast_nullable_to_non_nullable
as String,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<CityModel>,
  ));
}


}

// dart format on
