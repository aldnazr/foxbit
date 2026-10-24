// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_ohlc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinOhlc {

 int get timestampMs; double get open; double get high; double get low; double get close;
/// Create a copy of CoinOhlc
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinOhlcCopyWith<CoinOhlc> get copyWith => _$CoinOhlcCopyWithImpl<CoinOhlc>(this as CoinOhlc, _$identity);

  /// Serializes this CoinOhlc to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CoinOhlc;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinOhlc&&(identical(other.timestampMs, _this.timestampMs) || other.timestampMs == _this.timestampMs)&&(identical(other.open, _this.open) || other.open == _this.open)&&(identical(other.high, _this.high) || other.high == _this.high)&&(identical(other.low, _this.low) || other.low == _this.low)&&(identical(other.close, _this.close) || other.close == _this.close));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CoinOhlc;
  return Object.hash(runtimeType,_this.timestampMs,_this.open,_this.high,_this.low,_this.close);
}

@override
String toString() {
  final _this = this as CoinOhlc;
  return 'CoinOhlc(timestampMs: ${_this.timestampMs}, open: ${_this.open}, high: ${_this.high}, low: ${_this.low}, close: ${_this.close})';
}


}

/// @nodoc
abstract mixin class $CoinOhlcCopyWith<$Res>  {
  factory $CoinOhlcCopyWith(CoinOhlc value, $Res Function(CoinOhlc) _then) = _$CoinOhlcCopyWithImpl;
@useResult
$Res call({
 int timestampMs, double open, double high, double low, double close
});




}
/// @nodoc
class _$CoinOhlcCopyWithImpl<$Res>
    implements $CoinOhlcCopyWith<$Res> {
  _$CoinOhlcCopyWithImpl(this._self, this._then);

  final CoinOhlc _self;
  final $Res Function(CoinOhlc) _then;

/// Create a copy of CoinOhlc
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestampMs = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,}) {
  return _then(CoinOhlc(
timestampMs: null == timestampMs ? _self.timestampMs : timestampMs // ignore: cast_nullable_to_non_nullable
as int,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinOhlc].
extension CoinOhlcPatterns on CoinOhlc {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinOhlc value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinOhlc() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinOhlc value)  $default,){
final _that = this;
switch (_that) {
case _CoinOhlc():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinOhlc value)?  $default,){
final _that = this;
switch (_that) {
case _CoinOhlc() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int timestampMs,  double open,  double high,  double low,  double close)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinOhlc() when $default != null:
return $default(_that.timestampMs,_that.open,_that.high,_that.low,_that.close);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int timestampMs,  double open,  double high,  double low,  double close)  $default,) {final _that = this;
switch (_that) {
case _CoinOhlc():
return $default(_that.timestampMs,_that.open,_that.high,_that.low,_that.close);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int timestampMs,  double open,  double high,  double low,  double close)?  $default,) {final _that = this;
switch (_that) {
case _CoinOhlc() when $default != null:
return $default(_that.timestampMs,_that.open,_that.high,_that.low,_that.close);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinOhlc extends CoinOhlc {
  const _CoinOhlc({required this.timestampMs, required this.open, required this.high, required this.low, required this.close}): super._();
  factory _CoinOhlc.fromJson(Map<String, dynamic> json) => _$CoinOhlcFromJson(json);

@override final  int timestampMs;
@override final  double open;
@override final  double high;
@override final  double low;
@override final  double close;

/// Create a copy of CoinOhlc
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinOhlcCopyWith<_CoinOhlc> get copyWith => __$CoinOhlcCopyWithImpl<_CoinOhlc>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinOhlcToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinOhlc&&(identical(other.timestampMs, timestampMs) || other.timestampMs == timestampMs)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.close, close) || other.close == close));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,timestampMs,open,high,low,close);
}

@override
String toString() {
    return 'CoinOhlc(timestampMs: $timestampMs, open: $open, high: $high, low: $low, close: $close)';
}


}

/// @nodoc
abstract mixin class _$CoinOhlcCopyWith<$Res> implements $CoinOhlcCopyWith<$Res> {
  factory _$CoinOhlcCopyWith(_CoinOhlc value, $Res Function(_CoinOhlc) _then) = __$CoinOhlcCopyWithImpl;
@override @useResult
$Res call({
 int timestampMs, double open, double high, double low, double close
});




}
/// @nodoc
class __$CoinOhlcCopyWithImpl<$Res>
    implements _$CoinOhlcCopyWith<$Res> {
  __$CoinOhlcCopyWithImpl(this._self, this._then);

  final _CoinOhlc _self;
  final $Res Function(_CoinOhlc) _then;

/// Create a copy of CoinOhlc
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestampMs = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,}) {
  return _then(_CoinOhlc(
timestampMs: null == timestampMs ? _self.timestampMs : timestampMs // ignore: cast_nullable_to_non_nullable
as int,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
