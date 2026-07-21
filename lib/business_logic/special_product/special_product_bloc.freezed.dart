// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'special_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpecialProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecialProductEvent()';
}


}

/// @nodoc
class $SpecialProductEventCopyWith<$Res>  {
$SpecialProductEventCopyWith(SpecialProductEvent _, $Res Function(SpecialProductEvent) __);
}


/// Adds pattern-matching-related methods to [SpecialProductEvent].
extension SpecialProductEventPatterns on SpecialProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _NextPageSponsored value)?  nextPageSponsored,TResult Function( _GetProduct value)?  getProduct,TResult Function( _GetBrandData value)?  getBrandData,TResult Function( _AdLog value)?  adLog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NextPageSponsored() when nextPageSponsored != null:
return nextPageSponsored(_that);case _GetProduct() when getProduct != null:
return getProduct(_that);case _GetBrandData() when getBrandData != null:
return getBrandData(_that);case _AdLog() when adLog != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _NextPageSponsored value)  nextPageSponsored,required TResult Function( _GetProduct value)  getProduct,required TResult Function( _GetBrandData value)  getBrandData,required TResult Function( _AdLog value)  adLog,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _NextPageSponsored():
return nextPageSponsored(_that);case _GetProduct():
return getProduct(_that);case _GetBrandData():
return getBrandData(_that);case _AdLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _NextPageSponsored value)?  nextPageSponsored,TResult? Function( _GetProduct value)?  getProduct,TResult? Function( _GetBrandData value)?  getBrandData,TResult? Function( _AdLog value)?  adLog,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NextPageSponsored() when nextPageSponsored != null:
return nextPageSponsored(_that);case _GetProduct() when getProduct != null:
return getProduct(_that);case _GetBrandData() when getBrandData != null:
return getBrandData(_that);case _AdLog() when adLog != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  nextPageSponsored,TResult Function( int val)?  getProduct,TResult Function()?  getBrandData,TResult Function( int? productId,  int? campaignId,  int? creativeId,  String type)?  adLog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _NextPageSponsored() when nextPageSponsored != null:
return nextPageSponsored();case _GetProduct() when getProduct != null:
return getProduct(_that.val);case _GetBrandData() when getBrandData != null:
return getBrandData();case _AdLog() when adLog != null:
return adLog(_that.productId,_that.campaignId,_that.creativeId,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  nextPageSponsored,required TResult Function( int val)  getProduct,required TResult Function()  getBrandData,required TResult Function( int? productId,  int? campaignId,  int? creativeId,  String type)  adLog,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _NextPageSponsored():
return nextPageSponsored();case _GetProduct():
return getProduct(_that.val);case _GetBrandData():
return getBrandData();case _AdLog():
return adLog(_that.productId,_that.campaignId,_that.creativeId,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  nextPageSponsored,TResult? Function( int val)?  getProduct,TResult? Function()?  getBrandData,TResult? Function( int? productId,  int? campaignId,  int? creativeId,  String type)?  adLog,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _NextPageSponsored() when nextPageSponsored != null:
return nextPageSponsored();case _GetProduct() when getProduct != null:
return getProduct(_that.val);case _GetBrandData() when getBrandData != null:
return getBrandData();case _AdLog() when adLog != null:
return adLog(_that.productId,_that.campaignId,_that.creativeId,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SpecialProductEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecialProductEvent.started()';
}


}




/// @nodoc


class _NextPageSponsored implements SpecialProductEvent {
  const _NextPageSponsored();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextPageSponsored);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecialProductEvent.nextPageSponsored()';
}


}




/// @nodoc


class _GetProduct implements SpecialProductEvent {
  const _GetProduct(this.val);
  

 final  int val;

/// Create a copy of SpecialProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetProductCopyWith<_GetProduct> get copyWith => __$GetProductCopyWithImpl<_GetProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProduct&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'SpecialProductEvent.getProduct(val: $val)';
}


}

/// @nodoc
abstract mixin class _$GetProductCopyWith<$Res> implements $SpecialProductEventCopyWith<$Res> {
  factory _$GetProductCopyWith(_GetProduct value, $Res Function(_GetProduct) _then) = __$GetProductCopyWithImpl;
@useResult
$Res call({
 int val
});




}
/// @nodoc
class __$GetProductCopyWithImpl<$Res>
    implements _$GetProductCopyWith<$Res> {
  __$GetProductCopyWithImpl(this._self, this._then);

  final _GetProduct _self;
  final $Res Function(_GetProduct) _then;

/// Create a copy of SpecialProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_GetProduct(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GetBrandData implements SpecialProductEvent {
  const _GetBrandData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetBrandData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SpecialProductEvent.getBrandData()';
}


}




/// @nodoc


class _AdLog implements SpecialProductEvent {
  const _AdLog(this.productId, this.campaignId, this.creativeId, this.type);
  

 final  int? productId;
 final  int? campaignId;
 final  int? creativeId;
 final  String type;

/// Create a copy of SpecialProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdLogCopyWith<_AdLog> get copyWith => __$AdLogCopyWithImpl<_AdLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdLog&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.campaignId, campaignId) || other.campaignId == campaignId)&&(identical(other.creativeId, creativeId) || other.creativeId == creativeId)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,productId,campaignId,creativeId,type);

@override
String toString() {
  return 'SpecialProductEvent.adLog(productId: $productId, campaignId: $campaignId, creativeId: $creativeId, type: $type)';
}


}

/// @nodoc
abstract mixin class _$AdLogCopyWith<$Res> implements $SpecialProductEventCopyWith<$Res> {
  factory _$AdLogCopyWith(_AdLog value, $Res Function(_AdLog) _then) = __$AdLogCopyWithImpl;
@useResult
$Res call({
 int? productId, int? campaignId, int? creativeId, String type
});




}
/// @nodoc
class __$AdLogCopyWithImpl<$Res>
    implements _$AdLogCopyWith<$Res> {
  __$AdLogCopyWithImpl(this._self, this._then);

  final _AdLog _self;
  final $Res Function(_AdLog) _then;

/// Create a copy of SpecialProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = freezed,Object? campaignId = freezed,Object? creativeId = freezed,Object? type = null,}) {
  return _then(_AdLog(
freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,freezed == campaignId ? _self.campaignId : campaignId // ignore: cast_nullable_to_non_nullable
as int?,freezed == creativeId ? _self.creativeId : creativeId // ignore: cast_nullable_to_non_nullable
as int?,null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SpecialProductState {

 bool get isLoading; int get page; int get lastPage; String? get errorMessage; List<AdResponseData> get data; List<ProductData> get dataProdusenProduct; List<ProductData> get dataAds; bool get isLoadingNextPage; List<ProductData> get dataAdsTop10; bool get getBrandDataLoading; bool get getBrandDataSuccess; String get getBrandDataErrorMessage; List<Brand> get dataBrand;
/// Create a copy of SpecialProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecialProductStateCopyWith<SpecialProductState> get copyWith => _$SpecialProductStateCopyWithImpl<SpecialProductState>(this as SpecialProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialProductState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.page, page) || other.page == page)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.dataProdusenProduct, dataProdusenProduct)&&const DeepCollectionEquality().equals(other.dataAds, dataAds)&&(identical(other.isLoadingNextPage, isLoadingNextPage) || other.isLoadingNextPage == isLoadingNextPage)&&const DeepCollectionEquality().equals(other.dataAdsTop10, dataAdsTop10)&&(identical(other.getBrandDataLoading, getBrandDataLoading) || other.getBrandDataLoading == getBrandDataLoading)&&(identical(other.getBrandDataSuccess, getBrandDataSuccess) || other.getBrandDataSuccess == getBrandDataSuccess)&&(identical(other.getBrandDataErrorMessage, getBrandDataErrorMessage) || other.getBrandDataErrorMessage == getBrandDataErrorMessage)&&const DeepCollectionEquality().equals(other.dataBrand, dataBrand));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,page,lastPage,errorMessage,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(dataProdusenProduct),const DeepCollectionEquality().hash(dataAds),isLoadingNextPage,const DeepCollectionEquality().hash(dataAdsTop10),getBrandDataLoading,getBrandDataSuccess,getBrandDataErrorMessage,const DeepCollectionEquality().hash(dataBrand));

@override
String toString() {
  return 'SpecialProductState(isLoading: $isLoading, page: $page, lastPage: $lastPage, errorMessage: $errorMessage, data: $data, dataProdusenProduct: $dataProdusenProduct, dataAds: $dataAds, isLoadingNextPage: $isLoadingNextPage, dataAdsTop10: $dataAdsTop10, getBrandDataLoading: $getBrandDataLoading, getBrandDataSuccess: $getBrandDataSuccess, getBrandDataErrorMessage: $getBrandDataErrorMessage, dataBrand: $dataBrand)';
}


}

/// @nodoc
abstract mixin class $SpecialProductStateCopyWith<$Res>  {
  factory $SpecialProductStateCopyWith(SpecialProductState value, $Res Function(SpecialProductState) _then) = _$SpecialProductStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, int page, int lastPage, String? errorMessage, List<AdResponseData> data, List<ProductData> dataProdusenProduct, List<ProductData> dataAds, bool isLoadingNextPage, List<ProductData> dataAdsTop10, bool getBrandDataLoading, bool getBrandDataSuccess, String getBrandDataErrorMessage, List<Brand> dataBrand
});




}
/// @nodoc
class _$SpecialProductStateCopyWithImpl<$Res>
    implements $SpecialProductStateCopyWith<$Res> {
  _$SpecialProductStateCopyWithImpl(this._self, this._then);

  final SpecialProductState _self;
  final $Res Function(SpecialProductState) _then;

/// Create a copy of SpecialProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? page = null,Object? lastPage = null,Object? errorMessage = freezed,Object? data = null,Object? dataProdusenProduct = null,Object? dataAds = null,Object? isLoadingNextPage = null,Object? dataAdsTop10 = null,Object? getBrandDataLoading = null,Object? getBrandDataSuccess = null,Object? getBrandDataErrorMessage = null,Object? dataBrand = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AdResponseData>,dataProdusenProduct: null == dataProdusenProduct ? _self.dataProdusenProduct : dataProdusenProduct // ignore: cast_nullable_to_non_nullable
as List<ProductData>,dataAds: null == dataAds ? _self.dataAds : dataAds // ignore: cast_nullable_to_non_nullable
as List<ProductData>,isLoadingNextPage: null == isLoadingNextPage ? _self.isLoadingNextPage : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
as bool,dataAdsTop10: null == dataAdsTop10 ? _self.dataAdsTop10 : dataAdsTop10 // ignore: cast_nullable_to_non_nullable
as List<ProductData>,getBrandDataLoading: null == getBrandDataLoading ? _self.getBrandDataLoading : getBrandDataLoading // ignore: cast_nullable_to_non_nullable
as bool,getBrandDataSuccess: null == getBrandDataSuccess ? _self.getBrandDataSuccess : getBrandDataSuccess // ignore: cast_nullable_to_non_nullable
as bool,getBrandDataErrorMessage: null == getBrandDataErrorMessage ? _self.getBrandDataErrorMessage : getBrandDataErrorMessage // ignore: cast_nullable_to_non_nullable
as String,dataBrand: null == dataBrand ? _self.dataBrand : dataBrand // ignore: cast_nullable_to_non_nullable
as List<Brand>,
  ));
}

}


/// Adds pattern-matching-related methods to [SpecialProductState].
extension SpecialProductStatePatterns on SpecialProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecialProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecialProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecialProductState value)  $default,){
final _that = this;
switch (_that) {
case _SpecialProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecialProductState value)?  $default,){
final _that = this;
switch (_that) {
case _SpecialProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  int page,  int lastPage,  String? errorMessage,  List<AdResponseData> data,  List<ProductData> dataProdusenProduct,  List<ProductData> dataAds,  bool isLoadingNextPage,  List<ProductData> dataAdsTop10,  bool getBrandDataLoading,  bool getBrandDataSuccess,  String getBrandDataErrorMessage,  List<Brand> dataBrand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecialProductState() when $default != null:
return $default(_that.isLoading,_that.page,_that.lastPage,_that.errorMessage,_that.data,_that.dataProdusenProduct,_that.dataAds,_that.isLoadingNextPage,_that.dataAdsTop10,_that.getBrandDataLoading,_that.getBrandDataSuccess,_that.getBrandDataErrorMessage,_that.dataBrand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  int page,  int lastPage,  String? errorMessage,  List<AdResponseData> data,  List<ProductData> dataProdusenProduct,  List<ProductData> dataAds,  bool isLoadingNextPage,  List<ProductData> dataAdsTop10,  bool getBrandDataLoading,  bool getBrandDataSuccess,  String getBrandDataErrorMessage,  List<Brand> dataBrand)  $default,) {final _that = this;
switch (_that) {
case _SpecialProductState():
return $default(_that.isLoading,_that.page,_that.lastPage,_that.errorMessage,_that.data,_that.dataProdusenProduct,_that.dataAds,_that.isLoadingNextPage,_that.dataAdsTop10,_that.getBrandDataLoading,_that.getBrandDataSuccess,_that.getBrandDataErrorMessage,_that.dataBrand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  int page,  int lastPage,  String? errorMessage,  List<AdResponseData> data,  List<ProductData> dataProdusenProduct,  List<ProductData> dataAds,  bool isLoadingNextPage,  List<ProductData> dataAdsTop10,  bool getBrandDataLoading,  bool getBrandDataSuccess,  String getBrandDataErrorMessage,  List<Brand> dataBrand)?  $default,) {final _that = this;
switch (_that) {
case _SpecialProductState() when $default != null:
return $default(_that.isLoading,_that.page,_that.lastPage,_that.errorMessage,_that.data,_that.dataProdusenProduct,_that.dataAds,_that.isLoadingNextPage,_that.dataAdsTop10,_that.getBrandDataLoading,_that.getBrandDataSuccess,_that.getBrandDataErrorMessage,_that.dataBrand);case _:
  return null;

}
}

}

/// @nodoc


class _SpecialProductState implements SpecialProductState {
  const _SpecialProductState({required this.isLoading, required this.page, required this.lastPage, required this.errorMessage, required final  List<AdResponseData> data, required final  List<ProductData> dataProdusenProduct, required final  List<ProductData> dataAds, required this.isLoadingNextPage, required final  List<ProductData> dataAdsTop10, required this.getBrandDataLoading, required this.getBrandDataSuccess, required this.getBrandDataErrorMessage, required final  List<Brand> dataBrand}): _data = data,_dataProdusenProduct = dataProdusenProduct,_dataAds = dataAds,_dataAdsTop10 = dataAdsTop10,_dataBrand = dataBrand;
  

@override final  bool isLoading;
@override final  int page;
@override final  int lastPage;
@override final  String? errorMessage;
 final  List<AdResponseData> _data;
@override List<AdResponseData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

 final  List<ProductData> _dataProdusenProduct;
@override List<ProductData> get dataProdusenProduct {
  if (_dataProdusenProduct is EqualUnmodifiableListView) return _dataProdusenProduct;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataProdusenProduct);
}

 final  List<ProductData> _dataAds;
@override List<ProductData> get dataAds {
  if (_dataAds is EqualUnmodifiableListView) return _dataAds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataAds);
}

@override final  bool isLoadingNextPage;
 final  List<ProductData> _dataAdsTop10;
@override List<ProductData> get dataAdsTop10 {
  if (_dataAdsTop10 is EqualUnmodifiableListView) return _dataAdsTop10;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataAdsTop10);
}

@override final  bool getBrandDataLoading;
@override final  bool getBrandDataSuccess;
@override final  String getBrandDataErrorMessage;
 final  List<Brand> _dataBrand;
@override List<Brand> get dataBrand {
  if (_dataBrand is EqualUnmodifiableListView) return _dataBrand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataBrand);
}


/// Create a copy of SpecialProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecialProductStateCopyWith<_SpecialProductState> get copyWith => __$SpecialProductStateCopyWithImpl<_SpecialProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecialProductState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.page, page) || other.page == page)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._data, _data)&&const DeepCollectionEquality().equals(other._dataProdusenProduct, _dataProdusenProduct)&&const DeepCollectionEquality().equals(other._dataAds, _dataAds)&&(identical(other.isLoadingNextPage, isLoadingNextPage) || other.isLoadingNextPage == isLoadingNextPage)&&const DeepCollectionEquality().equals(other._dataAdsTop10, _dataAdsTop10)&&(identical(other.getBrandDataLoading, getBrandDataLoading) || other.getBrandDataLoading == getBrandDataLoading)&&(identical(other.getBrandDataSuccess, getBrandDataSuccess) || other.getBrandDataSuccess == getBrandDataSuccess)&&(identical(other.getBrandDataErrorMessage, getBrandDataErrorMessage) || other.getBrandDataErrorMessage == getBrandDataErrorMessage)&&const DeepCollectionEquality().equals(other._dataBrand, _dataBrand));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,page,lastPage,errorMessage,const DeepCollectionEquality().hash(_data),const DeepCollectionEquality().hash(_dataProdusenProduct),const DeepCollectionEquality().hash(_dataAds),isLoadingNextPage,const DeepCollectionEquality().hash(_dataAdsTop10),getBrandDataLoading,getBrandDataSuccess,getBrandDataErrorMessage,const DeepCollectionEquality().hash(_dataBrand));

@override
String toString() {
  return 'SpecialProductState(isLoading: $isLoading, page: $page, lastPage: $lastPage, errorMessage: $errorMessage, data: $data, dataProdusenProduct: $dataProdusenProduct, dataAds: $dataAds, isLoadingNextPage: $isLoadingNextPage, dataAdsTop10: $dataAdsTop10, getBrandDataLoading: $getBrandDataLoading, getBrandDataSuccess: $getBrandDataSuccess, getBrandDataErrorMessage: $getBrandDataErrorMessage, dataBrand: $dataBrand)';
}


}

/// @nodoc
abstract mixin class _$SpecialProductStateCopyWith<$Res> implements $SpecialProductStateCopyWith<$Res> {
  factory _$SpecialProductStateCopyWith(_SpecialProductState value, $Res Function(_SpecialProductState) _then) = __$SpecialProductStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, int page, int lastPage, String? errorMessage, List<AdResponseData> data, List<ProductData> dataProdusenProduct, List<ProductData> dataAds, bool isLoadingNextPage, List<ProductData> dataAdsTop10, bool getBrandDataLoading, bool getBrandDataSuccess, String getBrandDataErrorMessage, List<Brand> dataBrand
});




}
/// @nodoc
class __$SpecialProductStateCopyWithImpl<$Res>
    implements _$SpecialProductStateCopyWith<$Res> {
  __$SpecialProductStateCopyWithImpl(this._self, this._then);

  final _SpecialProductState _self;
  final $Res Function(_SpecialProductState) _then;

/// Create a copy of SpecialProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? page = null,Object? lastPage = null,Object? errorMessage = freezed,Object? data = null,Object? dataProdusenProduct = null,Object? dataAds = null,Object? isLoadingNextPage = null,Object? dataAdsTop10 = null,Object? getBrandDataLoading = null,Object? getBrandDataSuccess = null,Object? getBrandDataErrorMessage = null,Object? dataBrand = null,}) {
  return _then(_SpecialProductState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AdResponseData>,dataProdusenProduct: null == dataProdusenProduct ? _self._dataProdusenProduct : dataProdusenProduct // ignore: cast_nullable_to_non_nullable
as List<ProductData>,dataAds: null == dataAds ? _self._dataAds : dataAds // ignore: cast_nullable_to_non_nullable
as List<ProductData>,isLoadingNextPage: null == isLoadingNextPage ? _self.isLoadingNextPage : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
as bool,dataAdsTop10: null == dataAdsTop10 ? _self._dataAdsTop10 : dataAdsTop10 // ignore: cast_nullable_to_non_nullable
as List<ProductData>,getBrandDataLoading: null == getBrandDataLoading ? _self.getBrandDataLoading : getBrandDataLoading // ignore: cast_nullable_to_non_nullable
as bool,getBrandDataSuccess: null == getBrandDataSuccess ? _self.getBrandDataSuccess : getBrandDataSuccess // ignore: cast_nullable_to_non_nullable
as bool,getBrandDataErrorMessage: null == getBrandDataErrorMessage ? _self.getBrandDataErrorMessage : getBrandDataErrorMessage // ignore: cast_nullable_to_non_nullable
as String,dataBrand: null == dataBrand ? _self._dataBrand : dataBrand // ignore: cast_nullable_to_non_nullable
as List<Brand>,
  ));
}


}

// dart format on
