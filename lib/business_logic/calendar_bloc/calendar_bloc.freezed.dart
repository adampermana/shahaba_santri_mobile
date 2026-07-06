// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent()';
}


}

/// @nodoc
class $CalendarEventCopyWith<$Res>  {
$CalendarEventCopyWith(CalendarEvent _, $Res Function(CalendarEvent) __);
}


/// Adds pattern-matching-related methods to [CalendarEvent].
extension CalendarEventPatterns on CalendarEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadHolidays value)?  loadHolidays,TResult Function( _ChangeMonth value)?  changeMonth,TResult Function( _SelectDate value)?  selectDate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadHolidays() when loadHolidays != null:
return loadHolidays(_that);case _ChangeMonth() when changeMonth != null:
return changeMonth(_that);case _SelectDate() when selectDate != null:
return selectDate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadHolidays value)  loadHolidays,required TResult Function( _ChangeMonth value)  changeMonth,required TResult Function( _SelectDate value)  selectDate,}){
final _that = this;
switch (_that) {
case _LoadHolidays():
return loadHolidays(_that);case _ChangeMonth():
return changeMonth(_that);case _SelectDate():
return selectDate(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadHolidays value)?  loadHolidays,TResult? Function( _ChangeMonth value)?  changeMonth,TResult? Function( _SelectDate value)?  selectDate,}){
final _that = this;
switch (_that) {
case _LoadHolidays() when loadHolidays != null:
return loadHolidays(_that);case _ChangeMonth() when changeMonth != null:
return changeMonth(_that);case _SelectDate() when selectDate != null:
return selectDate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadHolidays,TResult Function( int delta)?  changeMonth,TResult Function( DateTime date)?  selectDate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadHolidays() when loadHolidays != null:
return loadHolidays();case _ChangeMonth() when changeMonth != null:
return changeMonth(_that.delta);case _SelectDate() when selectDate != null:
return selectDate(_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadHolidays,required TResult Function( int delta)  changeMonth,required TResult Function( DateTime date)  selectDate,}) {final _that = this;
switch (_that) {
case _LoadHolidays():
return loadHolidays();case _ChangeMonth():
return changeMonth(_that.delta);case _SelectDate():
return selectDate(_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadHolidays,TResult? Function( int delta)?  changeMonth,TResult? Function( DateTime date)?  selectDate,}) {final _that = this;
switch (_that) {
case _LoadHolidays() when loadHolidays != null:
return loadHolidays();case _ChangeMonth() when changeMonth != null:
return changeMonth(_that.delta);case _SelectDate() when selectDate != null:
return selectDate(_that.date);case _:
  return null;

}
}

}

/// @nodoc


class _LoadHolidays implements CalendarEvent {
  const _LoadHolidays();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadHolidays);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.loadHolidays()';
}


}




/// @nodoc


class _ChangeMonth implements CalendarEvent {
  const _ChangeMonth(this.delta);
  

 final  int delta;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeMonthCopyWith<_ChangeMonth> get copyWith => __$ChangeMonthCopyWithImpl<_ChangeMonth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeMonth&&(identical(other.delta, delta) || other.delta == delta));
}


@override
int get hashCode => Object.hash(runtimeType,delta);

@override
String toString() {
  return 'CalendarEvent.changeMonth(delta: $delta)';
}


}

/// @nodoc
abstract mixin class _$ChangeMonthCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$ChangeMonthCopyWith(_ChangeMonth value, $Res Function(_ChangeMonth) _then) = __$ChangeMonthCopyWithImpl;
@useResult
$Res call({
 int delta
});




}
/// @nodoc
class __$ChangeMonthCopyWithImpl<$Res>
    implements _$ChangeMonthCopyWith<$Res> {
  __$ChangeMonthCopyWithImpl(this._self, this._then);

  final _ChangeMonth _self;
  final $Res Function(_ChangeMonth) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? delta = null,}) {
  return _then(_ChangeMonth(
null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SelectDate implements CalendarEvent {
  const _SelectDate(this.date);
  

 final  DateTime date;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectDateCopyWith<_SelectDate> get copyWith => __$SelectDateCopyWithImpl<_SelectDate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectDate&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'CalendarEvent.selectDate(date: $date)';
}


}

/// @nodoc
abstract mixin class _$SelectDateCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$SelectDateCopyWith(_SelectDate value, $Res Function(_SelectDate) _then) = __$SelectDateCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class __$SelectDateCopyWithImpl<$Res>
    implements _$SelectDateCopyWith<$Res> {
  __$SelectDateCopyWithImpl(this._self, this._then);

  final _SelectDate _self;
  final $Res Function(_SelectDate) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(_SelectDate(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$CalendarState {

 bool get isLoading; bool get isSuccess; String get errorMessage; List<IslamicHolidayModel> get holidays; DateTime get focusedMonth; DateTime get selectedDate;
/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarStateCopyWith<CalendarState> get copyWith => _$CalendarStateCopyWithImpl<CalendarState>(this as CalendarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.holidays, holidays)&&(identical(other.focusedMonth, focusedMonth) || other.focusedMonth == focusedMonth)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,errorMessage,const DeepCollectionEquality().hash(holidays),focusedMonth,selectedDate);

@override
String toString() {
  return 'CalendarState(isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage, holidays: $holidays, focusedMonth: $focusedMonth, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class $CalendarStateCopyWith<$Res>  {
  factory $CalendarStateCopyWith(CalendarState value, $Res Function(CalendarState) _then) = _$CalendarStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSuccess, String errorMessage, List<IslamicHolidayModel> holidays, DateTime focusedMonth, DateTime selectedDate
});




}
/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._self, this._then);

  final CalendarState _self;
  final $Res Function(CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = null,Object? holidays = null,Object? focusedMonth = null,Object? selectedDate = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,holidays: null == holidays ? _self.holidays : holidays // ignore: cast_nullable_to_non_nullable
as List<IslamicHolidayModel>,focusedMonth: null == focusedMonth ? _self.focusedMonth : focusedMonth // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarState].
extension CalendarStatePatterns on CalendarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarState value)  $default,){
final _that = this;
switch (_that) {
case _CalendarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarState value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  String errorMessage,  List<IslamicHolidayModel> holidays,  DateTime focusedMonth,  DateTime selectedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.errorMessage,_that.holidays,_that.focusedMonth,_that.selectedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  String errorMessage,  List<IslamicHolidayModel> holidays,  DateTime focusedMonth,  DateTime selectedDate)  $default,) {final _that = this;
switch (_that) {
case _CalendarState():
return $default(_that.isLoading,_that.isSuccess,_that.errorMessage,_that.holidays,_that.focusedMonth,_that.selectedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSuccess,  String errorMessage,  List<IslamicHolidayModel> holidays,  DateTime focusedMonth,  DateTime selectedDate)?  $default,) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.errorMessage,_that.holidays,_that.focusedMonth,_that.selectedDate);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarState implements CalendarState {
  const _CalendarState({this.isLoading = false, this.isSuccess = false, this.errorMessage = '', final  List<IslamicHolidayModel> holidays = const <IslamicHolidayModel>[], required this.focusedMonth, required this.selectedDate}): _holidays = holidays;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  String errorMessage;
 final  List<IslamicHolidayModel> _holidays;
@override@JsonKey() List<IslamicHolidayModel> get holidays {
  if (_holidays is EqualUnmodifiableListView) return _holidays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_holidays);
}

@override final  DateTime focusedMonth;
@override final  DateTime selectedDate;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarStateCopyWith<_CalendarState> get copyWith => __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._holidays, _holidays)&&(identical(other.focusedMonth, focusedMonth) || other.focusedMonth == focusedMonth)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,errorMessage,const DeepCollectionEquality().hash(_holidays),focusedMonth,selectedDate);

@override
String toString() {
  return 'CalendarState(isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage, holidays: $holidays, focusedMonth: $focusedMonth, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class _$CalendarStateCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(_CalendarState value, $Res Function(_CalendarState) _then) = __$CalendarStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSuccess, String errorMessage, List<IslamicHolidayModel> holidays, DateTime focusedMonth, DateTime selectedDate
});




}
/// @nodoc
class __$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(this._self, this._then);

  final _CalendarState _self;
  final $Res Function(_CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = null,Object? holidays = null,Object? focusedMonth = null,Object? selectedDate = null,}) {
  return _then(_CalendarState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,holidays: null == holidays ? _self._holidays : holidays // ignore: cast_nullable_to_non_nullable
as List<IslamicHolidayModel>,focusedMonth: null == focusedMonth ? _self.focusedMonth : focusedMonth // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
