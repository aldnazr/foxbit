// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_market.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GlobalMarket {

@JsonKey(name: 'data', fromJson: _totalMarketCapUsdFromData, includeToJson: false) double get totalMarketCapUsd;@JsonKey(name: 'data', fromJson: _totalVolumeUsdFromData, includeToJson: false) double get totalVolumeUsd;@JsonKey(name: 'data', fromJson: _btcDominanceFromData, includeToJson: false) double get btcDominance;@JsonKey(name: 'data', fromJson: _ethDominanceFromData, includeToJson: false) double get ethDominance;@JsonKey(name: 'data', fromJson: _marketCapChange24hFromData, includeToJson: false) double get marketCapChange24h;
/// Create a copy of GlobalMarket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalMarketCopyWith<GlobalMarket> get copyWith => _$GlobalMarketCopyWithImpl<GlobalMarket>(this as GlobalMarket, _$identity);

  /// Serializes this GlobalMarket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GlobalMarket;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalMarket&&(identical(other.totalMarketCapUsd, _this.totalMarketCapUsd) || other.totalMarketCapUsd == _this.totalMarketCapUsd)&&(identical(other.totalVolumeUsd, _this.totalVolumeUsd) || other.totalVolumeUsd == _this.totalVolumeUsd)&&(identical(other.btcDominance, _this.btcDominance) || other.btcDominance == _this.btcDominance)&&(identical(other.ethDominance, _this.ethDominance) || other.ethDominance == _this.ethDominance)&&(identical(other.marketCapChange24h, _this.marketCapChange24h) || other.marketCapChange24h == _this.marketCapChange24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GlobalMarket;
  return Object.hash(runtimeType,_this.totalMarketCapUsd,_this.totalVolumeUsd,_this.btcDominance,_this.ethDominance,_this.marketCapChange24h);
}

@override
String toString() {
  final _this = this as GlobalMarket;
  return 'GlobalMarket(totalMarketCapUsd: ${_this.totalMarketCapUsd}, totalVolumeUsd: ${_this.totalVolumeUsd}, btcDominance: ${_this.btcDominance}, ethDominance: ${_this.ethDominance}, marketCapChange24h: ${_this.marketCapChange24h})';
}


}

/// @nodoc
abstract mixin class $GlobalMarketCopyWith<$Res>  {
  factory $GlobalMarketCopyWith(GlobalMarket value, $Res Function(GlobalMarket) _then) = _$GlobalMarketCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'data', fromJson: _totalMarketCapUsdFromData, includeToJson: false) double totalMarketCapUsd,@JsonKey(name: 'data', fromJson: _totalVolumeUsdFromData, includeToJson: false) double totalVolumeUsd,@JsonKey(name: 'data', fromJson: _btcDominanceFromData, includeToJson: false) double btcDominance,@JsonKey(name: 'data', fromJson: _ethDominanceFromData, includeToJson: false) double ethDominance,@JsonKey(name: 'data', fromJson: _marketCapChange24hFromData, includeToJson: false) double marketCapChange24h
});




}
/// @nodoc
class _$GlobalMarketCopyWithImpl<$Res>
    implements $GlobalMarketCopyWith<$Res> {
  _$GlobalMarketCopyWithImpl(this._self, this._then);

  final GlobalMarket _self;
  final $Res Function(GlobalMarket) _then;

/// Create a copy of GlobalMarket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalMarketCapUsd = null,Object? totalVolumeUsd = null,Object? btcDominance = null,Object? ethDominance = null,Object? marketCapChange24h = null,}) {
  return _then(GlobalMarket(
totalMarketCapUsd: null == totalMarketCapUsd ? _self.totalMarketCapUsd : totalMarketCapUsd // ignore: cast_nullable_to_non_nullable
as double,totalVolumeUsd: null == totalVolumeUsd ? _self.totalVolumeUsd : totalVolumeUsd // ignore: cast_nullable_to_non_nullable
as double,btcDominance: null == btcDominance ? _self.btcDominance : btcDominance // ignore: cast_nullable_to_non_nullable
as double,ethDominance: null == ethDominance ? _self.ethDominance : ethDominance // ignore: cast_nullable_to_non_nullable
as double,marketCapChange24h: null == marketCapChange24h ? _self.marketCapChange24h : marketCapChange24h // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GlobalMarket].
extension GlobalMarketPatterns on GlobalMarket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GlobalMarket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GlobalMarket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GlobalMarket value)  $default,){
final _that = this;
switch (_that) {
case _GlobalMarket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GlobalMarket value)?  $default,){
final _that = this;
switch (_that) {
case _GlobalMarket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'data', fromJson: _totalMarketCapUsdFromData, includeToJson: false)  double totalMarketCapUsd, @JsonKey(name: 'data', fromJson: _totalVolumeUsdFromData, includeToJson: false)  double totalVolumeUsd, @JsonKey(name: 'data', fromJson: _btcDominanceFromData, includeToJson: false)  double btcDominance, @JsonKey(name: 'data', fromJson: _ethDominanceFromData, includeToJson: false)  double ethDominance, @JsonKey(name: 'data', fromJson: _marketCapChange24hFromData, includeToJson: false)  double marketCapChange24h)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GlobalMarket() when $default != null:
return $default(_that.totalMarketCapUsd,_that.totalVolumeUsd,_that.btcDominance,_that.ethDominance,_that.marketCapChange24h);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'data', fromJson: _totalMarketCapUsdFromData, includeToJson: false)  double totalMarketCapUsd, @JsonKey(name: 'data', fromJson: _totalVolumeUsdFromData, includeToJson: false)  double totalVolumeUsd, @JsonKey(name: 'data', fromJson: _btcDominanceFromData, includeToJson: false)  double btcDominance, @JsonKey(name: 'data', fromJson: _ethDominanceFromData, includeToJson: false)  double ethDominance, @JsonKey(name: 'data', fromJson: _marketCapChange24hFromData, includeToJson: false)  double marketCapChange24h)  $default,) {final _that = this;
switch (_that) {
case _GlobalMarket():
return $default(_that.totalMarketCapUsd,_that.totalVolumeUsd,_that.btcDominance,_that.ethDominance,_that.marketCapChange24h);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'data', fromJson: _totalMarketCapUsdFromData, includeToJson: false)  double totalMarketCapUsd, @JsonKey(name: 'data', fromJson: _totalVolumeUsdFromData, includeToJson: false)  double totalVolumeUsd, @JsonKey(name: 'data', fromJson: _btcDominanceFromData, includeToJson: false)  double btcDominance, @JsonKey(name: 'data', fromJson: _ethDominanceFromData, includeToJson: false)  double ethDominance, @JsonKey(name: 'data', fromJson: _marketCapChange24hFromData, includeToJson: false)  double marketCapChange24h)?  $default,) {final _that = this;
switch (_that) {
case _GlobalMarket() when $default != null:
return $default(_that.totalMarketCapUsd,_that.totalVolumeUsd,_that.btcDominance,_that.ethDominance,_that.marketCapChange24h);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GlobalMarket implements GlobalMarket {
  const _GlobalMarket({@JsonKey(name: 'data', fromJson: _totalMarketCapUsdFromData, includeToJson: false) required this.totalMarketCapUsd, @JsonKey(name: 'data', fromJson: _totalVolumeUsdFromData, includeToJson: false) required this.totalVolumeUsd, @JsonKey(name: 'data', fromJson: _btcDominanceFromData, includeToJson: false) required this.btcDominance, @JsonKey(name: 'data', fromJson: _ethDominanceFromData, includeToJson: false) required this.ethDominance, @JsonKey(name: 'data', fromJson: _marketCapChange24hFromData, includeToJson: false) required this.marketCapChange24h});
  factory _GlobalMarket.fromJson(Map<String, dynamic> json) => _$GlobalMarketFromJson(json);

@override@JsonKey(name: 'data', fromJson: _totalMarketCapUsdFromData, includeToJson: false) final  double totalMarketCapUsd;
@override@JsonKey(name: 'data', fromJson: _totalVolumeUsdFromData, includeToJson: false) final  double totalVolumeUsd;
@override@JsonKey(name: 'data', fromJson: _btcDominanceFromData, includeToJson: false) final  double btcDominance;
@override@JsonKey(name: 'data', fromJson: _ethDominanceFromData, includeToJson: false) final  double ethDominance;
@override@JsonKey(name: 'data', fromJson: _marketCapChange24hFromData, includeToJson: false) final  double marketCapChange24h;

/// Create a copy of GlobalMarket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GlobalMarketCopyWith<_GlobalMarket> get copyWith => __$GlobalMarketCopyWithImpl<_GlobalMarket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GlobalMarketToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GlobalMarket&&(identical(other.totalMarketCapUsd, totalMarketCapUsd) || other.totalMarketCapUsd == totalMarketCapUsd)&&(identical(other.totalVolumeUsd, totalVolumeUsd) || other.totalVolumeUsd == totalVolumeUsd)&&(identical(other.btcDominance, btcDominance) || other.btcDominance == btcDominance)&&(identical(other.ethDominance, ethDominance) || other.ethDominance == ethDominance)&&(identical(other.marketCapChange24h, marketCapChange24h) || other.marketCapChange24h == marketCapChange24h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalMarketCapUsd,totalVolumeUsd,btcDominance,ethDominance,marketCapChange24h);
}

@override
String toString() {
    return 'GlobalMarket(totalMarketCapUsd: $totalMarketCapUsd, totalVolumeUsd: $totalVolumeUsd, btcDominance: $btcDominance, ethDominance: $ethDominance, marketCapChange24h: $marketCapChange24h)';
}


}

/// @nodoc
abstract mixin class _$GlobalMarketCopyWith<$Res> implements $GlobalMarketCopyWith<$Res> {
  factory _$GlobalMarketCopyWith(_GlobalMarket value, $Res Function(_GlobalMarket) _then) = __$GlobalMarketCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'data', fromJson: _totalMarketCapUsdFromData, includeToJson: false) double totalMarketCapUsd,@JsonKey(name: 'data', fromJson: _totalVolumeUsdFromData, includeToJson: false) double totalVolumeUsd,@JsonKey(name: 'data', fromJson: _btcDominanceFromData, includeToJson: false) double btcDominance,@JsonKey(name: 'data', fromJson: _ethDominanceFromData, includeToJson: false) double ethDominance,@JsonKey(name: 'data', fromJson: _marketCapChange24hFromData, includeToJson: false) double marketCapChange24h
});




}
/// @nodoc
class __$GlobalMarketCopyWithImpl<$Res>
    implements _$GlobalMarketCopyWith<$Res> {
  __$GlobalMarketCopyWithImpl(this._self, this._then);

  final _GlobalMarket _self;
  final $Res Function(_GlobalMarket) _then;

/// Create a copy of GlobalMarket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalMarketCapUsd = null,Object? totalVolumeUsd = null,Object? btcDominance = null,Object? ethDominance = null,Object? marketCapChange24h = null,}) {
  return _then(_GlobalMarket(
totalMarketCapUsd: null == totalMarketCapUsd ? _self.totalMarketCapUsd : totalMarketCapUsd // ignore: cast_nullable_to_non_nullable
as double,totalVolumeUsd: null == totalVolumeUsd ? _self.totalVolumeUsd : totalVolumeUsd // ignore: cast_nullable_to_non_nullable
as double,btcDominance: null == btcDominance ? _self.btcDominance : btcDominance // ignore: cast_nullable_to_non_nullable
as double,ethDominance: null == ethDominance ? _self.ethDominance : ethDominance // ignore: cast_nullable_to_non_nullable
as double,marketCapChange24h: null == marketCapChange24h ? _self.marketCapChange24h : marketCapChange24h // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
