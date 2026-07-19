// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductReport {

@JsonKey(name: 'brand_id') int get brandId;@JsonKey(name: 'image', toJson: parseToBase64) String get image;@JsonKey(name: 'name') String get name;@JsonKey(name: 'description') String get description;@JsonKey(name: 'partner_id') int get partner;@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'person') String get person;@JsonKey(name: 'kecamatan') String get kecamatan;@JsonKey(name: 'kelurahan') String get kelurahan;@JsonKey(name: 'lat') double get lat;@JsonKey(name: 'long') double get long;@JsonKey(name: 'provinsi') String get provinsi;
/// Create a copy of ProductReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductReportCopyWith<ProductReport> get copyWith => _$ProductReportCopyWithImpl<ProductReport>(this as ProductReport, _$identity);

  /// Serializes this ProductReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductReport&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.person, person) || other.person == person)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brandId,image,name,description,partner,deviceId,person,kecamatan,kelurahan,lat,long,provinsi);

@override
String toString() {
  return 'ProductReport(brandId: $brandId, image: $image, name: $name, description: $description, partner: $partner, deviceId: $deviceId, person: $person, kecamatan: $kecamatan, kelurahan: $kelurahan, lat: $lat, long: $long, provinsi: $provinsi)';
}


}

/// @nodoc
abstract mixin class $ProductReportCopyWith<$Res>  {
  factory $ProductReportCopyWith(ProductReport value, $Res Function(ProductReport) _then) = _$ProductReportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'brand_id') int brandId,@JsonKey(name: 'image', toJson: parseToBase64) String image,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'partner_id') int partner,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'person') String person,@JsonKey(name: 'kecamatan') String kecamatan,@JsonKey(name: 'kelurahan') String kelurahan,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long,@JsonKey(name: 'provinsi') String provinsi
});




}
/// @nodoc
class _$ProductReportCopyWithImpl<$Res>
    implements $ProductReportCopyWith<$Res> {
  _$ProductReportCopyWithImpl(this._self, this._then);

  final ProductReport _self;
  final $Res Function(ProductReport) _then;

/// Create a copy of ProductReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brandId = null,Object? image = null,Object? name = null,Object? description = null,Object? partner = null,Object? deviceId = null,Object? person = null,Object? kecamatan = null,Object? kelurahan = null,Object? lat = null,Object? long = null,Object? provinsi = null,}) {
  return _then(_self.copyWith(
brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,partner: null == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,person: null == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as String,kecamatan: null == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String,kelurahan: null == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,provinsi: null == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductReport].
extension ProductReportPatterns on ProductReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductReport value)  $default,){
final _that = this;
switch (_that) {
case _ProductReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductReport value)?  $default,){
final _that = this;
switch (_that) {
case _ProductReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'brand_id')  int brandId, @JsonKey(name: 'image', toJson: parseToBase64)  String image, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'partner_id')  int partner, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'person')  String person, @JsonKey(name: 'kecamatan')  String kecamatan, @JsonKey(name: 'kelurahan')  String kelurahan, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long, @JsonKey(name: 'provinsi')  String provinsi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductReport() when $default != null:
return $default(_that.brandId,_that.image,_that.name,_that.description,_that.partner,_that.deviceId,_that.person,_that.kecamatan,_that.kelurahan,_that.lat,_that.long,_that.provinsi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'brand_id')  int brandId, @JsonKey(name: 'image', toJson: parseToBase64)  String image, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'partner_id')  int partner, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'person')  String person, @JsonKey(name: 'kecamatan')  String kecamatan, @JsonKey(name: 'kelurahan')  String kelurahan, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long, @JsonKey(name: 'provinsi')  String provinsi)  $default,) {final _that = this;
switch (_that) {
case _ProductReport():
return $default(_that.brandId,_that.image,_that.name,_that.description,_that.partner,_that.deviceId,_that.person,_that.kecamatan,_that.kelurahan,_that.lat,_that.long,_that.provinsi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'brand_id')  int brandId, @JsonKey(name: 'image', toJson: parseToBase64)  String image, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'partner_id')  int partner, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'person')  String person, @JsonKey(name: 'kecamatan')  String kecamatan, @JsonKey(name: 'kelurahan')  String kelurahan, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long, @JsonKey(name: 'provinsi')  String provinsi)?  $default,) {final _that = this;
switch (_that) {
case _ProductReport() when $default != null:
return $default(_that.brandId,_that.image,_that.name,_that.description,_that.partner,_that.deviceId,_that.person,_that.kecamatan,_that.kelurahan,_that.lat,_that.long,_that.provinsi);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake, explicitToJson: true)
class _ProductReport implements ProductReport {
   _ProductReport({@JsonKey(name: 'brand_id') required this.brandId, @JsonKey(name: 'image', toJson: parseToBase64) required this.image, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'partner_id') required this.partner, @JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'person') required this.person, @JsonKey(name: 'kecamatan') required this.kecamatan, @JsonKey(name: 'kelurahan') required this.kelurahan, @JsonKey(name: 'lat') required this.lat, @JsonKey(name: 'long') required this.long, @JsonKey(name: 'provinsi') required this.provinsi});
  

@override@JsonKey(name: 'brand_id') final  int brandId;
@override@JsonKey(name: 'image', toJson: parseToBase64) final  String image;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'partner_id') final  int partner;
@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'person') final  String person;
@override@JsonKey(name: 'kecamatan') final  String kecamatan;
@override@JsonKey(name: 'kelurahan') final  String kelurahan;
@override@JsonKey(name: 'lat') final  double lat;
@override@JsonKey(name: 'long') final  double long;
@override@JsonKey(name: 'provinsi') final  String provinsi;

/// Create a copy of ProductReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductReportCopyWith<_ProductReport> get copyWith => __$ProductReportCopyWithImpl<_ProductReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductReport&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.person, person) || other.person == person)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brandId,image,name,description,partner,deviceId,person,kecamatan,kelurahan,lat,long,provinsi);

@override
String toString() {
  return 'ProductReport(brandId: $brandId, image: $image, name: $name, description: $description, partner: $partner, deviceId: $deviceId, person: $person, kecamatan: $kecamatan, kelurahan: $kelurahan, lat: $lat, long: $long, provinsi: $provinsi)';
}


}

/// @nodoc
abstract mixin class _$ProductReportCopyWith<$Res> implements $ProductReportCopyWith<$Res> {
  factory _$ProductReportCopyWith(_ProductReport value, $Res Function(_ProductReport) _then) = __$ProductReportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'brand_id') int brandId,@JsonKey(name: 'image', toJson: parseToBase64) String image,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'partner_id') int partner,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'person') String person,@JsonKey(name: 'kecamatan') String kecamatan,@JsonKey(name: 'kelurahan') String kelurahan,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long,@JsonKey(name: 'provinsi') String provinsi
});




}
/// @nodoc
class __$ProductReportCopyWithImpl<$Res>
    implements _$ProductReportCopyWith<$Res> {
  __$ProductReportCopyWithImpl(this._self, this._then);

  final _ProductReport _self;
  final $Res Function(_ProductReport) _then;

/// Create a copy of ProductReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brandId = null,Object? image = null,Object? name = null,Object? description = null,Object? partner = null,Object? deviceId = null,Object? person = null,Object? kecamatan = null,Object? kelurahan = null,Object? lat = null,Object? long = null,Object? provinsi = null,}) {
  return _then(_ProductReport(
brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,partner: null == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,person: null == person ? _self.person : person // ignore: cast_nullable_to_non_nullable
as String,kecamatan: null == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String,kelurahan: null == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,provinsi: null == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
