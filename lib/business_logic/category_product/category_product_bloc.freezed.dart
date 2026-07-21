// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryProductEvent()';
}


}

/// @nodoc
class $CategoryProductEventCopyWith<$Res>  {
$CategoryProductEventCopyWith(CategoryProductEvent _, $Res Function(CategoryProductEvent) __);
}


/// Adds pattern-matching-related methods to [CategoryProductEvent].
extension CategoryProductEventPatterns on CategoryProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _StartedCategory value)?  startedCategory,TResult Function( _Search value)?  search,TResult Function( _AdLog value)?  adLog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _StartedCategory() when startedCategory != null:
return startedCategory(_that);case _Search() when search != null:
return search(_that);case _AdLog() when adLog != null:
return adLog(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _StartedCategory value)  startedCategory,required TResult Function( _Search value)  search,required TResult Function( _AdLog value)  adLog,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _StartedCategory():
return startedCategory(_that);case _Search():
return search(_that);case _AdLog():
return adLog(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _StartedCategory value)?  startedCategory,TResult? Function( _Search value)?  search,TResult? Function( _AdLog value)?  adLog,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _StartedCategory() when startedCategory != null:
return startedCategory(_that);case _Search() when search != null:
return search(_that);case _AdLog() when adLog != null:
return adLog(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  started,TResult Function()?  startedCategory,TResult Function( String val)?  search,TResult Function( ProductData id,  Map<String, double> coordinates)?  adLog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.id);case _StartedCategory() when startedCategory != null:
return startedCategory();case _Search() when search != null:
return search(_that.val);case _AdLog() when adLog != null:
return adLog(_that.id,_that.coordinates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  started,required TResult Function()  startedCategory,required TResult Function( String val)  search,required TResult Function( ProductData id,  Map<String, double> coordinates)  adLog,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.id);case _StartedCategory():
return startedCategory();case _Search():
return search(_that.val);case _AdLog():
return adLog(_that.id,_that.coordinates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  started,TResult? Function()?  startedCategory,TResult? Function( String val)?  search,TResult? Function( ProductData id,  Map<String, double> coordinates)?  adLog,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.id);case _StartedCategory() when startedCategory != null:
return startedCategory();case _Search() when search != null:
return search(_that.val);case _AdLog() when adLog != null:
return adLog(_that.id,_that.coordinates);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CategoryProductEvent {
  const _Started(this.id);
  

 final  int id;

/// Create a copy of CategoryProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'CategoryProductEvent.started(id: $id)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $CategoryProductEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of CategoryProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Started(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _StartedCategory implements CategoryProductEvent {
  const _StartedCategory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartedCategory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryProductEvent.startedCategory()';
}


}




/// @nodoc


class _Search implements CategoryProductEvent {
  const _Search(this.val);
  

 final  String val;

/// Create a copy of CategoryProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCopyWith<_Search> get copyWith => __$SearchCopyWithImpl<_Search>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'CategoryProductEvent.search(val: $val)';
}


}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $CategoryProductEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) = __$SearchCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

/// Create a copy of CategoryProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_Search(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AdLog implements CategoryProductEvent {
  const _AdLog(this.id, final  Map<String, double> coordinates): _coordinates = coordinates;
  

 final  ProductData id;
 final  Map<String, double> _coordinates;
 Map<String, double> get coordinates {
  if (_coordinates is EqualUnmodifiableMapView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coordinates);
}


/// Create a copy of CategoryProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdLogCopyWith<_AdLog> get copyWith => __$AdLogCopyWithImpl<_AdLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdLog&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._coordinates, _coordinates));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_coordinates));

@override
String toString() {
  return 'CategoryProductEvent.adLog(id: $id, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$AdLogCopyWith<$Res> implements $CategoryProductEventCopyWith<$Res> {
  factory _$AdLogCopyWith(_AdLog value, $Res Function(_AdLog) _then) = __$AdLogCopyWithImpl;
@useResult
$Res call({
 ProductData id, Map<String, double> coordinates
});




}
/// @nodoc
class __$AdLogCopyWithImpl<$Res>
    implements _$AdLogCopyWith<$Res> {
  __$AdLogCopyWithImpl(this._self, this._then);

  final _AdLog _self;
  final $Res Function(_AdLog) _then;

/// Create a copy of CategoryProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coordinates = null,}) {
  return _then(_AdLog(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as ProductData,null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

/// @nodoc
mixin _$CategoryProductState {

 bool get isLoading; String? get errorMessage; List<ProductData> get data; List<ProductData> get products; String get search; List<Category> get category;
/// Create a copy of CategoryProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryProductStateCopyWith<CategoryProductState> get copyWith => _$CategoryProductStateCopyWithImpl<CategoryProductState>(this as CategoryProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProductState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other.category, category));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(products),search,const DeepCollectionEquality().hash(category));

@override
String toString() {
  return 'CategoryProductState(isLoading: $isLoading, errorMessage: $errorMessage, data: $data, products: $products, search: $search, category: $category)';
}


}

/// @nodoc
abstract mixin class $CategoryProductStateCopyWith<$Res>  {
  factory $CategoryProductStateCopyWith(CategoryProductState value, $Res Function(CategoryProductState) _then) = _$CategoryProductStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? errorMessage, List<ProductData> data, List<ProductData> products, String search, List<Category> category
});




}
/// @nodoc
class _$CategoryProductStateCopyWithImpl<$Res>
    implements $CategoryProductStateCopyWith<$Res> {
  _$CategoryProductStateCopyWithImpl(this._self, this._then);

  final CategoryProductState _self;
  final $Res Function(CategoryProductState) _then;

/// Create a copy of CategoryProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? data = null,Object? products = null,Object? search = null,Object? category = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProductData>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductData>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as List<Category>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryProductState].
extension CategoryProductStatePatterns on CategoryProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryProductState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryProductState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  List<ProductData> data,  List<ProductData> products,  String search,  List<Category> category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryProductState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.data,_that.products,_that.search,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  List<ProductData> data,  List<ProductData> products,  String search,  List<Category> category)  $default,) {final _that = this;
switch (_that) {
case _CategoryProductState():
return $default(_that.isLoading,_that.errorMessage,_that.data,_that.products,_that.search,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? errorMessage,  List<ProductData> data,  List<ProductData> products,  String search,  List<Category> category)?  $default,) {final _that = this;
switch (_that) {
case _CategoryProductState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.data,_that.products,_that.search,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryProductState implements CategoryProductState {
  const _CategoryProductState({required this.isLoading, required this.errorMessage, required final  List<ProductData> data, required final  List<ProductData> products, required this.search, required final  List<Category> category}): _data = data,_products = products,_category = category;
  

@override final  bool isLoading;
@override final  String? errorMessage;
 final  List<ProductData> _data;
@override List<ProductData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

 final  List<ProductData> _products;
@override List<ProductData> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  String search;
 final  List<Category> _category;
@override List<Category> get category {
  if (_category is EqualUnmodifiableListView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_category);
}


/// Create a copy of CategoryProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryProductStateCopyWith<_CategoryProductState> get copyWith => __$CategoryProductStateCopyWithImpl<_CategoryProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryProductState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._data, _data)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other._category, _category));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,const DeepCollectionEquality().hash(_data),const DeepCollectionEquality().hash(_products),search,const DeepCollectionEquality().hash(_category));

@override
String toString() {
  return 'CategoryProductState(isLoading: $isLoading, errorMessage: $errorMessage, data: $data, products: $products, search: $search, category: $category)';
}


}

/// @nodoc
abstract mixin class _$CategoryProductStateCopyWith<$Res> implements $CategoryProductStateCopyWith<$Res> {
  factory _$CategoryProductStateCopyWith(_CategoryProductState value, $Res Function(_CategoryProductState) _then) = __$CategoryProductStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? errorMessage, List<ProductData> data, List<ProductData> products, String search, List<Category> category
});




}
/// @nodoc
class __$CategoryProductStateCopyWithImpl<$Res>
    implements _$CategoryProductStateCopyWith<$Res> {
  __$CategoryProductStateCopyWithImpl(this._self, this._then);

  final _CategoryProductState _self;
  final $Res Function(_CategoryProductState) _then;

/// Create a copy of CategoryProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? data = null,Object? products = null,Object? search = null,Object? category = null,}) {
  return _then(_CategoryProductState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProductData>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductData>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as List<Category>,
  ));
}


}

// dart format on
