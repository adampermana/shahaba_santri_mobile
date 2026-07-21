// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductSearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductSearchEvent()';
}


}

/// @nodoc
class $ProductSearchEventCopyWith<$Res>  {
$ProductSearchEventCopyWith(ProductSearchEvent _, $Res Function(ProductSearchEvent) __);
}


/// Adds pattern-matching-related methods to [ProductSearchEvent].
extension ProductSearchEventPatterns on ProductSearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Search value)?  search,TResult Function( _LoadingClick value)?  loadingClick,TResult Function( _AdLog value)?  adLog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Search() when search != null:
return search(_that);case _LoadingClick() when loadingClick != null:
return loadingClick(_that);case _AdLog() when adLog != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Search value)  search,required TResult Function( _LoadingClick value)  loadingClick,required TResult Function( _AdLog value)  adLog,}){
final _that = this;
switch (_that) {
case _Search():
return search(_that);case _LoadingClick():
return loadingClick(_that);case _AdLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Search value)?  search,TResult? Function( _LoadingClick value)?  loadingClick,TResult? Function( _AdLog value)?  adLog,}){
final _that = this;
switch (_that) {
case _Search() when search != null:
return search(_that);case _LoadingClick() when loadingClick != null:
return loadingClick(_that);case _AdLog() when adLog != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String val)?  search,TResult Function()?  loadingClick,TResult Function( int index,  String type,  ProductData item,  Map<String, double> coordinates)?  adLog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Search() when search != null:
return search(_that.val);case _LoadingClick() when loadingClick != null:
return loadingClick();case _AdLog() when adLog != null:
return adLog(_that.index,_that.type,_that.item,_that.coordinates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String val)  search,required TResult Function()  loadingClick,required TResult Function( int index,  String type,  ProductData item,  Map<String, double> coordinates)  adLog,}) {final _that = this;
switch (_that) {
case _Search():
return search(_that.val);case _LoadingClick():
return loadingClick();case _AdLog():
return adLog(_that.index,_that.type,_that.item,_that.coordinates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String val)?  search,TResult? Function()?  loadingClick,TResult? Function( int index,  String type,  ProductData item,  Map<String, double> coordinates)?  adLog,}) {final _that = this;
switch (_that) {
case _Search() when search != null:
return search(_that.val);case _LoadingClick() when loadingClick != null:
return loadingClick();case _AdLog() when adLog != null:
return adLog(_that.index,_that.type,_that.item,_that.coordinates);case _:
  return null;

}
}

}

/// @nodoc


class _Search implements ProductSearchEvent {
  const _Search(this.val);
  

 final  String val;

/// Create a copy of ProductSearchEvent
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
  return 'ProductSearchEvent.search(val: $val)';
}


}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $ProductSearchEventCopyWith<$Res> {
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

/// Create a copy of ProductSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_Search(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadingClick implements ProductSearchEvent {
  const _LoadingClick();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingClick);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductSearchEvent.loadingClick()';
}


}




/// @nodoc


class _AdLog implements ProductSearchEvent {
  const _AdLog(this.index, this.type, this.item, final  Map<String, double> coordinates): _coordinates = coordinates;
  

 final  int index;
 final  String type;
 final  ProductData item;
 final  Map<String, double> _coordinates;
 Map<String, double> get coordinates {
  if (_coordinates is EqualUnmodifiableMapView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coordinates);
}


/// Create a copy of ProductSearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdLogCopyWith<_AdLog> get copyWith => __$AdLogCopyWithImpl<_AdLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdLog&&(identical(other.index, index) || other.index == index)&&(identical(other.type, type) || other.type == type)&&(identical(other.item, item) || other.item == item)&&const DeepCollectionEquality().equals(other._coordinates, _coordinates));
}


@override
int get hashCode => Object.hash(runtimeType,index,type,item,const DeepCollectionEquality().hash(_coordinates));

@override
String toString() {
  return 'ProductSearchEvent.adLog(index: $index, type: $type, item: $item, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$AdLogCopyWith<$Res> implements $ProductSearchEventCopyWith<$Res> {
  factory _$AdLogCopyWith(_AdLog value, $Res Function(_AdLog) _then) = __$AdLogCopyWithImpl;
@useResult
$Res call({
 int index, String type, ProductData item, Map<String, double> coordinates
});




}
/// @nodoc
class __$AdLogCopyWithImpl<$Res>
    implements _$AdLogCopyWith<$Res> {
  __$AdLogCopyWithImpl(this._self, this._then);

  final _AdLog _self;
  final $Res Function(_AdLog) _then;

/// Create a copy of ProductSearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,Object? type = null,Object? item = null,Object? coordinates = null,}) {
  return _then(_AdLog(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ProductData,null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

/// @nodoc
mixin _$ProductSearchState {

 List<ProductData> get products; ProductData? get selectedProducts; bool get isLoading; bool get isLoadingClick; String? get errorMessage; String get search;
/// Create a copy of ProductSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSearchStateCopyWith<ProductSearchState> get copyWith => _$ProductSearchStateCopyWithImpl<ProductSearchState>(this as ProductSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSearchState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.selectedProducts, selectedProducts) || other.selectedProducts == selectedProducts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingClick, isLoadingClick) || other.isLoadingClick == isLoadingClick)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),selectedProducts,isLoading,isLoadingClick,errorMessage,search);

@override
String toString() {
  return 'ProductSearchState(products: $products, selectedProducts: $selectedProducts, isLoading: $isLoading, isLoadingClick: $isLoadingClick, errorMessage: $errorMessage, search: $search)';
}


}

/// @nodoc
abstract mixin class $ProductSearchStateCopyWith<$Res>  {
  factory $ProductSearchStateCopyWith(ProductSearchState value, $Res Function(ProductSearchState) _then) = _$ProductSearchStateCopyWithImpl;
@useResult
$Res call({
 List<ProductData> products, ProductData? selectedProducts, bool isLoading, bool isLoadingClick, String? errorMessage, String search
});




}
/// @nodoc
class _$ProductSearchStateCopyWithImpl<$Res>
    implements $ProductSearchStateCopyWith<$Res> {
  _$ProductSearchStateCopyWithImpl(this._self, this._then);

  final ProductSearchState _self;
  final $Res Function(ProductSearchState) _then;

/// Create a copy of ProductSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? selectedProducts = freezed,Object? isLoading = null,Object? isLoadingClick = null,Object? errorMessage = freezed,Object? search = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductData>,selectedProducts: freezed == selectedProducts ? _self.selectedProducts : selectedProducts // ignore: cast_nullable_to_non_nullable
as ProductData?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingClick: null == isLoadingClick ? _self.isLoadingClick : isLoadingClick // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSearchState].
extension ProductSearchStatePatterns on ProductSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSearchState value)  $default,){
final _that = this;
switch (_that) {
case _ProductSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductData> products,  ProductData? selectedProducts,  bool isLoading,  bool isLoadingClick,  String? errorMessage,  String search)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSearchState() when $default != null:
return $default(_that.products,_that.selectedProducts,_that.isLoading,_that.isLoadingClick,_that.errorMessage,_that.search);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductData> products,  ProductData? selectedProducts,  bool isLoading,  bool isLoadingClick,  String? errorMessage,  String search)  $default,) {final _that = this;
switch (_that) {
case _ProductSearchState():
return $default(_that.products,_that.selectedProducts,_that.isLoading,_that.isLoadingClick,_that.errorMessage,_that.search);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductData> products,  ProductData? selectedProducts,  bool isLoading,  bool isLoadingClick,  String? errorMessage,  String search)?  $default,) {final _that = this;
switch (_that) {
case _ProductSearchState() when $default != null:
return $default(_that.products,_that.selectedProducts,_that.isLoading,_that.isLoadingClick,_that.errorMessage,_that.search);case _:
  return null;

}
}

}

/// @nodoc


class _ProductSearchState implements ProductSearchState {
  const _ProductSearchState({required final  List<ProductData> products, required this.selectedProducts, required this.isLoading, required this.isLoadingClick, required this.errorMessage, required this.search}): _products = products;
  

 final  List<ProductData> _products;
@override List<ProductData> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  ProductData? selectedProducts;
@override final  bool isLoading;
@override final  bool isLoadingClick;
@override final  String? errorMessage;
@override final  String search;

/// Create a copy of ProductSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSearchStateCopyWith<_ProductSearchState> get copyWith => __$ProductSearchStateCopyWithImpl<_ProductSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSearchState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.selectedProducts, selectedProducts) || other.selectedProducts == selectedProducts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingClick, isLoadingClick) || other.isLoadingClick == isLoadingClick)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),selectedProducts,isLoading,isLoadingClick,errorMessage,search);

@override
String toString() {
  return 'ProductSearchState(products: $products, selectedProducts: $selectedProducts, isLoading: $isLoading, isLoadingClick: $isLoadingClick, errorMessage: $errorMessage, search: $search)';
}


}

/// @nodoc
abstract mixin class _$ProductSearchStateCopyWith<$Res> implements $ProductSearchStateCopyWith<$Res> {
  factory _$ProductSearchStateCopyWith(_ProductSearchState value, $Res Function(_ProductSearchState) _then) = __$ProductSearchStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductData> products, ProductData? selectedProducts, bool isLoading, bool isLoadingClick, String? errorMessage, String search
});




}
/// @nodoc
class __$ProductSearchStateCopyWithImpl<$Res>
    implements _$ProductSearchStateCopyWith<$Res> {
  __$ProductSearchStateCopyWithImpl(this._self, this._then);

  final _ProductSearchState _self;
  final $Res Function(_ProductSearchState) _then;

/// Create a copy of ProductSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? selectedProducts = freezed,Object? isLoading = null,Object? isLoadingClick = null,Object? errorMessage = freezed,Object? search = null,}) {
  return _then(_ProductSearchState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductData>,selectedProducts: freezed == selectedProducts ? _self.selectedProducts : selectedProducts // ignore: cast_nullable_to_non_nullable
as ProductData?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingClick: null == isLoadingClick ? _self.isLoadingClick : isLoadingClick // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
