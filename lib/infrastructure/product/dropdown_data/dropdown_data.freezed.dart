// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dropdown_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DropdownDataResponse {

 List<DropdownItems> get data;
/// Create a copy of DropdownDataResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropdownDataResponseCopyWith<DropdownDataResponse> get copyWith => _$DropdownDataResponseCopyWithImpl<DropdownDataResponse>(this as DropdownDataResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DropdownDataResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DropdownDataResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $DropdownDataResponseCopyWith<$Res>  {
  factory $DropdownDataResponseCopyWith(DropdownDataResponse value, $Res Function(DropdownDataResponse) _then) = _$DropdownDataResponseCopyWithImpl;
@useResult
$Res call({
 List<DropdownItems> data
});




}
/// @nodoc
class _$DropdownDataResponseCopyWithImpl<$Res>
    implements $DropdownDataResponseCopyWith<$Res> {
  _$DropdownDataResponseCopyWithImpl(this._self, this._then);

  final DropdownDataResponse _self;
  final $Res Function(DropdownDataResponse) _then;

/// Create a copy of DropdownDataResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<DropdownItems>,
  ));
}

}


/// Adds pattern-matching-related methods to [DropdownDataResponse].
extension DropdownDataResponsePatterns on DropdownDataResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DropdownDataResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DropdownDataResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DropdownDataResponse value)  $default,){
final _that = this;
switch (_that) {
case _DropdownDataResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DropdownDataResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DropdownDataResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DropdownItems> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DropdownDataResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DropdownItems> data)  $default,) {final _that = this;
switch (_that) {
case _DropdownDataResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DropdownItems> data)?  $default,) {final _that = this;
switch (_that) {
case _DropdownDataResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _DropdownDataResponse implements DropdownDataResponse {
  const _DropdownDataResponse({final  List<DropdownItems> data = const []}): _data = data;
  factory _DropdownDataResponse.fromJson(Map<String, dynamic> json) => _$DropdownDataResponseFromJson(json);

 final  List<DropdownItems> _data;
@override@JsonKey() List<DropdownItems> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of DropdownDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropdownDataResponseCopyWith<_DropdownDataResponse> get copyWith => __$DropdownDataResponseCopyWithImpl<_DropdownDataResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DropdownDataResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'DropdownDataResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$DropdownDataResponseCopyWith<$Res> implements $DropdownDataResponseCopyWith<$Res> {
  factory _$DropdownDataResponseCopyWith(_DropdownDataResponse value, $Res Function(_DropdownDataResponse) _then) = __$DropdownDataResponseCopyWithImpl;
@override @useResult
$Res call({
 List<DropdownItems> data
});




}
/// @nodoc
class __$DropdownDataResponseCopyWithImpl<$Res>
    implements _$DropdownDataResponseCopyWith<$Res> {
  __$DropdownDataResponseCopyWithImpl(this._self, this._then);

  final _DropdownDataResponse _self;
  final $Res Function(_DropdownDataResponse) _then;

/// Create a copy of DropdownDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_DropdownDataResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DropdownItems>,
  ));
}


}


/// @nodoc
mixin _$DropdownItems {

 int get id;@JsonKey(name: 'name') String get title;
/// Create a copy of DropdownItems
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropdownItemsCopyWith<DropdownItems> get copyWith => _$DropdownItemsCopyWithImpl<DropdownItems>(this as DropdownItems, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DropdownItems&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'DropdownItems(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $DropdownItemsCopyWith<$Res>  {
  factory $DropdownItemsCopyWith(DropdownItems value, $Res Function(DropdownItems) _then) = _$DropdownItemsCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'name') String title
});




}
/// @nodoc
class _$DropdownItemsCopyWithImpl<$Res>
    implements $DropdownItemsCopyWith<$Res> {
  _$DropdownItemsCopyWithImpl(this._self, this._then);

  final DropdownItems _self;
  final $Res Function(DropdownItems) _then;

/// Create a copy of DropdownItems
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DropdownItems].
extension DropdownItemsPatterns on DropdownItems {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DropdownItems value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DropdownItems() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DropdownItems value)  $default,){
final _that = this;
switch (_that) {
case _DropdownItems():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DropdownItems value)?  $default,){
final _that = this;
switch (_that) {
case _DropdownItems() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'name')  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DropdownItems() when $default != null:
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'name')  String title)  $default,) {final _that = this;
switch (_that) {
case _DropdownItems():
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'name')  String title)?  $default,) {final _that = this;
switch (_that) {
case _DropdownItems() when $default != null:
return $default(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _DropdownItems implements DropdownItems {
  const _DropdownItems({required this.id, @JsonKey(name: 'name') required this.title});
  factory _DropdownItems.fromJson(Map<String, dynamic> json) => _$DropdownItemsFromJson(json);

@override final  int id;
@override@JsonKey(name: 'name') final  String title;

/// Create a copy of DropdownItems
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropdownItemsCopyWith<_DropdownItems> get copyWith => __$DropdownItemsCopyWithImpl<_DropdownItems>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DropdownItems&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'DropdownItems(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$DropdownItemsCopyWith<$Res> implements $DropdownItemsCopyWith<$Res> {
  factory _$DropdownItemsCopyWith(_DropdownItems value, $Res Function(_DropdownItems) _then) = __$DropdownItemsCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'name') String title
});




}
/// @nodoc
class __$DropdownItemsCopyWithImpl<$Res>
    implements _$DropdownItemsCopyWith<$Res> {
  __$DropdownItemsCopyWithImpl(this._self, this._then);

  final _DropdownItems _self;
  final $Res Function(_DropdownItems) _then;

/// Create a copy of DropdownItems
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(_DropdownItems(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
