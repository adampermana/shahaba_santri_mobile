// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _StartLoading value)?  startLoading,TResult Function( _StopLoading value)?  stopLoading,TResult Function( _StartSaveLoading value)?  startSaveLoading,TResult Function( _SearchImage value)?  searchImage,TResult Function( _AddLocalData value)?  addLocalData,TResult Function( _LogAd value)?  logAd,TResult Function( _FilterData value)?  filterData,TResult Function( _GetHistoryProductLimit value)?  getHistoryProductLimit,TResult Function( _GetProductMultiple value)?  getProductMultiple,TResult Function( _GetProductLimitMultiple value)?  getProductLimitMultiple,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _StartLoading() when startLoading != null:
return startLoading(_that);case _StopLoading() when stopLoading != null:
return stopLoading(_that);case _StartSaveLoading() when startSaveLoading != null:
return startSaveLoading(_that);case _SearchImage() when searchImage != null:
return searchImage(_that);case _AddLocalData() when addLocalData != null:
return addLocalData(_that);case _LogAd() when logAd != null:
return logAd(_that);case _FilterData() when filterData != null:
return filterData(_that);case _GetHistoryProductLimit() when getHistoryProductLimit != null:
return getHistoryProductLimit(_that);case _GetProductMultiple() when getProductMultiple != null:
return getProductMultiple(_that);case _GetProductLimitMultiple() when getProductLimitMultiple != null:
return getProductLimitMultiple(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _StartLoading value)  startLoading,required TResult Function( _StopLoading value)  stopLoading,required TResult Function( _StartSaveLoading value)  startSaveLoading,required TResult Function( _SearchImage value)  searchImage,required TResult Function( _AddLocalData value)  addLocalData,required TResult Function( _LogAd value)  logAd,required TResult Function( _FilterData value)  filterData,required TResult Function( _GetHistoryProductLimit value)  getHistoryProductLimit,required TResult Function( _GetProductMultiple value)  getProductMultiple,required TResult Function( _GetProductLimitMultiple value)  getProductLimitMultiple,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _StartLoading():
return startLoading(_that);case _StopLoading():
return stopLoading(_that);case _StartSaveLoading():
return startSaveLoading(_that);case _SearchImage():
return searchImage(_that);case _AddLocalData():
return addLocalData(_that);case _LogAd():
return logAd(_that);case _FilterData():
return filterData(_that);case _GetHistoryProductLimit():
return getHistoryProductLimit(_that);case _GetProductMultiple():
return getProductMultiple(_that);case _GetProductLimitMultiple():
return getProductLimitMultiple(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _StartLoading value)?  startLoading,TResult? Function( _StopLoading value)?  stopLoading,TResult? Function( _StartSaveLoading value)?  startSaveLoading,TResult? Function( _SearchImage value)?  searchImage,TResult? Function( _AddLocalData value)?  addLocalData,TResult? Function( _LogAd value)?  logAd,TResult? Function( _FilterData value)?  filterData,TResult? Function( _GetHistoryProductLimit value)?  getHistoryProductLimit,TResult? Function( _GetProductMultiple value)?  getProductMultiple,TResult? Function( _GetProductLimitMultiple value)?  getProductLimitMultiple,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _StartLoading() when startLoading != null:
return startLoading(_that);case _StopLoading() when stopLoading != null:
return stopLoading(_that);case _StartSaveLoading() when startSaveLoading != null:
return startSaveLoading(_that);case _SearchImage() when searchImage != null:
return searchImage(_that);case _AddLocalData() when addLocalData != null:
return addLocalData(_that);case _LogAd() when logAd != null:
return logAd(_that);case _FilterData() when filterData != null:
return filterData(_that);case _GetHistoryProductLimit() when getHistoryProductLimit != null:
return getHistoryProductLimit(_that);case _GetProductMultiple() when getProductMultiple != null:
return getProductMultiple(_that);case _GetProductLimitMultiple() when getProductLimitMultiple != null:
return getProductLimitMultiple(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  startLoading,TResult Function()?  stopLoading,TResult Function( ProductData val)?  startSaveLoading,TResult Function( String imagePath,  Map<String, double> coordinates)?  searchImage,TResult Function( ProductData val,  bool isLoading,  Map<String, double> coordinates)?  addLocalData,TResult Function( int productId,  int campaignId,  int creativeId,  Map<String, double> coordinates,  String type)?  logAd,TResult Function( String val)?  filterData,TResult Function( int userId)?  getHistoryProductLimit,TResult Function( int userId,  String? ids,  String? search,  int? produsenId,  int? brandId,  int? categoryId,  int page,  int pageSize)?  getProductMultiple,TResult Function( int userId,  String? ids,  String? search,  int? produsenId,  int? brandId,  int? categoryId,  int page,  int pageSize)?  getProductLimitMultiple,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _StartLoading() when startLoading != null:
return startLoading();case _StopLoading() when stopLoading != null:
return stopLoading();case _StartSaveLoading() when startSaveLoading != null:
return startSaveLoading(_that.val);case _SearchImage() when searchImage != null:
return searchImage(_that.imagePath,_that.coordinates);case _AddLocalData() when addLocalData != null:
return addLocalData(_that.val,_that.isLoading,_that.coordinates);case _LogAd() when logAd != null:
return logAd(_that.productId,_that.campaignId,_that.creativeId,_that.coordinates,_that.type);case _FilterData() when filterData != null:
return filterData(_that.val);case _GetHistoryProductLimit() when getHistoryProductLimit != null:
return getHistoryProductLimit(_that.userId);case _GetProductMultiple() when getProductMultiple != null:
return getProductMultiple(_that.userId,_that.ids,_that.search,_that.produsenId,_that.brandId,_that.categoryId,_that.page,_that.pageSize);case _GetProductLimitMultiple() when getProductLimitMultiple != null:
return getProductLimitMultiple(_that.userId,_that.ids,_that.search,_that.produsenId,_that.brandId,_that.categoryId,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  startLoading,required TResult Function()  stopLoading,required TResult Function( ProductData val)  startSaveLoading,required TResult Function( String imagePath,  Map<String, double> coordinates)  searchImage,required TResult Function( ProductData val,  bool isLoading,  Map<String, double> coordinates)  addLocalData,required TResult Function( int productId,  int campaignId,  int creativeId,  Map<String, double> coordinates,  String type)  logAd,required TResult Function( String val)  filterData,required TResult Function( int userId)  getHistoryProductLimit,required TResult Function( int userId,  String? ids,  String? search,  int? produsenId,  int? brandId,  int? categoryId,  int page,  int pageSize)  getProductMultiple,required TResult Function( int userId,  String? ids,  String? search,  int? produsenId,  int? brandId,  int? categoryId,  int page,  int pageSize)  getProductLimitMultiple,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _StartLoading():
return startLoading();case _StopLoading():
return stopLoading();case _StartSaveLoading():
return startSaveLoading(_that.val);case _SearchImage():
return searchImage(_that.imagePath,_that.coordinates);case _AddLocalData():
return addLocalData(_that.val,_that.isLoading,_that.coordinates);case _LogAd():
return logAd(_that.productId,_that.campaignId,_that.creativeId,_that.coordinates,_that.type);case _FilterData():
return filterData(_that.val);case _GetHistoryProductLimit():
return getHistoryProductLimit(_that.userId);case _GetProductMultiple():
return getProductMultiple(_that.userId,_that.ids,_that.search,_that.produsenId,_that.brandId,_that.categoryId,_that.page,_that.pageSize);case _GetProductLimitMultiple():
return getProductLimitMultiple(_that.userId,_that.ids,_that.search,_that.produsenId,_that.brandId,_that.categoryId,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  startLoading,TResult? Function()?  stopLoading,TResult? Function( ProductData val)?  startSaveLoading,TResult? Function( String imagePath,  Map<String, double> coordinates)?  searchImage,TResult? Function( ProductData val,  bool isLoading,  Map<String, double> coordinates)?  addLocalData,TResult? Function( int productId,  int campaignId,  int creativeId,  Map<String, double> coordinates,  String type)?  logAd,TResult? Function( String val)?  filterData,TResult? Function( int userId)?  getHistoryProductLimit,TResult? Function( int userId,  String? ids,  String? search,  int? produsenId,  int? brandId,  int? categoryId,  int page,  int pageSize)?  getProductMultiple,TResult? Function( int userId,  String? ids,  String? search,  int? produsenId,  int? brandId,  int? categoryId,  int page,  int pageSize)?  getProductLimitMultiple,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _StartLoading() when startLoading != null:
return startLoading();case _StopLoading() when stopLoading != null:
return stopLoading();case _StartSaveLoading() when startSaveLoading != null:
return startSaveLoading(_that.val);case _SearchImage() when searchImage != null:
return searchImage(_that.imagePath,_that.coordinates);case _AddLocalData() when addLocalData != null:
return addLocalData(_that.val,_that.isLoading,_that.coordinates);case _LogAd() when logAd != null:
return logAd(_that.productId,_that.campaignId,_that.creativeId,_that.coordinates,_that.type);case _FilterData() when filterData != null:
return filterData(_that.val);case _GetHistoryProductLimit() when getHistoryProductLimit != null:
return getHistoryProductLimit(_that.userId);case _GetProductMultiple() when getProductMultiple != null:
return getProductMultiple(_that.userId,_that.ids,_that.search,_that.produsenId,_that.brandId,_that.categoryId,_that.page,_that.pageSize);case _GetProductLimitMultiple() when getProductLimitMultiple != null:
return getProductLimitMultiple(_that.userId,_that.ids,_that.search,_that.produsenId,_that.brandId,_that.categoryId,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ProductEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.started()';
}


}




/// @nodoc


class _StartLoading implements ProductEvent {
  const _StartLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.startLoading()';
}


}




/// @nodoc


class _StopLoading implements ProductEvent {
  const _StopLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.stopLoading()';
}


}




/// @nodoc


class _StartSaveLoading implements ProductEvent {
  const _StartSaveLoading(this.val);
  

 final  ProductData val;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartSaveLoadingCopyWith<_StartSaveLoading> get copyWith => __$StartSaveLoadingCopyWithImpl<_StartSaveLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartSaveLoading&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'ProductEvent.startSaveLoading(val: $val)';
}


}

/// @nodoc
abstract mixin class _$StartSaveLoadingCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$StartSaveLoadingCopyWith(_StartSaveLoading value, $Res Function(_StartSaveLoading) _then) = __$StartSaveLoadingCopyWithImpl;
@useResult
$Res call({
 ProductData val
});




}
/// @nodoc
class __$StartSaveLoadingCopyWithImpl<$Res>
    implements _$StartSaveLoadingCopyWith<$Res> {
  __$StartSaveLoadingCopyWithImpl(this._self, this._then);

  final _StartSaveLoading _self;
  final $Res Function(_StartSaveLoading) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_StartSaveLoading(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as ProductData,
  ));
}


}

/// @nodoc


class _SearchImage implements ProductEvent {
  const _SearchImage(this.imagePath, final  Map<String, double> coordinates): _coordinates = coordinates;
  

 final  String imagePath;
 final  Map<String, double> _coordinates;
 Map<String, double> get coordinates {
  if (_coordinates is EqualUnmodifiableMapView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coordinates);
}


/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchImageCopyWith<_SearchImage> get copyWith => __$SearchImageCopyWithImpl<_SearchImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchImage&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&const DeepCollectionEquality().equals(other._coordinates, _coordinates));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath,const DeepCollectionEquality().hash(_coordinates));

@override
String toString() {
  return 'ProductEvent.searchImage(imagePath: $imagePath, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$SearchImageCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$SearchImageCopyWith(_SearchImage value, $Res Function(_SearchImage) _then) = __$SearchImageCopyWithImpl;
@useResult
$Res call({
 String imagePath, Map<String, double> coordinates
});




}
/// @nodoc
class __$SearchImageCopyWithImpl<$Res>
    implements _$SearchImageCopyWith<$Res> {
  __$SearchImageCopyWithImpl(this._self, this._then);

  final _SearchImage _self;
  final $Res Function(_SearchImage) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? coordinates = null,}) {
  return _then(_SearchImage(
null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

/// @nodoc


class _AddLocalData implements ProductEvent {
  const _AddLocalData(this.val, {required this.isLoading, required final  Map<String, double> coordinates}): _coordinates = coordinates;
  

 final  ProductData val;
 final  bool isLoading;
 final  Map<String, double> _coordinates;
 Map<String, double> get coordinates {
  if (_coordinates is EqualUnmodifiableMapView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coordinates);
}


/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddLocalDataCopyWith<_AddLocalData> get copyWith => __$AddLocalDataCopyWithImpl<_AddLocalData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddLocalData&&(identical(other.val, val) || other.val == val)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._coordinates, _coordinates));
}


@override
int get hashCode => Object.hash(runtimeType,val,isLoading,const DeepCollectionEquality().hash(_coordinates));

@override
String toString() {
  return 'ProductEvent.addLocalData(val: $val, isLoading: $isLoading, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$AddLocalDataCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$AddLocalDataCopyWith(_AddLocalData value, $Res Function(_AddLocalData) _then) = __$AddLocalDataCopyWithImpl;
@useResult
$Res call({
 ProductData val, bool isLoading, Map<String, double> coordinates
});




}
/// @nodoc
class __$AddLocalDataCopyWithImpl<$Res>
    implements _$AddLocalDataCopyWith<$Res> {
  __$AddLocalDataCopyWithImpl(this._self, this._then);

  final _AddLocalData _self;
  final $Res Function(_AddLocalData) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,Object? isLoading = null,Object? coordinates = null,}) {
  return _then(_AddLocalData(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as ProductData,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,coordinates: null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

/// @nodoc


class _LogAd implements ProductEvent {
  const _LogAd(this.productId, this.campaignId, this.creativeId, final  Map<String, double> coordinates, this.type): _coordinates = coordinates;
  

 final  int productId;
 final  int campaignId;
 final  int creativeId;
 final  Map<String, double> _coordinates;
 Map<String, double> get coordinates {
  if (_coordinates is EqualUnmodifiableMapView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coordinates);
}

 final  String type;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogAdCopyWith<_LogAd> get copyWith => __$LogAdCopyWithImpl<_LogAd>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogAd&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.campaignId, campaignId) || other.campaignId == campaignId)&&(identical(other.creativeId, creativeId) || other.creativeId == creativeId)&&const DeepCollectionEquality().equals(other._coordinates, _coordinates)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,productId,campaignId,creativeId,const DeepCollectionEquality().hash(_coordinates),type);

@override
String toString() {
  return 'ProductEvent.logAd(productId: $productId, campaignId: $campaignId, creativeId: $creativeId, coordinates: $coordinates, type: $type)';
}


}

/// @nodoc
abstract mixin class _$LogAdCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$LogAdCopyWith(_LogAd value, $Res Function(_LogAd) _then) = __$LogAdCopyWithImpl;
@useResult
$Res call({
 int productId, int campaignId, int creativeId, Map<String, double> coordinates, String type
});




}
/// @nodoc
class __$LogAdCopyWithImpl<$Res>
    implements _$LogAdCopyWith<$Res> {
  __$LogAdCopyWithImpl(this._self, this._then);

  final _LogAd _self;
  final $Res Function(_LogAd) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? campaignId = null,Object? creativeId = null,Object? coordinates = null,Object? type = null,}) {
  return _then(_LogAd(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,null == campaignId ? _self.campaignId : campaignId // ignore: cast_nullable_to_non_nullable
as int,null == creativeId ? _self.creativeId : creativeId // ignore: cast_nullable_to_non_nullable
as int,null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FilterData implements ProductEvent {
  const _FilterData(this.val);
  

 final  String val;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterDataCopyWith<_FilterData> get copyWith => __$FilterDataCopyWithImpl<_FilterData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterData&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'ProductEvent.filterData(val: $val)';
}


}

/// @nodoc
abstract mixin class _$FilterDataCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$FilterDataCopyWith(_FilterData value, $Res Function(_FilterData) _then) = __$FilterDataCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$FilterDataCopyWithImpl<$Res>
    implements _$FilterDataCopyWith<$Res> {
  __$FilterDataCopyWithImpl(this._self, this._then);

  final _FilterData _self;
  final $Res Function(_FilterData) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_FilterData(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GetHistoryProductLimit implements ProductEvent {
  const _GetHistoryProductLimit({required this.userId});
  

 final  int userId;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetHistoryProductLimitCopyWith<_GetHistoryProductLimit> get copyWith => __$GetHistoryProductLimitCopyWithImpl<_GetHistoryProductLimit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHistoryProductLimit&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ProductEvent.getHistoryProductLimit(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$GetHistoryProductLimitCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$GetHistoryProductLimitCopyWith(_GetHistoryProductLimit value, $Res Function(_GetHistoryProductLimit) _then) = __$GetHistoryProductLimitCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class __$GetHistoryProductLimitCopyWithImpl<$Res>
    implements _$GetHistoryProductLimitCopyWith<$Res> {
  __$GetHistoryProductLimitCopyWithImpl(this._self, this._then);

  final _GetHistoryProductLimit _self;
  final $Res Function(_GetHistoryProductLimit) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_GetHistoryProductLimit(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GetProductMultiple implements ProductEvent {
  const _GetProductMultiple({required this.userId, this.ids, this.search, this.produsenId, this.brandId, this.categoryId, this.page = 1, this.pageSize = 10});
  

 final  int userId;
 final  String? ids;
 final  String? search;
 final  int? produsenId;
 final  int? brandId;
 final  int? categoryId;
@JsonKey() final  int page;
@JsonKey() final  int pageSize;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetProductMultipleCopyWith<_GetProductMultiple> get copyWith => __$GetProductMultipleCopyWithImpl<_GetProductMultiple>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProductMultiple&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ids, ids) || other.ids == ids)&&(identical(other.search, search) || other.search == search)&&(identical(other.produsenId, produsenId) || other.produsenId == produsenId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,userId,ids,search,produsenId,brandId,categoryId,page,pageSize);

@override
String toString() {
  return 'ProductEvent.getProductMultiple(userId: $userId, ids: $ids, search: $search, produsenId: $produsenId, brandId: $brandId, categoryId: $categoryId, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$GetProductMultipleCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$GetProductMultipleCopyWith(_GetProductMultiple value, $Res Function(_GetProductMultiple) _then) = __$GetProductMultipleCopyWithImpl;
@useResult
$Res call({
 int userId, String? ids, String? search, int? produsenId, int? brandId, int? categoryId, int page, int pageSize
});




}
/// @nodoc
class __$GetProductMultipleCopyWithImpl<$Res>
    implements _$GetProductMultipleCopyWith<$Res> {
  __$GetProductMultipleCopyWithImpl(this._self, this._then);

  final _GetProductMultiple _self;
  final $Res Function(_GetProductMultiple) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? ids = freezed,Object? search = freezed,Object? produsenId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_GetProductMultiple(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,ids: freezed == ids ? _self.ids : ids // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,produsenId: freezed == produsenId ? _self.produsenId : produsenId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GetProductLimitMultiple implements ProductEvent {
  const _GetProductLimitMultiple({required this.userId, this.ids, this.search, this.produsenId, this.brandId, this.categoryId, this.page = 1, this.pageSize = 10});
  

 final  int userId;
 final  String? ids;
 final  String? search;
 final  int? produsenId;
 final  int? brandId;
 final  int? categoryId;
@JsonKey() final  int page;
@JsonKey() final  int pageSize;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetProductLimitMultipleCopyWith<_GetProductLimitMultiple> get copyWith => __$GetProductLimitMultipleCopyWithImpl<_GetProductLimitMultiple>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProductLimitMultiple&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.ids, ids) || other.ids == ids)&&(identical(other.search, search) || other.search == search)&&(identical(other.produsenId, produsenId) || other.produsenId == produsenId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,userId,ids,search,produsenId,brandId,categoryId,page,pageSize);

@override
String toString() {
  return 'ProductEvent.getProductLimitMultiple(userId: $userId, ids: $ids, search: $search, produsenId: $produsenId, brandId: $brandId, categoryId: $categoryId, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$GetProductLimitMultipleCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$GetProductLimitMultipleCopyWith(_GetProductLimitMultiple value, $Res Function(_GetProductLimitMultiple) _then) = __$GetProductLimitMultipleCopyWithImpl;
@useResult
$Res call({
 int userId, String? ids, String? search, int? produsenId, int? brandId, int? categoryId, int page, int pageSize
});




}
/// @nodoc
class __$GetProductLimitMultipleCopyWithImpl<$Res>
    implements _$GetProductLimitMultipleCopyWith<$Res> {
  __$GetProductLimitMultipleCopyWithImpl(this._self, this._then);

  final _GetProductLimitMultiple _self;
  final $Res Function(_GetProductLimitMultiple) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? ids = freezed,Object? search = freezed,Object? produsenId = freezed,Object? brandId = freezed,Object? categoryId = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_GetProductLimitMultiple(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,ids: freezed == ids ? _self.ids : ids // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,produsenId: freezed == produsenId ? _self.produsenId : produsenId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProductState {

 List<ProductData> get data; bool get isLoading; bool get isLoadingSaveData; String get imagePath; ProductData? get tempProduct; bool get isCamera; List<AdResponseData> get adsCarousel; AdResponseData? get addSplash; List<ProductData> get masterDataHistory; List<ProductData> get dataHistory; bool get isSuccess; bool get isShowDialog; ProductBody? get productBody; List<FetchHistoryDataProductLimit> get historyProductLimit; bool get isLoadingHistoryProductLimit; List<ProductData> get productMultipleList; PaginationMeta? get paginationMeta; bool get isLoadingProductMultiple; String? get errorMessage;
/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductStateCopyWith<ProductState> get copyWith => _$ProductStateCopyWithImpl<ProductState>(this as ProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingSaveData, isLoadingSaveData) || other.isLoadingSaveData == isLoadingSaveData)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.tempProduct, tempProduct) || other.tempProduct == tempProduct)&&(identical(other.isCamera, isCamera) || other.isCamera == isCamera)&&const DeepCollectionEquality().equals(other.adsCarousel, adsCarousel)&&(identical(other.addSplash, addSplash) || other.addSplash == addSplash)&&const DeepCollectionEquality().equals(other.masterDataHistory, masterDataHistory)&&const DeepCollectionEquality().equals(other.dataHistory, dataHistory)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isShowDialog, isShowDialog) || other.isShowDialog == isShowDialog)&&(identical(other.productBody, productBody) || other.productBody == productBody)&&const DeepCollectionEquality().equals(other.historyProductLimit, historyProductLimit)&&(identical(other.isLoadingHistoryProductLimit, isLoadingHistoryProductLimit) || other.isLoadingHistoryProductLimit == isLoadingHistoryProductLimit)&&const DeepCollectionEquality().equals(other.productMultipleList, productMultipleList)&&(identical(other.paginationMeta, paginationMeta) || other.paginationMeta == paginationMeta)&&(identical(other.isLoadingProductMultiple, isLoadingProductMultiple) || other.isLoadingProductMultiple == isLoadingProductMultiple)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(data),isLoading,isLoadingSaveData,imagePath,tempProduct,isCamera,const DeepCollectionEquality().hash(adsCarousel),addSplash,const DeepCollectionEquality().hash(masterDataHistory),const DeepCollectionEquality().hash(dataHistory),isSuccess,isShowDialog,productBody,const DeepCollectionEquality().hash(historyProductLimit),isLoadingHistoryProductLimit,const DeepCollectionEquality().hash(productMultipleList),paginationMeta,isLoadingProductMultiple,errorMessage]);

@override
String toString() {
  return 'ProductState(data: $data, isLoading: $isLoading, isLoadingSaveData: $isLoadingSaveData, imagePath: $imagePath, tempProduct: $tempProduct, isCamera: $isCamera, adsCarousel: $adsCarousel, addSplash: $addSplash, masterDataHistory: $masterDataHistory, dataHistory: $dataHistory, isSuccess: $isSuccess, isShowDialog: $isShowDialog, productBody: $productBody, historyProductLimit: $historyProductLimit, isLoadingHistoryProductLimit: $isLoadingHistoryProductLimit, productMultipleList: $productMultipleList, paginationMeta: $paginationMeta, isLoadingProductMultiple: $isLoadingProductMultiple, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProductStateCopyWith<$Res>  {
  factory $ProductStateCopyWith(ProductState value, $Res Function(ProductState) _then) = _$ProductStateCopyWithImpl;
@useResult
$Res call({
 List<ProductData> data, bool isLoading, bool isLoadingSaveData, String imagePath, ProductData? tempProduct, bool isCamera, List<AdResponseData> adsCarousel, AdResponseData? addSplash, List<ProductData> masterDataHistory, List<ProductData> dataHistory, bool isSuccess, bool isShowDialog, ProductBody? productBody, List<FetchHistoryDataProductLimit> historyProductLimit, bool isLoadingHistoryProductLimit, List<ProductData> productMultipleList, PaginationMeta? paginationMeta, bool isLoadingProductMultiple, String? errorMessage
});


$ProductBodyCopyWith<$Res>? get productBody;

}
/// @nodoc
class _$ProductStateCopyWithImpl<$Res>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._self, this._then);

  final ProductState _self;
  final $Res Function(ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? isLoading = null,Object? isLoadingSaveData = null,Object? imagePath = null,Object? tempProduct = freezed,Object? isCamera = null,Object? adsCarousel = null,Object? addSplash = freezed,Object? masterDataHistory = null,Object? dataHistory = null,Object? isSuccess = null,Object? isShowDialog = null,Object? productBody = freezed,Object? historyProductLimit = null,Object? isLoadingHistoryProductLimit = null,Object? productMultipleList = null,Object? paginationMeta = freezed,Object? isLoadingProductMultiple = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProductData>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSaveData: null == isLoadingSaveData ? _self.isLoadingSaveData : isLoadingSaveData // ignore: cast_nullable_to_non_nullable
as bool,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,tempProduct: freezed == tempProduct ? _self.tempProduct : tempProduct // ignore: cast_nullable_to_non_nullable
as ProductData?,isCamera: null == isCamera ? _self.isCamera : isCamera // ignore: cast_nullable_to_non_nullable
as bool,adsCarousel: null == adsCarousel ? _self.adsCarousel : adsCarousel // ignore: cast_nullable_to_non_nullable
as List<AdResponseData>,addSplash: freezed == addSplash ? _self.addSplash : addSplash // ignore: cast_nullable_to_non_nullable
as AdResponseData?,masterDataHistory: null == masterDataHistory ? _self.masterDataHistory : masterDataHistory // ignore: cast_nullable_to_non_nullable
as List<ProductData>,dataHistory: null == dataHistory ? _self.dataHistory : dataHistory // ignore: cast_nullable_to_non_nullable
as List<ProductData>,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isShowDialog: null == isShowDialog ? _self.isShowDialog : isShowDialog // ignore: cast_nullable_to_non_nullable
as bool,productBody: freezed == productBody ? _self.productBody : productBody // ignore: cast_nullable_to_non_nullable
as ProductBody?,historyProductLimit: null == historyProductLimit ? _self.historyProductLimit : historyProductLimit // ignore: cast_nullable_to_non_nullable
as List<FetchHistoryDataProductLimit>,isLoadingHistoryProductLimit: null == isLoadingHistoryProductLimit ? _self.isLoadingHistoryProductLimit : isLoadingHistoryProductLimit // ignore: cast_nullable_to_non_nullable
as bool,productMultipleList: null == productMultipleList ? _self.productMultipleList : productMultipleList // ignore: cast_nullable_to_non_nullable
as List<ProductData>,paginationMeta: freezed == paginationMeta ? _self.paginationMeta : paginationMeta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,isLoadingProductMultiple: null == isLoadingProductMultiple ? _self.isLoadingProductMultiple : isLoadingProductMultiple // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductBodyCopyWith<$Res>? get productBody {
    if (_self.productBody == null) {
    return null;
  }

  return $ProductBodyCopyWith<$Res>(_self.productBody!, (value) {
    return _then(_self.copyWith(productBody: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductState value)  $default,){
final _that = this;
switch (_that) {
case _ProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductData> data,  bool isLoading,  bool isLoadingSaveData,  String imagePath,  ProductData? tempProduct,  bool isCamera,  List<AdResponseData> adsCarousel,  AdResponseData? addSplash,  List<ProductData> masterDataHistory,  List<ProductData> dataHistory,  bool isSuccess,  bool isShowDialog,  ProductBody? productBody,  List<FetchHistoryDataProductLimit> historyProductLimit,  bool isLoadingHistoryProductLimit,  List<ProductData> productMultipleList,  PaginationMeta? paginationMeta,  bool isLoadingProductMultiple,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that.data,_that.isLoading,_that.isLoadingSaveData,_that.imagePath,_that.tempProduct,_that.isCamera,_that.adsCarousel,_that.addSplash,_that.masterDataHistory,_that.dataHistory,_that.isSuccess,_that.isShowDialog,_that.productBody,_that.historyProductLimit,_that.isLoadingHistoryProductLimit,_that.productMultipleList,_that.paginationMeta,_that.isLoadingProductMultiple,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductData> data,  bool isLoading,  bool isLoadingSaveData,  String imagePath,  ProductData? tempProduct,  bool isCamera,  List<AdResponseData> adsCarousel,  AdResponseData? addSplash,  List<ProductData> masterDataHistory,  List<ProductData> dataHistory,  bool isSuccess,  bool isShowDialog,  ProductBody? productBody,  List<FetchHistoryDataProductLimit> historyProductLimit,  bool isLoadingHistoryProductLimit,  List<ProductData> productMultipleList,  PaginationMeta? paginationMeta,  bool isLoadingProductMultiple,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ProductState():
return $default(_that.data,_that.isLoading,_that.isLoadingSaveData,_that.imagePath,_that.tempProduct,_that.isCamera,_that.adsCarousel,_that.addSplash,_that.masterDataHistory,_that.dataHistory,_that.isSuccess,_that.isShowDialog,_that.productBody,_that.historyProductLimit,_that.isLoadingHistoryProductLimit,_that.productMultipleList,_that.paginationMeta,_that.isLoadingProductMultiple,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductData> data,  bool isLoading,  bool isLoadingSaveData,  String imagePath,  ProductData? tempProduct,  bool isCamera,  List<AdResponseData> adsCarousel,  AdResponseData? addSplash,  List<ProductData> masterDataHistory,  List<ProductData> dataHistory,  bool isSuccess,  bool isShowDialog,  ProductBody? productBody,  List<FetchHistoryDataProductLimit> historyProductLimit,  bool isLoadingHistoryProductLimit,  List<ProductData> productMultipleList,  PaginationMeta? paginationMeta,  bool isLoadingProductMultiple,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that.data,_that.isLoading,_that.isLoadingSaveData,_that.imagePath,_that.tempProduct,_that.isCamera,_that.adsCarousel,_that.addSplash,_that.masterDataHistory,_that.dataHistory,_that.isSuccess,_that.isShowDialog,_that.productBody,_that.historyProductLimit,_that.isLoadingHistoryProductLimit,_that.productMultipleList,_that.paginationMeta,_that.isLoadingProductMultiple,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ProductState implements ProductState {
  const _ProductState({required final  List<ProductData> data, required this.isLoading, required this.isLoadingSaveData, required this.imagePath, required this.tempProduct, required this.isCamera, required final  List<AdResponseData> adsCarousel, required this.addSplash, required final  List<ProductData> masterDataHistory, required final  List<ProductData> dataHistory, required this.isSuccess, required this.isShowDialog, required this.productBody, required final  List<FetchHistoryDataProductLimit> historyProductLimit, required this.isLoadingHistoryProductLimit, required final  List<ProductData> productMultipleList, required this.paginationMeta, required this.isLoadingProductMultiple, this.errorMessage}): _data = data,_adsCarousel = adsCarousel,_masterDataHistory = masterDataHistory,_dataHistory = dataHistory,_historyProductLimit = historyProductLimit,_productMultipleList = productMultipleList;
  

 final  List<ProductData> _data;
@override List<ProductData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  bool isLoading;
@override final  bool isLoadingSaveData;
@override final  String imagePath;
@override final  ProductData? tempProduct;
@override final  bool isCamera;
 final  List<AdResponseData> _adsCarousel;
@override List<AdResponseData> get adsCarousel {
  if (_adsCarousel is EqualUnmodifiableListView) return _adsCarousel;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_adsCarousel);
}

@override final  AdResponseData? addSplash;
 final  List<ProductData> _masterDataHistory;
@override List<ProductData> get masterDataHistory {
  if (_masterDataHistory is EqualUnmodifiableListView) return _masterDataHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_masterDataHistory);
}

 final  List<ProductData> _dataHistory;
@override List<ProductData> get dataHistory {
  if (_dataHistory is EqualUnmodifiableListView) return _dataHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataHistory);
}

@override final  bool isSuccess;
@override final  bool isShowDialog;
@override final  ProductBody? productBody;
 final  List<FetchHistoryDataProductLimit> _historyProductLimit;
@override List<FetchHistoryDataProductLimit> get historyProductLimit {
  if (_historyProductLimit is EqualUnmodifiableListView) return _historyProductLimit;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_historyProductLimit);
}

@override final  bool isLoadingHistoryProductLimit;
 final  List<ProductData> _productMultipleList;
@override List<ProductData> get productMultipleList {
  if (_productMultipleList is EqualUnmodifiableListView) return _productMultipleList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productMultipleList);
}

@override final  PaginationMeta? paginationMeta;
@override final  bool isLoadingProductMultiple;
@override final  String? errorMessage;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductStateCopyWith<_ProductState> get copyWith => __$ProductStateCopyWithImpl<_ProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductState&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingSaveData, isLoadingSaveData) || other.isLoadingSaveData == isLoadingSaveData)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.tempProduct, tempProduct) || other.tempProduct == tempProduct)&&(identical(other.isCamera, isCamera) || other.isCamera == isCamera)&&const DeepCollectionEquality().equals(other._adsCarousel, _adsCarousel)&&(identical(other.addSplash, addSplash) || other.addSplash == addSplash)&&const DeepCollectionEquality().equals(other._masterDataHistory, _masterDataHistory)&&const DeepCollectionEquality().equals(other._dataHistory, _dataHistory)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isShowDialog, isShowDialog) || other.isShowDialog == isShowDialog)&&(identical(other.productBody, productBody) || other.productBody == productBody)&&const DeepCollectionEquality().equals(other._historyProductLimit, _historyProductLimit)&&(identical(other.isLoadingHistoryProductLimit, isLoadingHistoryProductLimit) || other.isLoadingHistoryProductLimit == isLoadingHistoryProductLimit)&&const DeepCollectionEquality().equals(other._productMultipleList, _productMultipleList)&&(identical(other.paginationMeta, paginationMeta) || other.paginationMeta == paginationMeta)&&(identical(other.isLoadingProductMultiple, isLoadingProductMultiple) || other.isLoadingProductMultiple == isLoadingProductMultiple)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(_data),isLoading,isLoadingSaveData,imagePath,tempProduct,isCamera,const DeepCollectionEquality().hash(_adsCarousel),addSplash,const DeepCollectionEquality().hash(_masterDataHistory),const DeepCollectionEquality().hash(_dataHistory),isSuccess,isShowDialog,productBody,const DeepCollectionEquality().hash(_historyProductLimit),isLoadingHistoryProductLimit,const DeepCollectionEquality().hash(_productMultipleList),paginationMeta,isLoadingProductMultiple,errorMessage]);

@override
String toString() {
  return 'ProductState(data: $data, isLoading: $isLoading, isLoadingSaveData: $isLoadingSaveData, imagePath: $imagePath, tempProduct: $tempProduct, isCamera: $isCamera, adsCarousel: $adsCarousel, addSplash: $addSplash, masterDataHistory: $masterDataHistory, dataHistory: $dataHistory, isSuccess: $isSuccess, isShowDialog: $isShowDialog, productBody: $productBody, historyProductLimit: $historyProductLimit, isLoadingHistoryProductLimit: $isLoadingHistoryProductLimit, productMultipleList: $productMultipleList, paginationMeta: $paginationMeta, isLoadingProductMultiple: $isLoadingProductMultiple, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ProductStateCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ProductStateCopyWith(_ProductState value, $Res Function(_ProductState) _then) = __$ProductStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductData> data, bool isLoading, bool isLoadingSaveData, String imagePath, ProductData? tempProduct, bool isCamera, List<AdResponseData> adsCarousel, AdResponseData? addSplash, List<ProductData> masterDataHistory, List<ProductData> dataHistory, bool isSuccess, bool isShowDialog, ProductBody? productBody, List<FetchHistoryDataProductLimit> historyProductLimit, bool isLoadingHistoryProductLimit, List<ProductData> productMultipleList, PaginationMeta? paginationMeta, bool isLoadingProductMultiple, String? errorMessage
});


@override $ProductBodyCopyWith<$Res>? get productBody;

}
/// @nodoc
class __$ProductStateCopyWithImpl<$Res>
    implements _$ProductStateCopyWith<$Res> {
  __$ProductStateCopyWithImpl(this._self, this._then);

  final _ProductState _self;
  final $Res Function(_ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? isLoading = null,Object? isLoadingSaveData = null,Object? imagePath = null,Object? tempProduct = freezed,Object? isCamera = null,Object? adsCarousel = null,Object? addSplash = freezed,Object? masterDataHistory = null,Object? dataHistory = null,Object? isSuccess = null,Object? isShowDialog = null,Object? productBody = freezed,Object? historyProductLimit = null,Object? isLoadingHistoryProductLimit = null,Object? productMultipleList = null,Object? paginationMeta = freezed,Object? isLoadingProductMultiple = null,Object? errorMessage = freezed,}) {
  return _then(_ProductState(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProductData>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingSaveData: null == isLoadingSaveData ? _self.isLoadingSaveData : isLoadingSaveData // ignore: cast_nullable_to_non_nullable
as bool,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,tempProduct: freezed == tempProduct ? _self.tempProduct : tempProduct // ignore: cast_nullable_to_non_nullable
as ProductData?,isCamera: null == isCamera ? _self.isCamera : isCamera // ignore: cast_nullable_to_non_nullable
as bool,adsCarousel: null == adsCarousel ? _self._adsCarousel : adsCarousel // ignore: cast_nullable_to_non_nullable
as List<AdResponseData>,addSplash: freezed == addSplash ? _self.addSplash : addSplash // ignore: cast_nullable_to_non_nullable
as AdResponseData?,masterDataHistory: null == masterDataHistory ? _self._masterDataHistory : masterDataHistory // ignore: cast_nullable_to_non_nullable
as List<ProductData>,dataHistory: null == dataHistory ? _self._dataHistory : dataHistory // ignore: cast_nullable_to_non_nullable
as List<ProductData>,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isShowDialog: null == isShowDialog ? _self.isShowDialog : isShowDialog // ignore: cast_nullable_to_non_nullable
as bool,productBody: freezed == productBody ? _self.productBody : productBody // ignore: cast_nullable_to_non_nullable
as ProductBody?,historyProductLimit: null == historyProductLimit ? _self._historyProductLimit : historyProductLimit // ignore: cast_nullable_to_non_nullable
as List<FetchHistoryDataProductLimit>,isLoadingHistoryProductLimit: null == isLoadingHistoryProductLimit ? _self.isLoadingHistoryProductLimit : isLoadingHistoryProductLimit // ignore: cast_nullable_to_non_nullable
as bool,productMultipleList: null == productMultipleList ? _self._productMultipleList : productMultipleList // ignore: cast_nullable_to_non_nullable
as List<ProductData>,paginationMeta: freezed == paginationMeta ? _self.paginationMeta : paginationMeta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,isLoadingProductMultiple: null == isLoadingProductMultiple ? _self.isLoadingProductMultiple : isLoadingProductMultiple // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductBodyCopyWith<$Res>? get productBody {
    if (_self.productBody == null) {
    return null;
  }

  return $ProductBodyCopyWith<$Res>(_self.productBody!, (value) {
    return _then(_self.copyWith(productBody: value));
  });
}
}

// dart format on
