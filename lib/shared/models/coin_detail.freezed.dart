// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinDetail {

 String get id; String get symbol; String get name;@JsonKey(name: 'hashing_algorithm') String? get hashingAlgorithm; List<String>? get categories; CoinImage get image;@JsonKey(name: 'market_data') MarketData get marketData;
/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinDetailCopyWith<CoinDetail> get copyWith => _$CoinDetailCopyWithImpl<CoinDetail>(this as CoinDetail, _$identity);

  /// Serializes this CoinDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CoinDetail;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinDetail&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.hashingAlgorithm, _this.hashingAlgorithm) || other.hashingAlgorithm == _this.hashingAlgorithm)&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.marketData, _this.marketData) || other.marketData == _this.marketData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CoinDetail;
  return Object.hash(runtimeType,_this.id,_this.symbol,_this.name,_this.hashingAlgorithm,const DeepCollectionEquality().hash(_this.categories),_this.image,_this.marketData);
}

@override
String toString() {
  final _this = this as CoinDetail;
  return 'CoinDetail(id: ${_this.id}, symbol: ${_this.symbol}, name: ${_this.name}, hashingAlgorithm: ${_this.hashingAlgorithm}, categories: ${_this.categories}, image: ${_this.image}, marketData: ${_this.marketData})';
}


}

/// @nodoc
abstract mixin class $CoinDetailCopyWith<$Res>  {
  factory $CoinDetailCopyWith(CoinDetail value, $Res Function(CoinDetail) _then) = _$CoinDetailCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String name,@JsonKey(name: 'hashing_algorithm') String? hashingAlgorithm, List<String>? categories, CoinImage image,@JsonKey(name: 'market_data') MarketData marketData
});


$CoinImageCopyWith<$Res> get image;$MarketDataCopyWith<$Res> get marketData;

}
/// @nodoc
class _$CoinDetailCopyWithImpl<$Res>
    implements $CoinDetailCopyWith<$Res> {
  _$CoinDetailCopyWithImpl(this._self, this._then);

  final CoinDetail _self;
  final $Res Function(CoinDetail) _then;

/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? hashingAlgorithm = freezed,Object? categories = freezed,Object? image = null,Object? marketData = null,}) {
  return _then(CoinDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hashingAlgorithm: freezed == hashingAlgorithm ? _self.hashingAlgorithm : hashingAlgorithm // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as CoinImage,marketData: null == marketData ? _self.marketData : marketData // ignore: cast_nullable_to_non_nullable
as MarketData,
  ));
}
/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoinImageCopyWith<$Res> get image {
  
  return $CoinImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketDataCopyWith<$Res> get marketData {
  
  return $MarketDataCopyWith<$Res>(_self.marketData, (value) {
    return _then(_self.copyWith(marketData: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoinDetail].
extension CoinDetailPatterns on CoinDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinDetail value)  $default,){
final _that = this;
switch (_that) {
case _CoinDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinDetail value)?  $default,){
final _that = this;
switch (_that) {
case _CoinDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String name, @JsonKey(name: 'hashing_algorithm')  String? hashingAlgorithm,  List<String>? categories,  CoinImage image, @JsonKey(name: 'market_data')  MarketData marketData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinDetail() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.hashingAlgorithm,_that.categories,_that.image,_that.marketData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String name, @JsonKey(name: 'hashing_algorithm')  String? hashingAlgorithm,  List<String>? categories,  CoinImage image, @JsonKey(name: 'market_data')  MarketData marketData)  $default,) {final _that = this;
switch (_that) {
case _CoinDetail():
return $default(_that.id,_that.symbol,_that.name,_that.hashingAlgorithm,_that.categories,_that.image,_that.marketData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String name, @JsonKey(name: 'hashing_algorithm')  String? hashingAlgorithm,  List<String>? categories,  CoinImage image, @JsonKey(name: 'market_data')  MarketData marketData)?  $default,) {final _that = this;
switch (_that) {
case _CoinDetail() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.hashingAlgorithm,_that.categories,_that.image,_that.marketData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinDetail implements CoinDetail {
  const _CoinDetail({required this.id, required this.symbol, required this.name, @JsonKey(name: 'hashing_algorithm') this.hashingAlgorithm,  List<String>? categories, required this.image, @JsonKey(name: 'market_data') required this.marketData}): _categories = categories;
  factory _CoinDetail.fromJson(Map<String, dynamic> json) => _$CoinDetailFromJson(json);

@override final  String id;
@override final  String symbol;
@override final  String name;
@override@JsonKey(name: 'hashing_algorithm') final  String? hashingAlgorithm;
 final  List<String>? _categories;
@override List<String>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CoinImage image;
@override@JsonKey(name: 'market_data') final  MarketData marketData;

/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinDetailCopyWith<_CoinDetail> get copyWith => __$CoinDetailCopyWithImpl<_CoinDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinDetailToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.hashingAlgorithm, hashingAlgorithm) || other.hashingAlgorithm == hashingAlgorithm)&&const DeepCollectionEquality().equals(other.categories, _categories)&&(identical(other.image, image) || other.image == image)&&(identical(other.marketData, marketData) || other.marketData == marketData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,symbol,name,hashingAlgorithm,const DeepCollectionEquality().hash(_categories),image,marketData);
}

@override
String toString() {
    return 'CoinDetail(id: $id, symbol: $symbol, name: $name, hashingAlgorithm: $hashingAlgorithm, categories: $categories, image: $image, marketData: $marketData)';
}


}

/// @nodoc
abstract mixin class _$CoinDetailCopyWith<$Res> implements $CoinDetailCopyWith<$Res> {
  factory _$CoinDetailCopyWith(_CoinDetail value, $Res Function(_CoinDetail) _then) = __$CoinDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String name,@JsonKey(name: 'hashing_algorithm') String? hashingAlgorithm, List<String>? categories, CoinImage image,@JsonKey(name: 'market_data') MarketData marketData
});


@override $CoinImageCopyWith<$Res> get image;@override $MarketDataCopyWith<$Res> get marketData;

}
/// @nodoc
class __$CoinDetailCopyWithImpl<$Res>
    implements _$CoinDetailCopyWith<$Res> {
  __$CoinDetailCopyWithImpl(this._self, this._then);

  final _CoinDetail _self;
  final $Res Function(_CoinDetail) _then;

/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? hashingAlgorithm = freezed,Object? categories = freezed,Object? image = null,Object? marketData = null,}) {
  return _then(_CoinDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hashingAlgorithm: freezed == hashingAlgorithm ? _self.hashingAlgorithm : hashingAlgorithm // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as CoinImage,marketData: null == marketData ? _self.marketData : marketData // ignore: cast_nullable_to_non_nullable
as MarketData,
  ));
}

/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoinImageCopyWith<$Res> get image {
  
  return $CoinImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of CoinDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MarketDataCopyWith<$Res> get marketData {
  
  return $MarketDataCopyWith<$Res>(_self.marketData, (value) {
    return _then(_self.copyWith(marketData: value));
  });
}
}


/// @nodoc
mixin _$CoinImage {

 String get thumb; String get small; String get large;
/// Create a copy of CoinImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinImageCopyWith<CoinImage> get copyWith => _$CoinImageCopyWithImpl<CoinImage>(this as CoinImage, _$identity);

  /// Serializes this CoinImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CoinImage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinImage&&(identical(other.thumb, _this.thumb) || other.thumb == _this.thumb)&&(identical(other.small, _this.small) || other.small == _this.small)&&(identical(other.large, _this.large) || other.large == _this.large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CoinImage;
  return Object.hash(runtimeType,_this.thumb,_this.small,_this.large);
}

@override
String toString() {
  final _this = this as CoinImage;
  return 'CoinImage(thumb: ${_this.thumb}, small: ${_this.small}, large: ${_this.large})';
}


}

/// @nodoc
abstract mixin class $CoinImageCopyWith<$Res>  {
  factory $CoinImageCopyWith(CoinImage value, $Res Function(CoinImage) _then) = _$CoinImageCopyWithImpl;
@useResult
$Res call({
 String thumb, String small, String large
});




}
/// @nodoc
class _$CoinImageCopyWithImpl<$Res>
    implements $CoinImageCopyWith<$Res> {
  _$CoinImageCopyWithImpl(this._self, this._then);

  final CoinImage _self;
  final $Res Function(CoinImage) _then;

/// Create a copy of CoinImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thumb = null,Object? small = null,Object? large = null,}) {
  return _then(CoinImage(
thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinImage].
extension CoinImagePatterns on CoinImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinImage value)  $default,){
final _that = this;
switch (_that) {
case _CoinImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinImage value)?  $default,){
final _that = this;
switch (_that) {
case _CoinImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String thumb,  String small,  String large)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinImage() when $default != null:
return $default(_that.thumb,_that.small,_that.large);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String thumb,  String small,  String large)  $default,) {final _that = this;
switch (_that) {
case _CoinImage():
return $default(_that.thumb,_that.small,_that.large);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String thumb,  String small,  String large)?  $default,) {final _that = this;
switch (_that) {
case _CoinImage() when $default != null:
return $default(_that.thumb,_that.small,_that.large);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinImage implements CoinImage {
  const _CoinImage({required this.thumb, required this.small, required this.large});
  factory _CoinImage.fromJson(Map<String, dynamic> json) => _$CoinImageFromJson(json);

@override final  String thumb;
@override final  String small;
@override final  String large;

/// Create a copy of CoinImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinImageCopyWith<_CoinImage> get copyWith => __$CoinImageCopyWithImpl<_CoinImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinImageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinImage&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.small, small) || other.small == small)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,thumb,small,large);
}

@override
String toString() {
    return 'CoinImage(thumb: $thumb, small: $small, large: $large)';
}


}

/// @nodoc
abstract mixin class _$CoinImageCopyWith<$Res> implements $CoinImageCopyWith<$Res> {
  factory _$CoinImageCopyWith(_CoinImage value, $Res Function(_CoinImage) _then) = __$CoinImageCopyWithImpl;
@override @useResult
$Res call({
 String thumb, String small, String large
});




}
/// @nodoc
class __$CoinImageCopyWithImpl<$Res>
    implements _$CoinImageCopyWith<$Res> {
  __$CoinImageCopyWithImpl(this._self, this._then);

  final _CoinImage _self;
  final $Res Function(_CoinImage) _then;

/// Create a copy of CoinImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thumb = null,Object? small = null,Object? large = null,}) {
  return _then(_CoinImage(
thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MarketData {

@JsonKey(name: 'current_price') Map<String, num?> get currentPrice;@JsonKey(name: 'market_cap_rank') num? get marketCapRank;@JsonKey(name: 'price_change_percentage_24h') double? get priceChange24h;@JsonKey(name: 'price_change_percentage_7d') double? get priceChange7d;@JsonKey(name: 'price_change_percentage_14d') double? get priceChange14d;@JsonKey(name: 'price_change_percentage_30d') double? get priceChange30d;@JsonKey(name: 'price_change_percentage_60d') double? get priceChange60d;@JsonKey(name: 'price_change_percentage_1y') double? get priceChange1y;
/// Create a copy of MarketData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketDataCopyWith<MarketData> get copyWith => _$MarketDataCopyWithImpl<MarketData>(this as MarketData, _$identity);

  /// Serializes this MarketData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarketData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketData&&const DeepCollectionEquality().equals(other.currentPrice, _this.currentPrice)&&(identical(other.marketCapRank, _this.marketCapRank) || other.marketCapRank == _this.marketCapRank)&&(identical(other.priceChange24h, _this.priceChange24h) || other.priceChange24h == _this.priceChange24h)&&(identical(other.priceChange7d, _this.priceChange7d) || other.priceChange7d == _this.priceChange7d)&&(identical(other.priceChange14d, _this.priceChange14d) || other.priceChange14d == _this.priceChange14d)&&(identical(other.priceChange30d, _this.priceChange30d) || other.priceChange30d == _this.priceChange30d)&&(identical(other.priceChange60d, _this.priceChange60d) || other.priceChange60d == _this.priceChange60d)&&(identical(other.priceChange1y, _this.priceChange1y) || other.priceChange1y == _this.priceChange1y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarketData;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.currentPrice),_this.marketCapRank,_this.priceChange24h,_this.priceChange7d,_this.priceChange14d,_this.priceChange30d,_this.priceChange60d,_this.priceChange1y);
}

@override
String toString() {
  final _this = this as MarketData;
  return 'MarketData(currentPrice: ${_this.currentPrice}, marketCapRank: ${_this.marketCapRank}, priceChange24h: ${_this.priceChange24h}, priceChange7d: ${_this.priceChange7d}, priceChange14d: ${_this.priceChange14d}, priceChange30d: ${_this.priceChange30d}, priceChange60d: ${_this.priceChange60d}, priceChange1y: ${_this.priceChange1y})';
}


}

/// @nodoc
abstract mixin class $MarketDataCopyWith<$Res>  {
  factory $MarketDataCopyWith(MarketData value, $Res Function(MarketData) _then) = _$MarketDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_price') Map<String, num?> currentPrice,@JsonKey(name: 'market_cap_rank') num? marketCapRank,@JsonKey(name: 'price_change_percentage_24h') double? priceChange24h,@JsonKey(name: 'price_change_percentage_7d') double? priceChange7d,@JsonKey(name: 'price_change_percentage_14d') double? priceChange14d,@JsonKey(name: 'price_change_percentage_30d') double? priceChange30d,@JsonKey(name: 'price_change_percentage_60d') double? priceChange60d,@JsonKey(name: 'price_change_percentage_1y') double? priceChange1y
});




}
/// @nodoc
class _$MarketDataCopyWithImpl<$Res>
    implements $MarketDataCopyWith<$Res> {
  _$MarketDataCopyWithImpl(this._self, this._then);

  final MarketData _self;
  final $Res Function(MarketData) _then;

/// Create a copy of MarketData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPrice = null,Object? marketCapRank = freezed,Object? priceChange24h = freezed,Object? priceChange7d = freezed,Object? priceChange14d = freezed,Object? priceChange30d = freezed,Object? priceChange60d = freezed,Object? priceChange1y = freezed,}) {
  return _then(MarketData(
currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as Map<String, num?>,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as num?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,priceChange7d: freezed == priceChange7d ? _self.priceChange7d : priceChange7d // ignore: cast_nullable_to_non_nullable
as double?,priceChange14d: freezed == priceChange14d ? _self.priceChange14d : priceChange14d // ignore: cast_nullable_to_non_nullable
as double?,priceChange30d: freezed == priceChange30d ? _self.priceChange30d : priceChange30d // ignore: cast_nullable_to_non_nullable
as double?,priceChange60d: freezed == priceChange60d ? _self.priceChange60d : priceChange60d // ignore: cast_nullable_to_non_nullable
as double?,priceChange1y: freezed == priceChange1y ? _self.priceChange1y : priceChange1y // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketData].
extension MarketDataPatterns on MarketData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketData value)  $default,){
final _that = this;
switch (_that) {
case _MarketData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketData value)?  $default,){
final _that = this;
switch (_that) {
case _MarketData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_price')  Map<String, num?> currentPrice, @JsonKey(name: 'market_cap_rank')  num? marketCapRank, @JsonKey(name: 'price_change_percentage_24h')  double? priceChange24h, @JsonKey(name: 'price_change_percentage_7d')  double? priceChange7d, @JsonKey(name: 'price_change_percentage_14d')  double? priceChange14d, @JsonKey(name: 'price_change_percentage_30d')  double? priceChange30d, @JsonKey(name: 'price_change_percentage_60d')  double? priceChange60d, @JsonKey(name: 'price_change_percentage_1y')  double? priceChange1y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketData() when $default != null:
return $default(_that.currentPrice,_that.marketCapRank,_that.priceChange24h,_that.priceChange7d,_that.priceChange14d,_that.priceChange30d,_that.priceChange60d,_that.priceChange1y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_price')  Map<String, num?> currentPrice, @JsonKey(name: 'market_cap_rank')  num? marketCapRank, @JsonKey(name: 'price_change_percentage_24h')  double? priceChange24h, @JsonKey(name: 'price_change_percentage_7d')  double? priceChange7d, @JsonKey(name: 'price_change_percentage_14d')  double? priceChange14d, @JsonKey(name: 'price_change_percentage_30d')  double? priceChange30d, @JsonKey(name: 'price_change_percentage_60d')  double? priceChange60d, @JsonKey(name: 'price_change_percentage_1y')  double? priceChange1y)  $default,) {final _that = this;
switch (_that) {
case _MarketData():
return $default(_that.currentPrice,_that.marketCapRank,_that.priceChange24h,_that.priceChange7d,_that.priceChange14d,_that.priceChange30d,_that.priceChange60d,_that.priceChange1y);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_price')  Map<String, num?> currentPrice, @JsonKey(name: 'market_cap_rank')  num? marketCapRank, @JsonKey(name: 'price_change_percentage_24h')  double? priceChange24h, @JsonKey(name: 'price_change_percentage_7d')  double? priceChange7d, @JsonKey(name: 'price_change_percentage_14d')  double? priceChange14d, @JsonKey(name: 'price_change_percentage_30d')  double? priceChange30d, @JsonKey(name: 'price_change_percentage_60d')  double? priceChange60d, @JsonKey(name: 'price_change_percentage_1y')  double? priceChange1y)?  $default,) {final _that = this;
switch (_that) {
case _MarketData() when $default != null:
return $default(_that.currentPrice,_that.marketCapRank,_that.priceChange24h,_that.priceChange7d,_that.priceChange14d,_that.priceChange30d,_that.priceChange60d,_that.priceChange1y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketData extends MarketData {
  const _MarketData({@JsonKey(name: 'current_price') required  Map<String, num?> currentPrice, @JsonKey(name: 'market_cap_rank') this.marketCapRank, @JsonKey(name: 'price_change_percentage_24h') this.priceChange24h, @JsonKey(name: 'price_change_percentage_7d') this.priceChange7d, @JsonKey(name: 'price_change_percentage_14d') this.priceChange14d, @JsonKey(name: 'price_change_percentage_30d') this.priceChange30d, @JsonKey(name: 'price_change_percentage_60d') this.priceChange60d, @JsonKey(name: 'price_change_percentage_1y') this.priceChange1y}): _currentPrice = currentPrice,super._();
  factory _MarketData.fromJson(Map<String, dynamic> json) => _$MarketDataFromJson(json);

 final  Map<String, num?> _currentPrice;
@override@JsonKey(name: 'current_price') Map<String, num?> get currentPrice {
  if (_currentPrice is EqualUnmodifiableMapView) return _currentPrice;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_currentPrice);
}

@override@JsonKey(name: 'market_cap_rank') final  num? marketCapRank;
@override@JsonKey(name: 'price_change_percentage_24h') final  double? priceChange24h;
@override@JsonKey(name: 'price_change_percentage_7d') final  double? priceChange7d;
@override@JsonKey(name: 'price_change_percentage_14d') final  double? priceChange14d;
@override@JsonKey(name: 'price_change_percentage_30d') final  double? priceChange30d;
@override@JsonKey(name: 'price_change_percentage_60d') final  double? priceChange60d;
@override@JsonKey(name: 'price_change_percentage_1y') final  double? priceChange1y;

/// Create a copy of MarketData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketDataCopyWith<_MarketData> get copyWith => __$MarketDataCopyWithImpl<_MarketData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketData&&const DeepCollectionEquality().equals(other.currentPrice, _currentPrice)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.priceChange24h, priceChange24h) || other.priceChange24h == priceChange24h)&&(identical(other.priceChange7d, priceChange7d) || other.priceChange7d == priceChange7d)&&(identical(other.priceChange14d, priceChange14d) || other.priceChange14d == priceChange14d)&&(identical(other.priceChange30d, priceChange30d) || other.priceChange30d == priceChange30d)&&(identical(other.priceChange60d, priceChange60d) || other.priceChange60d == priceChange60d)&&(identical(other.priceChange1y, priceChange1y) || other.priceChange1y == priceChange1y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_currentPrice),marketCapRank,priceChange24h,priceChange7d,priceChange14d,priceChange30d,priceChange60d,priceChange1y);
}

@override
String toString() {
    return 'MarketData(currentPrice: $currentPrice, marketCapRank: $marketCapRank, priceChange24h: $priceChange24h, priceChange7d: $priceChange7d, priceChange14d: $priceChange14d, priceChange30d: $priceChange30d, priceChange60d: $priceChange60d, priceChange1y: $priceChange1y)';
}


}

/// @nodoc
abstract mixin class _$MarketDataCopyWith<$Res> implements $MarketDataCopyWith<$Res> {
  factory _$MarketDataCopyWith(_MarketData value, $Res Function(_MarketData) _then) = __$MarketDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_price') Map<String, num?> currentPrice,@JsonKey(name: 'market_cap_rank') num? marketCapRank,@JsonKey(name: 'price_change_percentage_24h') double? priceChange24h,@JsonKey(name: 'price_change_percentage_7d') double? priceChange7d,@JsonKey(name: 'price_change_percentage_14d') double? priceChange14d,@JsonKey(name: 'price_change_percentage_30d') double? priceChange30d,@JsonKey(name: 'price_change_percentage_60d') double? priceChange60d,@JsonKey(name: 'price_change_percentage_1y') double? priceChange1y
});




}
/// @nodoc
class __$MarketDataCopyWithImpl<$Res>
    implements _$MarketDataCopyWith<$Res> {
  __$MarketDataCopyWithImpl(this._self, this._then);

  final _MarketData _self;
  final $Res Function(_MarketData) _then;

/// Create a copy of MarketData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPrice = null,Object? marketCapRank = freezed,Object? priceChange24h = freezed,Object? priceChange7d = freezed,Object? priceChange14d = freezed,Object? priceChange30d = freezed,Object? priceChange60d = freezed,Object? priceChange1y = freezed,}) {
  return _then(_MarketData(
currentPrice: null == currentPrice ? _self._currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as Map<String, num?>,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as num?,priceChange24h: freezed == priceChange24h ? _self.priceChange24h : priceChange24h // ignore: cast_nullable_to_non_nullable
as double?,priceChange7d: freezed == priceChange7d ? _self.priceChange7d : priceChange7d // ignore: cast_nullable_to_non_nullable
as double?,priceChange14d: freezed == priceChange14d ? _self.priceChange14d : priceChange14d // ignore: cast_nullable_to_non_nullable
as double?,priceChange30d: freezed == priceChange30d ? _self.priceChange30d : priceChange30d // ignore: cast_nullable_to_non_nullable
as double?,priceChange60d: freezed == priceChange60d ? _self.priceChange60d : priceChange60d // ignore: cast_nullable_to_non_nullable
as double?,priceChange1y: freezed == priceChange1y ? _self.priceChange1y : priceChange1y // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Market {

 String get name; String get identifier;@JsonKey(name: 'has_trading_incentive') bool get hasTradingIncentive;
/// Create a copy of Market
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketCopyWith<Market> get copyWith => _$MarketCopyWithImpl<Market>(this as Market, _$identity);

  /// Serializes this Market to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Market;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Market&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.identifier, _this.identifier) || other.identifier == _this.identifier)&&(identical(other.hasTradingIncentive, _this.hasTradingIncentive) || other.hasTradingIncentive == _this.hasTradingIncentive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Market;
  return Object.hash(runtimeType,_this.name,_this.identifier,_this.hasTradingIncentive);
}

@override
String toString() {
  final _this = this as Market;
  return 'Market(name: ${_this.name}, identifier: ${_this.identifier}, hasTradingIncentive: ${_this.hasTradingIncentive})';
}


}

/// @nodoc
abstract mixin class $MarketCopyWith<$Res>  {
  factory $MarketCopyWith(Market value, $Res Function(Market) _then) = _$MarketCopyWithImpl;
@useResult
$Res call({
 String name, String identifier,@JsonKey(name: 'has_trading_incentive') bool hasTradingIncentive
});




}
/// @nodoc
class _$MarketCopyWithImpl<$Res>
    implements $MarketCopyWith<$Res> {
  _$MarketCopyWithImpl(this._self, this._then);

  final Market _self;
  final $Res Function(Market) _then;

/// Create a copy of Market
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? identifier = null,Object? hasTradingIncentive = null,}) {
  return _then(Market(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,hasTradingIncentive: null == hasTradingIncentive ? _self.hasTradingIncentive : hasTradingIncentive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Market].
extension MarketPatterns on Market {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Market value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Market() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Market value)  $default,){
final _that = this;
switch (_that) {
case _Market():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Market value)?  $default,){
final _that = this;
switch (_that) {
case _Market() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String identifier, @JsonKey(name: 'has_trading_incentive')  bool hasTradingIncentive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Market() when $default != null:
return $default(_that.name,_that.identifier,_that.hasTradingIncentive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String identifier, @JsonKey(name: 'has_trading_incentive')  bool hasTradingIncentive)  $default,) {final _that = this;
switch (_that) {
case _Market():
return $default(_that.name,_that.identifier,_that.hasTradingIncentive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String identifier, @JsonKey(name: 'has_trading_incentive')  bool hasTradingIncentive)?  $default,) {final _that = this;
switch (_that) {
case _Market() when $default != null:
return $default(_that.name,_that.identifier,_that.hasTradingIncentive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Market implements Market {
  const _Market({required this.name, required this.identifier, @JsonKey(name: 'has_trading_incentive') required this.hasTradingIncentive});
  factory _Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);

@override final  String name;
@override final  String identifier;
@override@JsonKey(name: 'has_trading_incentive') final  bool hasTradingIncentive;

/// Create a copy of Market
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketCopyWith<_Market> get copyWith => __$MarketCopyWithImpl<_Market>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Market&&(identical(other.name, name) || other.name == name)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.hasTradingIncentive, hasTradingIncentive) || other.hasTradingIncentive == hasTradingIncentive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,identifier,hasTradingIncentive);
}

@override
String toString() {
    return 'Market(name: $name, identifier: $identifier, hasTradingIncentive: $hasTradingIncentive)';
}


}

/// @nodoc
abstract mixin class _$MarketCopyWith<$Res> implements $MarketCopyWith<$Res> {
  factory _$MarketCopyWith(_Market value, $Res Function(_Market) _then) = __$MarketCopyWithImpl;
@override @useResult
$Res call({
 String name, String identifier,@JsonKey(name: 'has_trading_incentive') bool hasTradingIncentive
});




}
/// @nodoc
class __$MarketCopyWithImpl<$Res>
    implements _$MarketCopyWith<$Res> {
  __$MarketCopyWithImpl(this._self, this._then);

  final _Market _self;
  final $Res Function(_Market) _then;

/// Create a copy of Market
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? identifier = null,Object? hasTradingIncentive = null,}) {
  return _then(_Market(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,hasTradingIncentive: null == hasTradingIncentive ? _self.hasTradingIncentive : hasTradingIncentive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
