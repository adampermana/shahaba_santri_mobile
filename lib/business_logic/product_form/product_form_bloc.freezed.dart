// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductFormEvent()';
}


}

/// @nodoc
class $ProductFormEventCopyWith<$Res>  {
$ProductFormEventCopyWith(ProductFormEvent _, $Res Function(ProductFormEvent) __);
}


/// Adds pattern-matching-related methods to [ProductFormEvent].
extension ProductFormEventPatterns on ProductFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Submit value)?  submit,TResult Function( _NameChange value)?  nameChange,TResult Function( _DescriptionChange value)?  descriptionChange,TResult Function( _ProdusenChange value)?  produsenChange,TResult Function( _ImageChange value)?  imageChange,TResult Function( _BrandChange value)?  brandChange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Submit() when submit != null:
return submit(_that);case _NameChange() when nameChange != null:
return nameChange(_that);case _DescriptionChange() when descriptionChange != null:
return descriptionChange(_that);case _ProdusenChange() when produsenChange != null:
return produsenChange(_that);case _ImageChange() when imageChange != null:
return imageChange(_that);case _BrandChange() when brandChange != null:
return brandChange(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Submit value)  submit,required TResult Function( _NameChange value)  nameChange,required TResult Function( _DescriptionChange value)  descriptionChange,required TResult Function( _ProdusenChange value)  produsenChange,required TResult Function( _ImageChange value)  imageChange,required TResult Function( _BrandChange value)  brandChange,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Submit():
return submit(_that);case _NameChange():
return nameChange(_that);case _DescriptionChange():
return descriptionChange(_that);case _ProdusenChange():
return produsenChange(_that);case _ImageChange():
return imageChange(_that);case _BrandChange():
return brandChange(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Submit value)?  submit,TResult? Function( _NameChange value)?  nameChange,TResult? Function( _DescriptionChange value)?  descriptionChange,TResult? Function( _ProdusenChange value)?  produsenChange,TResult? Function( _ImageChange value)?  imageChange,TResult? Function( _BrandChange value)?  brandChange,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Submit() when submit != null:
return submit(_that);case _NameChange() when nameChange != null:
return nameChange(_that);case _DescriptionChange() when descriptionChange != null:
return descriptionChange(_that);case _ProdusenChange() when produsenChange != null:
return produsenChange(_that);case _ImageChange() when imageChange != null:
return imageChange(_that);case _BrandChange() when brandChange != null:
return brandChange(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String imagePath,  String name)?  started,TResult Function( Map<String, double> coordinates)?  submit,TResult Function( String val)?  nameChange,TResult Function( String val)?  descriptionChange,TResult Function( int val)?  produsenChange,TResult Function( String val)?  imageChange,TResult Function( int val)?  brandChange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.imagePath,_that.name);case _Submit() when submit != null:
return submit(_that.coordinates);case _NameChange() when nameChange != null:
return nameChange(_that.val);case _DescriptionChange() when descriptionChange != null:
return descriptionChange(_that.val);case _ProdusenChange() when produsenChange != null:
return produsenChange(_that.val);case _ImageChange() when imageChange != null:
return imageChange(_that.val);case _BrandChange() when brandChange != null:
return brandChange(_that.val);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String imagePath,  String name)  started,required TResult Function( Map<String, double> coordinates)  submit,required TResult Function( String val)  nameChange,required TResult Function( String val)  descriptionChange,required TResult Function( int val)  produsenChange,required TResult Function( String val)  imageChange,required TResult Function( int val)  brandChange,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.imagePath,_that.name);case _Submit():
return submit(_that.coordinates);case _NameChange():
return nameChange(_that.val);case _DescriptionChange():
return descriptionChange(_that.val);case _ProdusenChange():
return produsenChange(_that.val);case _ImageChange():
return imageChange(_that.val);case _BrandChange():
return brandChange(_that.val);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String imagePath,  String name)?  started,TResult? Function( Map<String, double> coordinates)?  submit,TResult? Function( String val)?  nameChange,TResult? Function( String val)?  descriptionChange,TResult? Function( int val)?  produsenChange,TResult? Function( String val)?  imageChange,TResult? Function( int val)?  brandChange,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.imagePath,_that.name);case _Submit() when submit != null:
return submit(_that.coordinates);case _NameChange() when nameChange != null:
return nameChange(_that.val);case _DescriptionChange() when descriptionChange != null:
return descriptionChange(_that.val);case _ProdusenChange() when produsenChange != null:
return produsenChange(_that.val);case _ImageChange() when imageChange != null:
return imageChange(_that.val);case _BrandChange() when brandChange != null:
return brandChange(_that.val);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ProductFormEvent {
  const _Started(this.imagePath, this.name);
  

 final  String imagePath;
 final  String name;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath,name);

@override
String toString() {
  return 'ProductFormEvent.started(imagePath: $imagePath, name: $name)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $ProductFormEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String imagePath, String name
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? name = null,}) {
  return _then(_Started(
null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Submit implements ProductFormEvent {
  const _Submit(final  Map<String, double> coordinates): _coordinates = coordinates;
  

 final  Map<String, double> _coordinates;
 Map<String, double> get coordinates {
  if (_coordinates is EqualUnmodifiableMapView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coordinates);
}


/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitCopyWith<_Submit> get copyWith => __$SubmitCopyWithImpl<_Submit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submit&&const DeepCollectionEquality().equals(other._coordinates, _coordinates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_coordinates));

@override
String toString() {
  return 'ProductFormEvent.submit(coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$SubmitCopyWith<$Res> implements $ProductFormEventCopyWith<$Res> {
  factory _$SubmitCopyWith(_Submit value, $Res Function(_Submit) _then) = __$SubmitCopyWithImpl;
@useResult
$Res call({
 Map<String, double> coordinates
});




}
/// @nodoc
class __$SubmitCopyWithImpl<$Res>
    implements _$SubmitCopyWith<$Res> {
  __$SubmitCopyWithImpl(this._self, this._then);

  final _Submit _self;
  final $Res Function(_Submit) _then;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? coordinates = null,}) {
  return _then(_Submit(
null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

/// @nodoc


class _NameChange implements ProductFormEvent {
  const _NameChange(this.val);
  

 final  String val;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NameChangeCopyWith<_NameChange> get copyWith => __$NameChangeCopyWithImpl<_NameChange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NameChange&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'ProductFormEvent.nameChange(val: $val)';
}


}

/// @nodoc
abstract mixin class _$NameChangeCopyWith<$Res> implements $ProductFormEventCopyWith<$Res> {
  factory _$NameChangeCopyWith(_NameChange value, $Res Function(_NameChange) _then) = __$NameChangeCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$NameChangeCopyWithImpl<$Res>
    implements _$NameChangeCopyWith<$Res> {
  __$NameChangeCopyWithImpl(this._self, this._then);

  final _NameChange _self;
  final $Res Function(_NameChange) _then;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_NameChange(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DescriptionChange implements ProductFormEvent {
  const _DescriptionChange(this.val);
  

 final  String val;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DescriptionChangeCopyWith<_DescriptionChange> get copyWith => __$DescriptionChangeCopyWithImpl<_DescriptionChange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DescriptionChange&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'ProductFormEvent.descriptionChange(val: $val)';
}


}

/// @nodoc
abstract mixin class _$DescriptionChangeCopyWith<$Res> implements $ProductFormEventCopyWith<$Res> {
  factory _$DescriptionChangeCopyWith(_DescriptionChange value, $Res Function(_DescriptionChange) _then) = __$DescriptionChangeCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$DescriptionChangeCopyWithImpl<$Res>
    implements _$DescriptionChangeCopyWith<$Res> {
  __$DescriptionChangeCopyWithImpl(this._self, this._then);

  final _DescriptionChange _self;
  final $Res Function(_DescriptionChange) _then;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_DescriptionChange(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ProdusenChange implements ProductFormEvent {
  const _ProdusenChange(this.val);
  

 final  int val;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProdusenChangeCopyWith<_ProdusenChange> get copyWith => __$ProdusenChangeCopyWithImpl<_ProdusenChange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProdusenChange&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'ProductFormEvent.produsenChange(val: $val)';
}


}

/// @nodoc
abstract mixin class _$ProdusenChangeCopyWith<$Res> implements $ProductFormEventCopyWith<$Res> {
  factory _$ProdusenChangeCopyWith(_ProdusenChange value, $Res Function(_ProdusenChange) _then) = __$ProdusenChangeCopyWithImpl;
@useResult
$Res call({
 int val
});




}
/// @nodoc
class __$ProdusenChangeCopyWithImpl<$Res>
    implements _$ProdusenChangeCopyWith<$Res> {
  __$ProdusenChangeCopyWithImpl(this._self, this._then);

  final _ProdusenChange _self;
  final $Res Function(_ProdusenChange) _then;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_ProdusenChange(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ImageChange implements ProductFormEvent {
  const _ImageChange(this.val);
  

 final  String val;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageChangeCopyWith<_ImageChange> get copyWith => __$ImageChangeCopyWithImpl<_ImageChange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageChange&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'ProductFormEvent.imageChange(val: $val)';
}


}

/// @nodoc
abstract mixin class _$ImageChangeCopyWith<$Res> implements $ProductFormEventCopyWith<$Res> {
  factory _$ImageChangeCopyWith(_ImageChange value, $Res Function(_ImageChange) _then) = __$ImageChangeCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$ImageChangeCopyWithImpl<$Res>
    implements _$ImageChangeCopyWith<$Res> {
  __$ImageChangeCopyWithImpl(this._self, this._then);

  final _ImageChange _self;
  final $Res Function(_ImageChange) _then;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_ImageChange(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BrandChange implements ProductFormEvent {
  const _BrandChange(this.val);
  

 final  int val;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandChangeCopyWith<_BrandChange> get copyWith => __$BrandChangeCopyWithImpl<_BrandChange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandChange&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'ProductFormEvent.brandChange(val: $val)';
}


}

/// @nodoc
abstract mixin class _$BrandChangeCopyWith<$Res> implements $ProductFormEventCopyWith<$Res> {
  factory _$BrandChangeCopyWith(_BrandChange value, $Res Function(_BrandChange) _then) = __$BrandChangeCopyWithImpl;
@useResult
$Res call({
 int val
});




}
/// @nodoc
class __$BrandChangeCopyWithImpl<$Res>
    implements _$BrandChangeCopyWith<$Res> {
  __$BrandChangeCopyWithImpl(this._self, this._then);

  final _BrandChange _self;
  final $Res Function(_BrandChange) _then;

/// Create a copy of ProductFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_BrandChange(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProductFormState {

 GlobalKey<FormState> get formKey; String get name; String get description; int? get produsen; String get image; int? get brandId; bool get isLoadingInitiate; bool get isLoading; bool get isSuccess; bool get isShowErrorMessage; String? get errorMessage; List<DropdownItems> get dataBrand; List<DropdownItems> get dataProdusen;
/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFormStateCopyWith<ProductFormState> get copyWith => _$ProductFormStateCopyWithImpl<ProductFormState>(this as ProductFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFormState&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.produsen, produsen) || other.produsen == produsen)&&(identical(other.image, image) || other.image == image)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.isLoadingInitiate, isLoadingInitiate) || other.isLoadingInitiate == isLoadingInitiate)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isShowErrorMessage, isShowErrorMessage) || other.isShowErrorMessage == isShowErrorMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.dataBrand, dataBrand)&&const DeepCollectionEquality().equals(other.dataProdusen, dataProdusen));
}


@override
int get hashCode => Object.hash(runtimeType,formKey,name,description,produsen,image,brandId,isLoadingInitiate,isLoading,isSuccess,isShowErrorMessage,errorMessage,const DeepCollectionEquality().hash(dataBrand),const DeepCollectionEquality().hash(dataProdusen));

@override
String toString() {
  return 'ProductFormState(formKey: $formKey, name: $name, description: $description, produsen: $produsen, image: $image, brandId: $brandId, isLoadingInitiate: $isLoadingInitiate, isLoading: $isLoading, isSuccess: $isSuccess, isShowErrorMessage: $isShowErrorMessage, errorMessage: $errorMessage, dataBrand: $dataBrand, dataProdusen: $dataProdusen)';
}


}

/// @nodoc
abstract mixin class $ProductFormStateCopyWith<$Res>  {
  factory $ProductFormStateCopyWith(ProductFormState value, $Res Function(ProductFormState) _then) = _$ProductFormStateCopyWithImpl;
@useResult
$Res call({
 GlobalKey<FormState> formKey, String name, String description, int? produsen, String image, int? brandId, bool isLoadingInitiate, bool isLoading, bool isSuccess, bool isShowErrorMessage, String? errorMessage, List<DropdownItems> dataBrand, List<DropdownItems> dataProdusen
});




}
/// @nodoc
class _$ProductFormStateCopyWithImpl<$Res>
    implements $ProductFormStateCopyWith<$Res> {
  _$ProductFormStateCopyWithImpl(this._self, this._then);

  final ProductFormState _self;
  final $Res Function(ProductFormState) _then;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formKey = null,Object? name = null,Object? description = null,Object? produsen = freezed,Object? image = null,Object? brandId = freezed,Object? isLoadingInitiate = null,Object? isLoading = null,Object? isSuccess = null,Object? isShowErrorMessage = null,Object? errorMessage = freezed,Object? dataBrand = null,Object? dataProdusen = null,}) {
  return _then(_self.copyWith(
formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormState>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,produsen: freezed == produsen ? _self.produsen : produsen // ignore: cast_nullable_to_non_nullable
as int?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,isLoadingInitiate: null == isLoadingInitiate ? _self.isLoadingInitiate : isLoadingInitiate // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isShowErrorMessage: null == isShowErrorMessage ? _self.isShowErrorMessage : isShowErrorMessage // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,dataBrand: null == dataBrand ? _self.dataBrand : dataBrand // ignore: cast_nullable_to_non_nullable
as List<DropdownItems>,dataProdusen: null == dataProdusen ? _self.dataProdusen : dataProdusen // ignore: cast_nullable_to_non_nullable
as List<DropdownItems>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductFormState].
extension ProductFormStatePatterns on ProductFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductFormState value)  $default,){
final _that = this;
switch (_that) {
case _ProductFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GlobalKey<FormState> formKey,  String name,  String description,  int? produsen,  String image,  int? brandId,  bool isLoadingInitiate,  bool isLoading,  bool isSuccess,  bool isShowErrorMessage,  String? errorMessage,  List<DropdownItems> dataBrand,  List<DropdownItems> dataProdusen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
return $default(_that.formKey,_that.name,_that.description,_that.produsen,_that.image,_that.brandId,_that.isLoadingInitiate,_that.isLoading,_that.isSuccess,_that.isShowErrorMessage,_that.errorMessage,_that.dataBrand,_that.dataProdusen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GlobalKey<FormState> formKey,  String name,  String description,  int? produsen,  String image,  int? brandId,  bool isLoadingInitiate,  bool isLoading,  bool isSuccess,  bool isShowErrorMessage,  String? errorMessage,  List<DropdownItems> dataBrand,  List<DropdownItems> dataProdusen)  $default,) {final _that = this;
switch (_that) {
case _ProductFormState():
return $default(_that.formKey,_that.name,_that.description,_that.produsen,_that.image,_that.brandId,_that.isLoadingInitiate,_that.isLoading,_that.isSuccess,_that.isShowErrorMessage,_that.errorMessage,_that.dataBrand,_that.dataProdusen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GlobalKey<FormState> formKey,  String name,  String description,  int? produsen,  String image,  int? brandId,  bool isLoadingInitiate,  bool isLoading,  bool isSuccess,  bool isShowErrorMessage,  String? errorMessage,  List<DropdownItems> dataBrand,  List<DropdownItems> dataProdusen)?  $default,) {final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
return $default(_that.formKey,_that.name,_that.description,_that.produsen,_that.image,_that.brandId,_that.isLoadingInitiate,_that.isLoading,_that.isSuccess,_that.isShowErrorMessage,_that.errorMessage,_that.dataBrand,_that.dataProdusen);case _:
  return null;

}
}

}

/// @nodoc


class _ProductFormState implements ProductFormState {
  const _ProductFormState({required this.formKey, required this.name, required this.description, required this.produsen, required this.image, required this.brandId, required this.isLoadingInitiate, required this.isLoading, required this.isSuccess, required this.isShowErrorMessage, required this.errorMessage, required final  List<DropdownItems> dataBrand, required final  List<DropdownItems> dataProdusen}): _dataBrand = dataBrand,_dataProdusen = dataProdusen;
  

@override final  GlobalKey<FormState> formKey;
@override final  String name;
@override final  String description;
@override final  int? produsen;
@override final  String image;
@override final  int? brandId;
@override final  bool isLoadingInitiate;
@override final  bool isLoading;
@override final  bool isSuccess;
@override final  bool isShowErrorMessage;
@override final  String? errorMessage;
 final  List<DropdownItems> _dataBrand;
@override List<DropdownItems> get dataBrand {
  if (_dataBrand is EqualUnmodifiableListView) return _dataBrand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataBrand);
}

 final  List<DropdownItems> _dataProdusen;
@override List<DropdownItems> get dataProdusen {
  if (_dataProdusen is EqualUnmodifiableListView) return _dataProdusen;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataProdusen);
}


/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFormStateCopyWith<_ProductFormState> get copyWith => __$ProductFormStateCopyWithImpl<_ProductFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFormState&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.produsen, produsen) || other.produsen == produsen)&&(identical(other.image, image) || other.image == image)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.isLoadingInitiate, isLoadingInitiate) || other.isLoadingInitiate == isLoadingInitiate)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isShowErrorMessage, isShowErrorMessage) || other.isShowErrorMessage == isShowErrorMessage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._dataBrand, _dataBrand)&&const DeepCollectionEquality().equals(other._dataProdusen, _dataProdusen));
}


@override
int get hashCode => Object.hash(runtimeType,formKey,name,description,produsen,image,brandId,isLoadingInitiate,isLoading,isSuccess,isShowErrorMessage,errorMessage,const DeepCollectionEquality().hash(_dataBrand),const DeepCollectionEquality().hash(_dataProdusen));

@override
String toString() {
  return 'ProductFormState(formKey: $formKey, name: $name, description: $description, produsen: $produsen, image: $image, brandId: $brandId, isLoadingInitiate: $isLoadingInitiate, isLoading: $isLoading, isSuccess: $isSuccess, isShowErrorMessage: $isShowErrorMessage, errorMessage: $errorMessage, dataBrand: $dataBrand, dataProdusen: $dataProdusen)';
}


}

/// @nodoc
abstract mixin class _$ProductFormStateCopyWith<$Res> implements $ProductFormStateCopyWith<$Res> {
  factory _$ProductFormStateCopyWith(_ProductFormState value, $Res Function(_ProductFormState) _then) = __$ProductFormStateCopyWithImpl;
@override @useResult
$Res call({
 GlobalKey<FormState> formKey, String name, String description, int? produsen, String image, int? brandId, bool isLoadingInitiate, bool isLoading, bool isSuccess, bool isShowErrorMessage, String? errorMessage, List<DropdownItems> dataBrand, List<DropdownItems> dataProdusen
});




}
/// @nodoc
class __$ProductFormStateCopyWithImpl<$Res>
    implements _$ProductFormStateCopyWith<$Res> {
  __$ProductFormStateCopyWithImpl(this._self, this._then);

  final _ProductFormState _self;
  final $Res Function(_ProductFormState) _then;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formKey = null,Object? name = null,Object? description = null,Object? produsen = freezed,Object? image = null,Object? brandId = freezed,Object? isLoadingInitiate = null,Object? isLoading = null,Object? isSuccess = null,Object? isShowErrorMessage = null,Object? errorMessage = freezed,Object? dataBrand = null,Object? dataProdusen = null,}) {
  return _then(_ProductFormState(
formKey: null == formKey ? _self.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormState>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,produsen: freezed == produsen ? _self.produsen : produsen // ignore: cast_nullable_to_non_nullable
as int?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,isLoadingInitiate: null == isLoadingInitiate ? _self.isLoadingInitiate : isLoadingInitiate // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isShowErrorMessage: null == isShowErrorMessage ? _self.isShowErrorMessage : isShowErrorMessage // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,dataBrand: null == dataBrand ? _self._dataBrand : dataBrand // ignore: cast_nullable_to_non_nullable
as List<DropdownItems>,dataProdusen: null == dataProdusen ? _self._dataProdusen : dataProdusen // ignore: cast_nullable_to_non_nullable
as List<DropdownItems>,
  ));
}


}

// dart format on
