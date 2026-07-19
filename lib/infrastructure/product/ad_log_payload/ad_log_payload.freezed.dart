// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_log_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdLogPayload {

@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'creative_id') int get creativeId;@JsonKey(name: 'campaign_id') int get campaignId;@JsonKey(name: 'subdistrict') String get kecamatan;@JsonKey(name: 'city') String get kelurahan;@JsonKey(name: 'lat') double get lat;@JsonKey(name: 'long') double get long;@JsonKey(name: 'phone_number') String get phoneNumber;@JsonKey(name: 'user') String get user;@JsonKey(name: 'province') String get provinsi;@JsonKey(name: 'event_type') String get eventType;
/// Create a copy of AdLogPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdLogPayloadCopyWith<AdLogPayload> get copyWith => _$AdLogPayloadCopyWithImpl<AdLogPayload>(this as AdLogPayload, _$identity);

  /// Serializes this AdLogPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdLogPayload&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.creativeId, creativeId) || other.creativeId == creativeId)&&(identical(other.campaignId, campaignId) || other.campaignId == campaignId)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.user, user) || other.user == user)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi)&&(identical(other.eventType, eventType) || other.eventType == eventType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,creativeId,campaignId,kecamatan,kelurahan,lat,long,phoneNumber,user,provinsi,eventType);

@override
String toString() {
  return 'AdLogPayload(productId: $productId, creativeId: $creativeId, campaignId: $campaignId, kecamatan: $kecamatan, kelurahan: $kelurahan, lat: $lat, long: $long, phoneNumber: $phoneNumber, user: $user, provinsi: $provinsi, eventType: $eventType)';
}


}

/// @nodoc
abstract mixin class $AdLogPayloadCopyWith<$Res>  {
  factory $AdLogPayloadCopyWith(AdLogPayload value, $Res Function(AdLogPayload) _then) = _$AdLogPayloadCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'creative_id') int creativeId,@JsonKey(name: 'campaign_id') int campaignId,@JsonKey(name: 'subdistrict') String kecamatan,@JsonKey(name: 'city') String kelurahan,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'user') String user,@JsonKey(name: 'province') String provinsi,@JsonKey(name: 'event_type') String eventType
});




}
/// @nodoc
class _$AdLogPayloadCopyWithImpl<$Res>
    implements $AdLogPayloadCopyWith<$Res> {
  _$AdLogPayloadCopyWithImpl(this._self, this._then);

  final AdLogPayload _self;
  final $Res Function(AdLogPayload) _then;

/// Create a copy of AdLogPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? creativeId = null,Object? campaignId = null,Object? kecamatan = null,Object? kelurahan = null,Object? lat = null,Object? long = null,Object? phoneNumber = null,Object? user = null,Object? provinsi = null,Object? eventType = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,creativeId: null == creativeId ? _self.creativeId : creativeId // ignore: cast_nullable_to_non_nullable
as int,campaignId: null == campaignId ? _self.campaignId : campaignId // ignore: cast_nullable_to_non_nullable
as int,kecamatan: null == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String,kelurahan: null == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,provinsi: null == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AdLogPayload].
extension AdLogPayloadPatterns on AdLogPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdLogPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdLogPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdLogPayload value)  $default,){
final _that = this;
switch (_that) {
case _AdLogPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdLogPayload value)?  $default,){
final _that = this;
switch (_that) {
case _AdLogPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'creative_id')  int creativeId, @JsonKey(name: 'campaign_id')  int campaignId, @JsonKey(name: 'subdistrict')  String kecamatan, @JsonKey(name: 'city')  String kelurahan, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'user')  String user, @JsonKey(name: 'province')  String provinsi, @JsonKey(name: 'event_type')  String eventType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdLogPayload() when $default != null:
return $default(_that.productId,_that.creativeId,_that.campaignId,_that.kecamatan,_that.kelurahan,_that.lat,_that.long,_that.phoneNumber,_that.user,_that.provinsi,_that.eventType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'creative_id')  int creativeId, @JsonKey(name: 'campaign_id')  int campaignId, @JsonKey(name: 'subdistrict')  String kecamatan, @JsonKey(name: 'city')  String kelurahan, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'user')  String user, @JsonKey(name: 'province')  String provinsi, @JsonKey(name: 'event_type')  String eventType)  $default,) {final _that = this;
switch (_that) {
case _AdLogPayload():
return $default(_that.productId,_that.creativeId,_that.campaignId,_that.kecamatan,_that.kelurahan,_that.lat,_that.long,_that.phoneNumber,_that.user,_that.provinsi,_that.eventType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'creative_id')  int creativeId, @JsonKey(name: 'campaign_id')  int campaignId, @JsonKey(name: 'subdistrict')  String kecamatan, @JsonKey(name: 'city')  String kelurahan, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'long')  double long, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'user')  String user, @JsonKey(name: 'province')  String provinsi, @JsonKey(name: 'event_type')  String eventType)?  $default,) {final _that = this;
switch (_that) {
case _AdLogPayload() when $default != null:
return $default(_that.productId,_that.creativeId,_that.campaignId,_that.kecamatan,_that.kelurahan,_that.lat,_that.long,_that.phoneNumber,_that.user,_that.provinsi,_that.eventType);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake, explicitToJson: true)
class _AdLogPayload implements AdLogPayload {
   _AdLogPayload({@JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'creative_id') required this.creativeId, @JsonKey(name: 'campaign_id') required this.campaignId, @JsonKey(name: 'subdistrict') required this.kecamatan, @JsonKey(name: 'city') required this.kelurahan, @JsonKey(name: 'lat') required this.lat, @JsonKey(name: 'long') required this.long, @JsonKey(name: 'phone_number') required this.phoneNumber, @JsonKey(name: 'user') required this.user, @JsonKey(name: 'province') required this.provinsi, @JsonKey(name: 'event_type') required this.eventType});
  

@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'creative_id') final  int creativeId;
@override@JsonKey(name: 'campaign_id') final  int campaignId;
@override@JsonKey(name: 'subdistrict') final  String kecamatan;
@override@JsonKey(name: 'city') final  String kelurahan;
@override@JsonKey(name: 'lat') final  double lat;
@override@JsonKey(name: 'long') final  double long;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override@JsonKey(name: 'user') final  String user;
@override@JsonKey(name: 'province') final  String provinsi;
@override@JsonKey(name: 'event_type') final  String eventType;

/// Create a copy of AdLogPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdLogPayloadCopyWith<_AdLogPayload> get copyWith => __$AdLogPayloadCopyWithImpl<_AdLogPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdLogPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdLogPayload&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.creativeId, creativeId) || other.creativeId == creativeId)&&(identical(other.campaignId, campaignId) || other.campaignId == campaignId)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.user, user) || other.user == user)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi)&&(identical(other.eventType, eventType) || other.eventType == eventType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,creativeId,campaignId,kecamatan,kelurahan,lat,long,phoneNumber,user,provinsi,eventType);

@override
String toString() {
  return 'AdLogPayload(productId: $productId, creativeId: $creativeId, campaignId: $campaignId, kecamatan: $kecamatan, kelurahan: $kelurahan, lat: $lat, long: $long, phoneNumber: $phoneNumber, user: $user, provinsi: $provinsi, eventType: $eventType)';
}


}

/// @nodoc
abstract mixin class _$AdLogPayloadCopyWith<$Res> implements $AdLogPayloadCopyWith<$Res> {
  factory _$AdLogPayloadCopyWith(_AdLogPayload value, $Res Function(_AdLogPayload) _then) = __$AdLogPayloadCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'creative_id') int creativeId,@JsonKey(name: 'campaign_id') int campaignId,@JsonKey(name: 'subdistrict') String kecamatan,@JsonKey(name: 'city') String kelurahan,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'long') double long,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'user') String user,@JsonKey(name: 'province') String provinsi,@JsonKey(name: 'event_type') String eventType
});




}
/// @nodoc
class __$AdLogPayloadCopyWithImpl<$Res>
    implements _$AdLogPayloadCopyWith<$Res> {
  __$AdLogPayloadCopyWithImpl(this._self, this._then);

  final _AdLogPayload _self;
  final $Res Function(_AdLogPayload) _then;

/// Create a copy of AdLogPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? creativeId = null,Object? campaignId = null,Object? kecamatan = null,Object? kelurahan = null,Object? lat = null,Object? long = null,Object? phoneNumber = null,Object? user = null,Object? provinsi = null,Object? eventType = null,}) {
  return _then(_AdLogPayload(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,creativeId: null == creativeId ? _self.creativeId : creativeId // ignore: cast_nullable_to_non_nullable
as int,campaignId: null == campaignId ? _self.campaignId : campaignId // ignore: cast_nullable_to_non_nullable
as int,kecamatan: null == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String,kelurahan: null == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,provinsi: null == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
