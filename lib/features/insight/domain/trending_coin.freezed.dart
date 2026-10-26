// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrendingCoin {

@JsonKey(defaultValue: '') String get id;@JsonKey(defaultValue: '') String get name;@JsonKey(defaultValue: '') String get symbol;@JsonKey(name: 'market_cap_rank', fromJson: _nullableIntFromJson, includeToJson: false) int? get marketCapRank;@JsonKey(name: 'small', includeToJson: false) String? get small;@JsonKey(name: 'thumb', includeToJson: false) String? get thumb;@JsonKey(name: 'data', fromJson: _priceChangeFromData, includeToJson: false) double? get priceChange24h;
/// Create a copy of TrendingCoin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendingCoinCopyWith<TrendingCoin> get copyWith => _$TrendingCoinCopyWithImpl<TrendingCoin>(this as TrendingCoin, _$identity);

  /// Serializes this TrendingCoin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrendingCoin;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingCoin&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.marketCapRank, _this.marketCapRank) || other.marketCapRank == _this.marketCapRank)&&(identical(other.small, _this.small) || other.small == _this.small)&&(identical(other.thumb, _this.thumb) || other.thumb == _this.thumb)&&(identical(other.priceChange24h, _this.priceChange24h) || other.priceChange24h == _this.priceChange24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrendingCoin;
  return Object.hash(runtimeType,_this.id,_this.name,_this.symbol,_this.marketCapRank,_this.small,_this.thumb,_this.priceChange24h);
}

@override
String toString() {
  final _this = this as TrendingCoin;
  return 'TrendingCoin(id: ${_this.id}, name: ${_this.name}, symbol: ${_this.symbol}, marketCapRank: ${_this.marketCapRank}, small: ${_this.small}, thumb: ${_this.thumb}, priceChange24h: ${_this.priceChange24h})';
}


}

/// @nodoc
abstract mixin class $TrendingCoinCopyWith<$Res>  {
  factory $TrendingCoinCopyWith(TrendingCoin value, $Res Function(TrendingCoin) _then) = _$TrendingCoinCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: '') String id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String symbol,@JsonKey(name: 'market_cap_rank', fromJson: _nullableIntFromJson, includeToJson: false) int? marketCapRank,@JsonKey(name: 'small', includeToJson: false) String? small,@JsonKey(name: 'thumb', includeToJson: false) String? thumb,@JsonKey(name: 'data', fromJson: _priceChangeFromData, includeToJson: false) double? priceChange24h
});




}
/// @nodoc
class _$TrendingCoinCopyWithImpl<$Res>
    implements $TrendingCoinCopyWith<$Res> {
  _$TrendingCoinCopyWithImpl(this._self, this._then);

  final TrendingCoin _self;
  final $Res Function(TrendingCoin) _then;

/// Create a copy of TrendingCoin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? symbol = null,Object? marketCapRank = freezed,Object? small = freezed,Object? thumb = freezed,Object? priceChange24h = freezed,}) {
  return _then(TrendingCoin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,small: freezed == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String?,thumb: freezed == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrendingCoin].
extension TrendingCoinPatterns on TrendingCoin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrendingCoin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrendingCoin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrendingCoin value)  $default,){
final _that = this;
switch (_that) {
case _TrendingCoin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrendingCoin value)?  $default,){
final _that = this;
switch (_that) {
case _TrendingCoin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String symbol, @JsonKey(name: 'market_cap_rank', fromJson: _nullableIntFromJson, includeToJson: false)  int? marketCapRank, @JsonKey(name: 'small', includeToJson: false)  String? small, @JsonKey(name: 'thumb', includeToJson: false)  String? thumb, @JsonKey(name: 'data', fromJson: _priceChangeFromData, includeToJson: false)  double? priceChange24h)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrendingCoin() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.marketCapRank,_that.small,_that.thumb,_that.priceChange24h);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String symbol, @JsonKey(name: 'market_cap_rank', fromJson: _nullableIntFromJson, includeToJson: false)  int? marketCapRank, @JsonKey(name: 'small', includeToJson: false)  String? small, @JsonKey(name: 'thumb', includeToJson: false)  String? thumb, @JsonKey(name: 'data', fromJson: _priceChangeFromData, includeToJson: false)  double? priceChange24h)  $default,) {final _that = this;
switch (_that) {
case _TrendingCoin():
return $default(_that.id,_that.name,_that.symbol,_that.marketCapRank,_that.small,_that.thumb,_that.priceChange24h);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: '')  String id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String symbol, @JsonKey(name: 'market_cap_rank', fromJson: _nullableIntFromJson, includeToJson: false)  int? marketCapRank, @JsonKey(name: 'small', includeToJson: false)  String? small, @JsonKey(name: 'thumb', includeToJson: false)  String? thumb, @JsonKey(name: 'data', fromJson: _priceChangeFromData, includeToJson: false)  double? priceChange24h)?  $default,) {final _that = this;
switch (_that) {
case _TrendingCoin() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.marketCapRank,_that.small,_that.thumb,_that.priceChange24h);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrendingCoin extends TrendingCoin {
  const _TrendingCoin({@JsonKey(defaultValue: '') required this.id, @JsonKey(defaultValue: '') required this.name, @JsonKey(defaultValue: '') required this.symbol, @JsonKey(name: 'market_cap_rank', fromJson: _nullableIntFromJson, includeToJson: false) this.marketCapRank, @JsonKey(name: 'small', includeToJson: false) this.small, @JsonKey(name: 'thumb', includeToJson: false) this.thumb, @JsonKey(name: 'data', fromJson: _priceChangeFromData, includeToJson: false) this.priceChange24h}): super._();
  factory _TrendingCoin.fromJson(Map<String, dynamic> json) => _$TrendingCoinFromJson(json);

@override@JsonKey(defaultValue: '') final  String id;
@override@JsonKey(defaultValue: '') final  String name;
@override@JsonKey(defaultValue: '') final  String symbol;
@override@JsonKey(name: 'market_cap_rank', fromJson: _nullableIntFromJson, includeToJson: false) final  int? marketCapRank;
@override@JsonKey(name: 'small', includeToJson: false) final  String? small;
@override@JsonKey(name: 'thumb', includeToJson: false) final  String? thumb;
@override@JsonKey(name: 'data', fromJson: _priceChangeFromData, includeToJson: false) final  double? priceChange24h;

/// Create a copy of TrendingCoin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendingCoinCopyWith<_TrendingCoin> get copyWith => __$TrendingCoinCopyWithImpl<_TrendingCoin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrendingCoinToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendingCoin&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.small, small) || other.small == small)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.priceChange24h, priceChange24h) || other.priceChange24h == priceChange24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,symbol,marketCapRank,small,thumb,priceChange24h);
}

@override
String toString() {
    return 'TrendingCoin(id: $id, name: $name, symbol: $symbol, marketCapRank: $marketCapRank, small: $small, thumb: $thumb, priceChange24h: $priceChange24h)';
}


}

/// @nodoc
abstract mixin class _$TrendingCoinCopyWith<$Res> implements $TrendingCoinCopyWith<$Res> {
  factory _$TrendingCoinCopyWith(_TrendingCoin value, $Res Function(_TrendingCoin) _then) = __$TrendingCoinCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: '') String id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String symbol,@JsonKey(name: 'market_cap_rank', fromJson: _nullableIntFromJson, includeToJson: false) int? marketCapRank,@JsonKey(name: 'small', includeToJson: false) String? small,@JsonKey(name: 'thumb', includeToJson: false) String? thumb,@JsonKey(name: 'data', fromJson: _priceChangeFromData, includeToJson: false) double? priceChange24h
});




}
/// @nodoc
class __$TrendingCoinCopyWithImpl<$Res>
    implements _$TrendingCoinCopyWith<$Res> {
  __$TrendingCoinCopyWithImpl(this._self, this._then);

  final _TrendingCoin _self;
  final $Res Function(_TrendingCoin) _then;

/// Create a copy of TrendingCoin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? symbol = null,Object? marketCapRank = freezed,Object? small = freezed,Object? thumb = freezed,Object? priceChange24h = freezed,}) {
  return _then(_TrendingCoin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,small: freezed == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String?,thumb: freezed == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
