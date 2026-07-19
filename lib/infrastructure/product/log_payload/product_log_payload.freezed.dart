// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_log_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductLogPayload {

@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'user') String get user;@JsonKey(name: 'image', toJson: parseToBase64) String get image;@JsonKey(name: 'subdistrict') String get kecamatan;@JsonKey(name: 'city') String get disctrict;@JsonKey(name: 'lat') double get lat;@JsonKey(name: 'long') double get long;@JsonKey(name: 'province') String get province;@JsonKey(name: 'event_type') String get eventType;@JsonKey(name: 'partner_id') int get partnerId;@JsonKey(name: 'brand_id') int get brandId;@JsonKey(name: 'product_category_id') int get categoryId;@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'status_halal') String get statusHalal;
/// Create a copy of ProductLogPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductLogPayloadCopyWith<ProductLogPayload> get copyWith => _$ProductLogPayloadCopyWithImpl<ProductLogPayload>(this as ProductLogPayload, _$identity);

  /// Serializes this ProductLogPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLogPayload&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.user, user) || other.user == user)&&(identical(other.image, image) || other.image == image)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.disctrict, disctrict) || other.disctrict == disctrict)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long)&&(identical(other.province, province) || other.province == province)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&(identical(other.partnerId, partnerId) || other.partnerId == partnerId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.statusHalal, statusHalal) || other.statusHalal == statusHalal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,user,image,kecamatan,disctrict,lat,long,province,eventType,partnerId,brandId,categoryId,productId,statusHalal);

@override
String toString() {
  return 'ProductLogPayload(deviceId: $deviceId, user: $user, image: $image, kecamatan: $kecamatan, disctrict: $disctrict, lat: $lat, long: $long, province: $province, eventType: $eventType, partnerId: $partnerId, brandId: $brandId, categoryId: $categoryId, productId: $productId, statusHalal: $statusHalal)';
}


}

/// @nodoc
abstract mixin class $ProductLogPayloadCopyWith<$Res>  {
  factory $ProductLogPayloadCopyWith(ProductLogPayload value, $Res Function(ProductLogPayload) _then) = _$ProductLogPayloadCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'user') String user,@JsonKey(name: 'image', toJson: parseToBase64) String image,@JsonKey(name: 'subdistrict') String kecamatan,@JsonKey(name: 'city') String disctrict,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long,@JsonKey(name: 'province') String province,@JsonKey(name: 'event_type') String eventType,@JsonKey(name: 'partner_id') int partnerId,@JsonKey(name: 'brand_id') int brandId,@JsonKey(name: 'product_category_id') int categoryId,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'status_halal') String statusHalal
});




}
/// @nodoc
class _$ProductLogPayloadCopyWithImpl<$Res>
    implements $ProductLogPayloadCopyWith<$Res> {
  _$ProductLogPayloadCopyWithImpl(this._self, this._then);

  final ProductLogPayload _self;
  final $Res Function(ProductLogPayload) _then;

/// Create a copy of ProductLogPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? user = null,Object? image = null,Object? kecamatan = null,Object? disctrict = null,Object? lat = null,Object? long = null,Object? province = null,Object? eventType = null,Object? partnerId = null,Object? brandId = null,Object? categoryId = null,Object? productId = null,Object? statusHalal = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,kecamatan: null == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String,disctrict: null == disctrict ? _self.disctrict : disctrict // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as String,partnerId: null == partnerId ? _self.partnerId : partnerId // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,statusHalal: null == statusHalal ? _self.statusHalal : statusHalal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductLogPayload].
extension ProductLogPayloadPatterns on ProductLogPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductLogPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductLogPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductLogPayload value)  $default,){
final _that = this;
switch (_that) {
case _ProductLogPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductLogPayload value)?  $default,){
final _that = this;
switch (_that) {
case _ProductLogPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'user')  String user, @JsonKey(name: 'image', toJson: parseToBase64)  String image, @JsonKey(name: 'subdistrict')  String kecamatan, @JsonKey(name: 'city')  String disctrict, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long, @JsonKey(name: 'province')  String province, @JsonKey(name: 'event_type')  String eventType, @JsonKey(name: 'partner_id')  int partnerId, @JsonKey(name: 'brand_id')  int brandId, @JsonKey(name: 'product_category_id')  int categoryId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'status_halal')  String statusHalal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductLogPayload() when $default != null:
return $default(_that.deviceId,_that.user,_that.image,_that.kecamatan,_that.disctrict,_that.lat,_that.long,_that.province,_that.eventType,_that.partnerId,_that.brandId,_that.categoryId,_that.productId,_that.statusHalal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'user')  String user, @JsonKey(name: 'image', toJson: parseToBase64)  String image, @JsonKey(name: 'subdistrict')  String kecamatan, @JsonKey(name: 'city')  String disctrict, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long, @JsonKey(name: 'province')  String province, @JsonKey(name: 'event_type')  String eventType, @JsonKey(name: 'partner_id')  int partnerId, @JsonKey(name: 'brand_id')  int brandId, @JsonKey(name: 'product_category_id')  int categoryId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'status_halal')  String statusHalal)  $default,) {final _that = this;
switch (_that) {
case _ProductLogPayload():
return $default(_that.deviceId,_that.user,_that.image,_that.kecamatan,_that.disctrict,_that.lat,_that.long,_that.province,_that.eventType,_that.partnerId,_that.brandId,_that.categoryId,_that.productId,_that.statusHalal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'user')  String user, @JsonKey(name: 'image', toJson: parseToBase64)  String image, @JsonKey(name: 'subdistrict')  String kecamatan, @JsonKey(name: 'city')  String disctrict, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long, @JsonKey(name: 'province')  String province, @JsonKey(name: 'event_type')  String eventType, @JsonKey(name: 'partner_id')  int partnerId, @JsonKey(name: 'brand_id')  int brandId, @JsonKey(name: 'product_category_id')  int categoryId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'status_halal')  String statusHalal)?  $default,) {final _that = this;
switch (_that) {
case _ProductLogPayload() when $default != null:
return $default(_that.deviceId,_that.user,_that.image,_that.kecamatan,_that.disctrict,_that.lat,_that.long,_that.province,_that.eventType,_that.partnerId,_that.brandId,_that.categoryId,_that.productId,_that.statusHalal);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake, explicitToJson: true)
class _ProductLogPayload implements ProductLogPayload {
   _ProductLogPayload({@JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'user') required this.user, @JsonKey(name: 'image', toJson: parseToBase64) required this.image, @JsonKey(name: 'subdistrict') required this.kecamatan, @JsonKey(name: 'city') required this.disctrict, @JsonKey(name: 'lat') required this.lat, @JsonKey(name: 'long') required this.long, @JsonKey(name: 'province') required this.province, @JsonKey(name: 'event_type') required this.eventType, @JsonKey(name: 'partner_id') required this.partnerId, @JsonKey(name: 'brand_id') required this.brandId, @JsonKey(name: 'product_category_id') required this.categoryId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'status_halal') required this.statusHalal});
  

@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'user') final  String user;
@override@JsonKey(name: 'image', toJson: parseToBase64) final  String image;
@override@JsonKey(name: 'subdistrict') final  String kecamatan;
@override@JsonKey(name: 'city') final  String disctrict;
@override@JsonKey(name: 'lat') final  double lat;
@override@JsonKey(name: 'long') final  double long;
@override@JsonKey(name: 'province') final  String province;
@override@JsonKey(name: 'event_type') final  String eventType;
@override@JsonKey(name: 'partner_id') final  int partnerId;
@override@JsonKey(name: 'brand_id') final  int brandId;
@override@JsonKey(name: 'product_category_id') final  int categoryId;
@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'status_halal') final  String statusHalal;

/// Create a copy of ProductLogPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductLogPayloadCopyWith<_ProductLogPayload> get copyWith => __$ProductLogPayloadCopyWithImpl<_ProductLogPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductLogPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductLogPayload&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.user, user) || other.user == user)&&(identical(other.image, image) || other.image == image)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.disctrict, disctrict) || other.disctrict == disctrict)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long)&&(identical(other.province, province) || other.province == province)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&(identical(other.partnerId, partnerId) || other.partnerId == partnerId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.statusHalal, statusHalal) || other.statusHalal == statusHalal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,user,image,kecamatan,disctrict,lat,long,province,eventType,partnerId,brandId,categoryId,productId,statusHalal);

@override
String toString() {
  return 'ProductLogPayload(deviceId: $deviceId, user: $user, image: $image, kecamatan: $kecamatan, disctrict: $disctrict, lat: $lat, long: $long, province: $province, eventType: $eventType, partnerId: $partnerId, brandId: $brandId, categoryId: $categoryId, productId: $productId, statusHalal: $statusHalal)';
}


}

/// @nodoc
abstract mixin class _$ProductLogPayloadCopyWith<$Res> implements $ProductLogPayloadCopyWith<$Res> {
  factory _$ProductLogPayloadCopyWith(_ProductLogPayload value, $Res Function(_ProductLogPayload) _then) = __$ProductLogPayloadCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'user') String user,@JsonKey(name: 'image', toJson: parseToBase64) String image,@JsonKey(name: 'subdistrict') String kecamatan,@JsonKey(name: 'city') String disctrict,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long,@JsonKey(name: 'province') String province,@JsonKey(name: 'event_type') String eventType,@JsonKey(name: 'partner_id') int partnerId,@JsonKey(name: 'brand_id') int brandId,@JsonKey(name: 'product_category_id') int categoryId,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'status_halal') String statusHalal
});




}
/// @nodoc
class __$ProductLogPayloadCopyWithImpl<$Res>
    implements _$ProductLogPayloadCopyWith<$Res> {
  __$ProductLogPayloadCopyWithImpl(this._self, this._then);

  final _ProductLogPayload _self;
  final $Res Function(_ProductLogPayload) _then;

/// Create a copy of ProductLogPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? user = null,Object? image = null,Object? kecamatan = null,Object? disctrict = null,Object? lat = null,Object? long = null,Object? province = null,Object? eventType = null,Object? partnerId = null,Object? brandId = null,Object? categoryId = null,Object? productId = null,Object? statusHalal = null,}) {
  return _then(_ProductLogPayload(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,kecamatan: null == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String,disctrict: null == disctrict ? _self.disctrict : disctrict // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as String,partnerId: null == partnerId ? _self.partnerId : partnerId // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,statusHalal: null == statusHalal ? _self.statusHalal : statusHalal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
