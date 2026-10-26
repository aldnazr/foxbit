// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinDetailState {

 CoinDetail? get detail; List<CoinOhlc>? get ohlc; String get range; bool get isRangeLoading;
/// Create a copy of CoinDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinDetailStateCopyWith<CoinDetailState> get copyWith => _$CoinDetailStateCopyWithImpl<CoinDetailState>(this as CoinDetailState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CoinDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinDetailState&&(identical(other.detail, _this.detail) || other.detail == _this.detail)&&const DeepCollectionEquality().equals(other.ohlc, _this.ohlc)&&(identical(other.range, _this.range) || other.range == _this.range)&&(identical(other.isRangeLoading, _this.isRangeLoading) || other.isRangeLoading == _this.isRangeLoading));
}


@override
int get hashCode {
  final _this = this as CoinDetailState;
  return Object.hash(runtimeType,_this.detail,const DeepCollectionEquality().hash(_this.ohlc),_this.range,_this.isRangeLoading);
}

@override
String toString() {
  final _this = this as CoinDetailState;
  return 'CoinDetailState(detail: ${_this.detail}, ohlc: ${_this.ohlc}, range: ${_this.range}, isRangeLoading: ${_this.isRangeLoading})';
}


}

/// @nodoc
abstract mixin class $CoinDetailStateCopyWith<$Res>  {
  factory $CoinDetailStateCopyWith(CoinDetailState value, $Res Function(CoinDetailState) _then) = _$CoinDetailStateCopyWithImpl;
@useResult
$Res call({
 CoinDetail? detail, List<CoinOhlc>? ohlc, String range, bool isRangeLoading
});


$CoinDetailCopyWith<$Res>? get detail;

}
/// @nodoc
class _$CoinDetailStateCopyWithImpl<$Res>
    implements $CoinDetailStateCopyWith<$Res> {
  _$CoinDetailStateCopyWithImpl(this._self, this._then);

  final CoinDetailState _self;
  final $Res Function(CoinDetailState) _then;

/// Create a copy of CoinDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? detail = freezed,Object? ohlc = freezed,Object? range = null,Object? isRangeLoading = null,}) {
  return _then(CoinDetailState(
detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as CoinDetail?,ohlc: freezed == ohlc ? _self.ohlc : ohlc // ignore: cast_nullable_to_non_nullable
as List<CoinOhlc>?,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as String,isRangeLoading: null == isRangeLoading ? _self.isRangeLoading : isRangeLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CoinDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoinDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $CoinDetailCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoinDetailState].
extension CoinDetailStatePatterns on CoinDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinDetailState value)  $default,){
final _that = this;
switch (_that) {
case _CoinDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _CoinDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CoinDetail? detail,  List<CoinOhlc>? ohlc,  String range,  bool isRangeLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinDetailState() when $default != null:
return $default(_that.detail,_that.ohlc,_that.range,_that.isRangeLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CoinDetail? detail,  List<CoinOhlc>? ohlc,  String range,  bool isRangeLoading)  $default,) {final _that = this;
switch (_that) {
case _CoinDetailState():
return $default(_that.detail,_that.ohlc,_that.range,_that.isRangeLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CoinDetail? detail,  List<CoinOhlc>? ohlc,  String range,  bool isRangeLoading)?  $default,) {final _that = this;
switch (_that) {
case _CoinDetailState() when $default != null:
return $default(_that.detail,_that.ohlc,_that.range,_that.isRangeLoading);case _:
  return null;

}
}

}

/// @nodoc


class _CoinDetailState implements CoinDetailState {
  const _CoinDetailState({this.detail,  List<CoinOhlc>? ohlc, this.range = '1D', this.isRangeLoading = false}): _ohlc = ohlc;
  

@override final  CoinDetail? detail;
 final  List<CoinOhlc>? _ohlc;
@override List<CoinOhlc>? get ohlc {
  final value = _ohlc;
  if (value == null) return null;
  if (_ohlc is EqualUnmodifiableListView) return _ohlc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  String range;
@override@JsonKey() final  bool isRangeLoading;

/// Create a copy of CoinDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinDetailStateCopyWith<_CoinDetailState> get copyWith => __$CoinDetailStateCopyWithImpl<_CoinDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinDetailState&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other.ohlc, _ohlc)&&(identical(other.range, range) || other.range == range)&&(identical(other.isRangeLoading, isRangeLoading) || other.isRangeLoading == isRangeLoading));
}


@override
int get hashCode {
    return Object.hash(runtimeType,detail,const DeepCollectionEquality().hash(_ohlc),range,isRangeLoading);
}

@override
String toString() {
    return 'CoinDetailState(detail: $detail, ohlc: $ohlc, range: $range, isRangeLoading: $isRangeLoading)';
}


}

/// @nodoc
abstract mixin class _$CoinDetailStateCopyWith<$Res> implements $CoinDetailStateCopyWith<$Res> {
  factory _$CoinDetailStateCopyWith(_CoinDetailState value, $Res Function(_CoinDetailState) _then) = __$CoinDetailStateCopyWithImpl;
@override @useResult
$Res call({
 CoinDetail? detail, List<CoinOhlc>? ohlc, String range, bool isRangeLoading
});


@override $CoinDetailCopyWith<$Res>? get detail;

}
/// @nodoc
class __$CoinDetailStateCopyWithImpl<$Res>
    implements _$CoinDetailStateCopyWith<$Res> {
  __$CoinDetailStateCopyWithImpl(this._self, this._then);

  final _CoinDetailState _self;
  final $Res Function(_CoinDetailState) _then;

/// Create a copy of CoinDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detail = freezed,Object? ohlc = freezed,Object? range = null,Object? isRangeLoading = null,}) {
  return _then(_CoinDetailState(
detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as CoinDetail?,ohlc: freezed == ohlc ? _self._ohlc : ohlc // ignore: cast_nullable_to_non_nullable
as List<CoinOhlc>?,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as String,isRangeLoading: null == isRangeLoading ? _self.isRangeLoading : isRangeLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CoinDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoinDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $CoinDetailCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}

// dart format on
