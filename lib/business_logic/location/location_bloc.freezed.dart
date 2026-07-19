// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationEvent()';
}


}

/// @nodoc
class $LocationEventCopyWith<$Res>  {
$LocationEventCopyWith(LocationEvent _, $Res Function(LocationEvent) __);
}


/// Adds pattern-matching-related methods to [LocationEvent].
extension LocationEventPatterns on LocationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetCurrentLocation value)?  getCurrentLocation,TResult Function( _GetPlaceMark value)?  getPlaceMark,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCurrentLocation() when getCurrentLocation != null:
return getCurrentLocation(_that);case _GetPlaceMark() when getPlaceMark != null:
return getPlaceMark(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetCurrentLocation value)  getCurrentLocation,required TResult Function( _GetPlaceMark value)  getPlaceMark,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetCurrentLocation():
return getCurrentLocation(_that);case _GetPlaceMark():
return getPlaceMark(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetCurrentLocation value)?  getCurrentLocation,TResult? Function( _GetPlaceMark value)?  getPlaceMark,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCurrentLocation() when getCurrentLocation != null:
return getCurrentLocation(_that);case _GetPlaceMark() when getPlaceMark != null:
return getPlaceMark(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( bool isGetPosition)?  getCurrentLocation,TResult Function( Position position)?  getPlaceMark,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCurrentLocation() when getCurrentLocation != null:
return getCurrentLocation(_that.isGetPosition);case _GetPlaceMark() when getPlaceMark != null:
return getPlaceMark(_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( bool isGetPosition)  getCurrentLocation,required TResult Function( Position position)  getPlaceMark,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetCurrentLocation():
return getCurrentLocation(_that.isGetPosition);case _GetPlaceMark():
return getPlaceMark(_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( bool isGetPosition)?  getCurrentLocation,TResult? Function( Position position)?  getPlaceMark,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCurrentLocation() when getCurrentLocation != null:
return getCurrentLocation(_that.isGetPosition);case _GetPlaceMark() when getPlaceMark != null:
return getPlaceMark(_that.position);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LocationEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationEvent.started()';
}


}




/// @nodoc


class _GetCurrentLocation implements LocationEvent {
  const _GetCurrentLocation({required this.isGetPosition});
  

 final  bool isGetPosition;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCurrentLocationCopyWith<_GetCurrentLocation> get copyWith => __$GetCurrentLocationCopyWithImpl<_GetCurrentLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCurrentLocation&&(identical(other.isGetPosition, isGetPosition) || other.isGetPosition == isGetPosition));
}


@override
int get hashCode => Object.hash(runtimeType,isGetPosition);

@override
String toString() {
  return 'LocationEvent.getCurrentLocation(isGetPosition: $isGetPosition)';
}


}

/// @nodoc
abstract mixin class _$GetCurrentLocationCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory _$GetCurrentLocationCopyWith(_GetCurrentLocation value, $Res Function(_GetCurrentLocation) _then) = __$GetCurrentLocationCopyWithImpl;
@useResult
$Res call({
 bool isGetPosition
});




}
/// @nodoc
class __$GetCurrentLocationCopyWithImpl<$Res>
    implements _$GetCurrentLocationCopyWith<$Res> {
  __$GetCurrentLocationCopyWithImpl(this._self, this._then);

  final _GetCurrentLocation _self;
  final $Res Function(_GetCurrentLocation) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isGetPosition = null,}) {
  return _then(_GetCurrentLocation(
isGetPosition: null == isGetPosition ? _self.isGetPosition : isGetPosition // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _GetPlaceMark implements LocationEvent {
  const _GetPlaceMark({required this.position});
  

 final  Position position;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPlaceMarkCopyWith<_GetPlaceMark> get copyWith => __$GetPlaceMarkCopyWithImpl<_GetPlaceMark>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPlaceMark&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,position);

@override
String toString() {
  return 'LocationEvent.getPlaceMark(position: $position)';
}


}

/// @nodoc
abstract mixin class _$GetPlaceMarkCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory _$GetPlaceMarkCopyWith(_GetPlaceMark value, $Res Function(_GetPlaceMark) _then) = __$GetPlaceMarkCopyWithImpl;
@useResult
$Res call({
 Position position
});




}
/// @nodoc
class __$GetPlaceMarkCopyWithImpl<$Res>
    implements _$GetPlaceMarkCopyWith<$Res> {
  __$GetPlaceMarkCopyWithImpl(this._self, this._then);

  final _GetPlaceMark _self;
  final $Res Function(_GetPlaceMark) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,}) {
  return _then(_GetPlaceMark(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Position,
  ));
}


}

/// @nodoc
mixin _$LocationState {

 bool get isLoading; String get titleError; String get messageError; Position? get position; Alert? get alert; Map<String, double>? get locations; String? get location; double get latitude; double get longitude;
/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationStateCopyWith<LocationState> get copyWith => _$LocationStateCopyWithImpl<LocationState>(this as LocationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.messageError, messageError) || other.messageError == messageError)&&(identical(other.position, position) || other.position == position)&&(identical(other.alert, alert) || other.alert == alert)&&const DeepCollectionEquality().equals(other.locations, locations)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,titleError,messageError,position,alert,const DeepCollectionEquality().hash(locations),location,latitude,longitude);

@override
String toString() {
  return 'LocationState(isLoading: $isLoading, titleError: $titleError, messageError: $messageError, position: $position, alert: $alert, locations: $locations, location: $location, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $LocationStateCopyWith<$Res>  {
  factory $LocationStateCopyWith(LocationState value, $Res Function(LocationState) _then) = _$LocationStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String titleError, String messageError, Position? position, Alert? alert, Map<String, double>? locations, String? location, double latitude, double longitude
});




}
/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._self, this._then);

  final LocationState _self;
  final $Res Function(LocationState) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? titleError = null,Object? messageError = null,Object? position = freezed,Object? alert = freezed,Object? locations = freezed,Object? location = freezed,Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,titleError: null == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String,messageError: null == messageError ? _self.messageError : messageError // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Position?,alert: freezed == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as Alert?,locations: freezed == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationState].
extension LocationStatePatterns on LocationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationState value)  $default,){
final _that = this;
switch (_that) {
case _LocationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationState value)?  $default,){
final _that = this;
switch (_that) {
case _LocationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String titleError,  String messageError,  Position? position,  Alert? alert,  Map<String, double>? locations,  String? location,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationState() when $default != null:
return $default(_that.isLoading,_that.titleError,_that.messageError,_that.position,_that.alert,_that.locations,_that.location,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String titleError,  String messageError,  Position? position,  Alert? alert,  Map<String, double>? locations,  String? location,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _LocationState():
return $default(_that.isLoading,_that.titleError,_that.messageError,_that.position,_that.alert,_that.locations,_that.location,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String titleError,  String messageError,  Position? position,  Alert? alert,  Map<String, double>? locations,  String? location,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _LocationState() when $default != null:
return $default(_that.isLoading,_that.titleError,_that.messageError,_that.position,_that.alert,_that.locations,_that.location,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _LocationState implements LocationState {
  const _LocationState({required this.isLoading, required this.titleError, required this.messageError, required this.position, required this.alert, required final  Map<String, double>? locations, required this.location, required this.latitude, required this.longitude}): _locations = locations;
  

@override final  bool isLoading;
@override final  String titleError;
@override final  String messageError;
@override final  Position? position;
@override final  Alert? alert;
 final  Map<String, double>? _locations;
@override Map<String, double>? get locations {
  final value = _locations;
  if (value == null) return null;
  if (_locations is EqualUnmodifiableMapView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? location;
@override final  double latitude;
@override final  double longitude;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationStateCopyWith<_LocationState> get copyWith => __$LocationStateCopyWithImpl<_LocationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.messageError, messageError) || other.messageError == messageError)&&(identical(other.position, position) || other.position == position)&&(identical(other.alert, alert) || other.alert == alert)&&const DeepCollectionEquality().equals(other._locations, _locations)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,titleError,messageError,position,alert,const DeepCollectionEquality().hash(_locations),location,latitude,longitude);

@override
String toString() {
  return 'LocationState(isLoading: $isLoading, titleError: $titleError, messageError: $messageError, position: $position, alert: $alert, locations: $locations, location: $location, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$LocationStateCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory _$LocationStateCopyWith(_LocationState value, $Res Function(_LocationState) _then) = __$LocationStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String titleError, String messageError, Position? position, Alert? alert, Map<String, double>? locations, String? location, double latitude, double longitude
});




}
/// @nodoc
class __$LocationStateCopyWithImpl<$Res>
    implements _$LocationStateCopyWith<$Res> {
  __$LocationStateCopyWithImpl(this._self, this._then);

  final _LocationState _self;
  final $Res Function(_LocationState) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? titleError = null,Object? messageError = null,Object? position = freezed,Object? alert = freezed,Object? locations = freezed,Object? location = freezed,Object? latitude = null,Object? longitude = null,}) {
  return _then(_LocationState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,titleError: null == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String,messageError: null == messageError ? _self.messageError : messageError // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Position?,alert: freezed == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as Alert?,locations: freezed == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
