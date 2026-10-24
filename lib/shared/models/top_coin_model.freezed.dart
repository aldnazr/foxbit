// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_coin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopCoinModel {

 List<Coin> get coins;
/// Create a copy of TopCoinModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopCoinModelCopyWith<TopCoinModel> get copyWith => _$TopCoinModelCopyWithImpl<TopCoinModel>(this as TopCoinModel, _$identity);

  /// Serializes this TopCoinModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TopCoinModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopCoinModel&&const DeepCollectionEquality().equals(other.coins, _this.coins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TopCoinModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.coins));
}

@override
String toString() {
  final _this = this as TopCoinModel;
  return 'TopCoinModel(coins: ${_this.coins})';
}


}

/// @nodoc
abstract mixin class $TopCoinModelCopyWith<$Res>  {
  factory $TopCoinModelCopyWith(TopCoinModel value, $Res Function(TopCoinModel) _then) = _$TopCoinModelCopyWithImpl;
@useResult
$Res call({
 List<Coin> coins
});




}
/// @nodoc
class _$TopCoinModelCopyWithImpl<$Res>
    implements $TopCoinModelCopyWith<$Res> {
  _$TopCoinModelCopyWithImpl(this._self, this._then);

  final TopCoinModel _self;
  final $Res Function(TopCoinModel) _then;

/// Create a copy of TopCoinModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coins = null,}) {
  return _then(TopCoinModel(
coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as List<Coin>,
  ));
}

}


/// Adds pattern-matching-related methods to [TopCoinModel].
extension TopCoinModelPatterns on TopCoinModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopCoinModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopCoinModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopCoinModel value)  $default,){
final _that = this;
switch (_that) {
case _TopCoinModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopCoinModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopCoinModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Coin> coins)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopCoinModel() when $default != null:
return $default(_that.coins);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Coin> coins)  $default,) {final _that = this;
switch (_that) {
case _TopCoinModel():
return $default(_that.coins);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Coin> coins)?  $default,) {final _that = this;
switch (_that) {
case _TopCoinModel() when $default != null:
return $default(_that.coins);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopCoinModel implements TopCoinModel {
  const _TopCoinModel({required  List<Coin> coins}): _coins = coins;
  factory _TopCoinModel.fromJson(Map<String, dynamic> json) => _$TopCoinModelFromJson(json);

 final  List<Coin> _coins;
@override List<Coin> get coins {
  if (_coins is EqualUnmodifiableListView) return _coins;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coins);
}


/// Create a copy of TopCoinModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopCoinModelCopyWith<_TopCoinModel> get copyWith => __$TopCoinModelCopyWithImpl<_TopCoinModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopCoinModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopCoinModel&&const DeepCollectionEquality().equals(other.coins, _coins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_coins));
}

@override
String toString() {
    return 'TopCoinModel(coins: $coins)';
}


}

/// @nodoc
abstract mixin class _$TopCoinModelCopyWith<$Res> implements $TopCoinModelCopyWith<$Res> {
  factory _$TopCoinModelCopyWith(_TopCoinModel value, $Res Function(_TopCoinModel) _then) = __$TopCoinModelCopyWithImpl;
@override @useResult
$Res call({
 List<Coin> coins
});




}
/// @nodoc
class __$TopCoinModelCopyWithImpl<$Res>
    implements _$TopCoinModelCopyWith<$Res> {
  __$TopCoinModelCopyWithImpl(this._self, this._then);

  final _TopCoinModel _self;
  final $Res Function(_TopCoinModel) _then;

/// Create a copy of TopCoinModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coins = null,}) {
  return _then(_TopCoinModel(
coins: null == coins ? _self._coins : coins // ignore: cast_nullable_to_non_nullable
as List<Coin>,
  ));
}


}


/// @nodoc
mixin _$Coin {

 TopCoinItem get item;
/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinCopyWith<Coin> get copyWith => _$CoinCopyWithImpl<Coin>(this as Coin, _$identity);

  /// Serializes this Coin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Coin;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Coin&&(identical(other.item, _this.item) || other.item == _this.item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Coin;
  return Object.hash(runtimeType,_this.item);
}

@override
String toString() {
  final _this = this as Coin;
  return 'Coin(item: ${_this.item})';
}


}

/// @nodoc
abstract mixin class $CoinCopyWith<$Res>  {
  factory $CoinCopyWith(Coin value, $Res Function(Coin) _then) = _$CoinCopyWithImpl;
@useResult
$Res call({
 TopCoinItem item
});


$TopCoinItemCopyWith<$Res> get item;

}
/// @nodoc
class _$CoinCopyWithImpl<$Res>
    implements $CoinCopyWith<$Res> {
  _$CoinCopyWithImpl(this._self, this._then);

  final Coin _self;
  final $Res Function(Coin) _then;

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,}) {
  return _then(Coin(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as TopCoinItem,
  ));
}
/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopCoinItemCopyWith<$Res> get item {
  
  return $TopCoinItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [Coin].
extension CoinPatterns on Coin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Coin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Coin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Coin value)  $default,){
final _that = this;
switch (_that) {
case _Coin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Coin value)?  $default,){
final _that = this;
switch (_that) {
case _Coin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TopCoinItem item)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Coin() when $default != null:
return $default(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TopCoinItem item)  $default,) {final _that = this;
switch (_that) {
case _Coin():
return $default(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TopCoinItem item)?  $default,) {final _that = this;
switch (_that) {
case _Coin() when $default != null:
return $default(_that.item);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Coin implements Coin {
  const _Coin({required this.item});
  factory _Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

@override final  TopCoinItem item;

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinCopyWith<_Coin> get copyWith => __$CoinCopyWithImpl<_Coin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Coin&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,item);
}

@override
String toString() {
    return 'Coin(item: $item)';
}


}

/// @nodoc
abstract mixin class _$CoinCopyWith<$Res> implements $CoinCopyWith<$Res> {
  factory _$CoinCopyWith(_Coin value, $Res Function(_Coin) _then) = __$CoinCopyWithImpl;
@override @useResult
$Res call({
 TopCoinItem item
});


@override $TopCoinItemCopyWith<$Res> get item;

}
/// @nodoc
class __$CoinCopyWithImpl<$Res>
    implements _$CoinCopyWith<$Res> {
  __$CoinCopyWithImpl(this._self, this._then);

  final _Coin _self;
  final $Res Function(_Coin) _then;

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_Coin(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as TopCoinItem,
  ));
}

/// Create a copy of Coin
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopCoinItemCopyWith<$Res> get item {
  
  return $TopCoinItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$TopCoinItem {

 String get id;@JsonKey(name: 'coin_id') int get coinId; String get name; String get symbol;@JsonKey(name: 'market_cap_rank') int get marketCapRank; String get thumb; String get small; String get large; String get slug;@JsonKey(name: 'price_btc') double get priceBtc; int get score; Data get data;
/// Create a copy of TopCoinItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopCoinItemCopyWith<TopCoinItem> get copyWith => _$TopCoinItemCopyWithImpl<TopCoinItem>(this as TopCoinItem, _$identity);

  /// Serializes this TopCoinItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TopCoinItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopCoinItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.coinId, _this.coinId) || other.coinId == _this.coinId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.marketCapRank, _this.marketCapRank) || other.marketCapRank == _this.marketCapRank)&&(identical(other.thumb, _this.thumb) || other.thumb == _this.thumb)&&(identical(other.small, _this.small) || other.small == _this.small)&&(identical(other.large, _this.large) || other.large == _this.large)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.priceBtc, _this.priceBtc) || other.priceBtc == _this.priceBtc)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TopCoinItem;
  return Object.hash(runtimeType,_this.id,_this.coinId,_this.name,_this.symbol,_this.marketCapRank,_this.thumb,_this.small,_this.large,_this.slug,_this.priceBtc,_this.score,_this.data);
}

@override
String toString() {
  final _this = this as TopCoinItem;
  return 'TopCoinItem(id: ${_this.id}, coinId: ${_this.coinId}, name: ${_this.name}, symbol: ${_this.symbol}, marketCapRank: ${_this.marketCapRank}, thumb: ${_this.thumb}, small: ${_this.small}, large: ${_this.large}, slug: ${_this.slug}, priceBtc: ${_this.priceBtc}, score: ${_this.score}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $TopCoinItemCopyWith<$Res>  {
  factory $TopCoinItemCopyWith(TopCoinItem value, $Res Function(TopCoinItem) _then) = _$TopCoinItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'coin_id') int coinId, String name, String symbol,@JsonKey(name: 'market_cap_rank') int marketCapRank, String thumb, String small, String large, String slug,@JsonKey(name: 'price_btc') double priceBtc, int score, Data data
});


$DataCopyWith<$Res> get data;

}
/// @nodoc
class _$TopCoinItemCopyWithImpl<$Res>
    implements $TopCoinItemCopyWith<$Res> {
  _$TopCoinItemCopyWithImpl(this._self, this._then);

  final TopCoinItem _self;
  final $Res Function(TopCoinItem) _then;

/// Create a copy of TopCoinItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coinId = null,Object? name = null,Object? symbol = null,Object? marketCapRank = null,Object? thumb = null,Object? small = null,Object? large = null,Object? slug = null,Object? priceBtc = null,Object? score = null,Object? data = null,}) {
  return _then(TopCoinItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,marketCapRank: null == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,priceBtc: null == priceBtc ? _self.priceBtc : priceBtc // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data,
  ));
}
/// Create a copy of TopCoinItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res> get data {
  
  return $DataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopCoinItem].
extension TopCoinItemPatterns on TopCoinItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopCoinItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopCoinItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopCoinItem value)  $default,){
final _that = this;
switch (_that) {
case _TopCoinItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopCoinItem value)?  $default,){
final _that = this;
switch (_that) {
case _TopCoinItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'coin_id')  int coinId,  String name,  String symbol, @JsonKey(name: 'market_cap_rank')  int marketCapRank,  String thumb,  String small,  String large,  String slug, @JsonKey(name: 'price_btc')  double priceBtc,  int score,  Data data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopCoinItem() when $default != null:
return $default(_that.id,_that.coinId,_that.name,_that.symbol,_that.marketCapRank,_that.thumb,_that.small,_that.large,_that.slug,_that.priceBtc,_that.score,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'coin_id')  int coinId,  String name,  String symbol, @JsonKey(name: 'market_cap_rank')  int marketCapRank,  String thumb,  String small,  String large,  String slug, @JsonKey(name: 'price_btc')  double priceBtc,  int score,  Data data)  $default,) {final _that = this;
switch (_that) {
case _TopCoinItem():
return $default(_that.id,_that.coinId,_that.name,_that.symbol,_that.marketCapRank,_that.thumb,_that.small,_that.large,_that.slug,_that.priceBtc,_that.score,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'coin_id')  int coinId,  String name,  String symbol, @JsonKey(name: 'market_cap_rank')  int marketCapRank,  String thumb,  String small,  String large,  String slug, @JsonKey(name: 'price_btc')  double priceBtc,  int score,  Data data)?  $default,) {final _that = this;
switch (_that) {
case _TopCoinItem() when $default != null:
return $default(_that.id,_that.coinId,_that.name,_that.symbol,_that.marketCapRank,_that.thumb,_that.small,_that.large,_that.slug,_that.priceBtc,_that.score,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopCoinItem implements TopCoinItem {
  const _TopCoinItem({required this.id, @JsonKey(name: 'coin_id') required this.coinId, required this.name, required this.symbol, @JsonKey(name: 'market_cap_rank') required this.marketCapRank, required this.thumb, required this.small, required this.large, required this.slug, @JsonKey(name: 'price_btc') required this.priceBtc, required this.score, required this.data});
  factory _TopCoinItem.fromJson(Map<String, dynamic> json) => _$TopCoinItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'coin_id') final  int coinId;
@override final  String name;
@override final  String symbol;
@override@JsonKey(name: 'market_cap_rank') final  int marketCapRank;
@override final  String thumb;
@override final  String small;
@override final  String large;
@override final  String slug;
@override@JsonKey(name: 'price_btc') final  double priceBtc;
@override final  int score;
@override final  Data data;

/// Create a copy of TopCoinItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopCoinItemCopyWith<_TopCoinItem> get copyWith => __$TopCoinItemCopyWithImpl<_TopCoinItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopCoinItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopCoinItem&&(identical(other.id, id) || other.id == id)&&(identical(other.coinId, coinId) || other.coinId == coinId)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.small, small) || other.small == small)&&(identical(other.large, large) || other.large == large)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.priceBtc, priceBtc) || other.priceBtc == priceBtc)&&(identical(other.score, score) || other.score == score)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,coinId,name,symbol,marketCapRank,thumb,small,large,slug,priceBtc,score,data);
}

@override
String toString() {
    return 'TopCoinItem(id: $id, coinId: $coinId, name: $name, symbol: $symbol, marketCapRank: $marketCapRank, thumb: $thumb, small: $small, large: $large, slug: $slug, priceBtc: $priceBtc, score: $score, data: $data)';
}


}

/// @nodoc
abstract mixin class _$TopCoinItemCopyWith<$Res> implements $TopCoinItemCopyWith<$Res> {
  factory _$TopCoinItemCopyWith(_TopCoinItem value, $Res Function(_TopCoinItem) _then) = __$TopCoinItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'coin_id') int coinId, String name, String symbol,@JsonKey(name: 'market_cap_rank') int marketCapRank, String thumb, String small, String large, String slug,@JsonKey(name: 'price_btc') double priceBtc, int score, Data data
});


@override $DataCopyWith<$Res> get data;

}
/// @nodoc
class __$TopCoinItemCopyWithImpl<$Res>
    implements _$TopCoinItemCopyWith<$Res> {
  __$TopCoinItemCopyWithImpl(this._self, this._then);

  final _TopCoinItem _self;
  final $Res Function(_TopCoinItem) _then;

/// Create a copy of TopCoinItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coinId = null,Object? name = null,Object? symbol = null,Object? marketCapRank = null,Object? thumb = null,Object? small = null,Object? large = null,Object? slug = null,Object? priceBtc = null,Object? score = null,Object? data = null,}) {
  return _then(_TopCoinItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coinId: null == coinId ? _self.coinId : coinId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,marketCapRank: null == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,priceBtc: null == priceBtc ? _self.priceBtc : priceBtc // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data,
  ));
}

/// Create a copy of TopCoinItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res> get data {
  
  return $DataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$Data {

 double get price;@JsonKey(name: 'price_btc') String get priceBtc;@JsonKey(name: 'price_change_percentage_24h') Map<String, double> get priceChangePercentage24h;@JsonKey(name: 'market_cap') String get marketCap;@JsonKey(name: 'market_cap_btc') String get marketCapBtc;@JsonKey(name: 'total_volume') String get totalVolume;@JsonKey(name: 'total_volume_btc') String get totalVolumeBtc; String get sparkline;
/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<Data> get copyWith => _$DataCopyWithImpl<Data>(this as Data, _$identity);

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Data;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.priceBtc, _this.priceBtc) || other.priceBtc == _this.priceBtc)&&const DeepCollectionEquality().equals(other.priceChangePercentage24h, _this.priceChangePercentage24h)&&(identical(other.marketCap, _this.marketCap) || other.marketCap == _this.marketCap)&&(identical(other.marketCapBtc, _this.marketCapBtc) || other.marketCapBtc == _this.marketCapBtc)&&(identical(other.totalVolume, _this.totalVolume) || other.totalVolume == _this.totalVolume)&&(identical(other.totalVolumeBtc, _this.totalVolumeBtc) || other.totalVolumeBtc == _this.totalVolumeBtc)&&(identical(other.sparkline, _this.sparkline) || other.sparkline == _this.sparkline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Data;
  return Object.hash(runtimeType,_this.price,_this.priceBtc,const DeepCollectionEquality().hash(_this.priceChangePercentage24h),_this.marketCap,_this.marketCapBtc,_this.totalVolume,_this.totalVolumeBtc,_this.sparkline);
}

@override
String toString() {
  final _this = this as Data;
  return 'Data(price: ${_this.price}, priceBtc: ${_this.priceBtc}, priceChangePercentage24h: ${_this.priceChangePercentage24h}, marketCap: ${_this.marketCap}, marketCapBtc: ${_this.marketCapBtc}, totalVolume: ${_this.totalVolume}, totalVolumeBtc: ${_this.totalVolumeBtc}, sparkline: ${_this.sparkline})';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<$Res>  {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) = _$DataCopyWithImpl;
@useResult
$Res call({
 double price,@JsonKey(name: 'price_btc') String priceBtc,@JsonKey(name: 'price_change_percentage_24h') Map<String, double> priceChangePercentage24h,@JsonKey(name: 'market_cap') String marketCap,@JsonKey(name: 'market_cap_btc') String marketCapBtc,@JsonKey(name: 'total_volume') String totalVolume,@JsonKey(name: 'total_volume_btc') String totalVolumeBtc, String sparkline
});




}
/// @nodoc
class _$DataCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? priceBtc = null,Object? priceChangePercentage24h = null,Object? marketCap = null,Object? marketCapBtc = null,Object? totalVolume = null,Object? totalVolumeBtc = null,Object? sparkline = null,}) {
  return _then(Data(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceBtc: null == priceBtc ? _self.priceBtc : priceBtc // ignore: cast_nullable_to_non_nullable
as String,priceChangePercentage24h: null == priceChangePercentage24h ? _self.priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as Map<String, double>,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as String,marketCapBtc: null == marketCapBtc ? _self.marketCapBtc : marketCapBtc // ignore: cast_nullable_to_non_nullable
as String,totalVolume: null == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as String,totalVolumeBtc: null == totalVolumeBtc ? _self.totalVolumeBtc : totalVolumeBtc // ignore: cast_nullable_to_non_nullable
as String,sparkline: null == sparkline ? _self.sparkline : sparkline // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Data].
extension DataPatterns on Data {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Data value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Data value)  $default,){
final _that = this;
switch (_that) {
case _Data():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Data value)?  $default,){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double price, @JsonKey(name: 'price_btc')  String priceBtc, @JsonKey(name: 'price_change_percentage_24h')  Map<String, double> priceChangePercentage24h, @JsonKey(name: 'market_cap')  String marketCap, @JsonKey(name: 'market_cap_btc')  String marketCapBtc, @JsonKey(name: 'total_volume')  String totalVolume, @JsonKey(name: 'total_volume_btc')  String totalVolumeBtc,  String sparkline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Data() when $default != null:
return $default(_that.price,_that.priceBtc,_that.priceChangePercentage24h,_that.marketCap,_that.marketCapBtc,_that.totalVolume,_that.totalVolumeBtc,_that.sparkline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double price, @JsonKey(name: 'price_btc')  String priceBtc, @JsonKey(name: 'price_change_percentage_24h')  Map<String, double> priceChangePercentage24h, @JsonKey(name: 'market_cap')  String marketCap, @JsonKey(name: 'market_cap_btc')  String marketCapBtc, @JsonKey(name: 'total_volume')  String totalVolume, @JsonKey(name: 'total_volume_btc')  String totalVolumeBtc,  String sparkline)  $default,) {final _that = this;
switch (_that) {
case _Data():
return $default(_that.price,_that.priceBtc,_that.priceChangePercentage24h,_that.marketCap,_that.marketCapBtc,_that.totalVolume,_that.totalVolumeBtc,_that.sparkline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double price, @JsonKey(name: 'price_btc')  String priceBtc, @JsonKey(name: 'price_change_percentage_24h')  Map<String, double> priceChangePercentage24h, @JsonKey(name: 'market_cap')  String marketCap, @JsonKey(name: 'market_cap_btc')  String marketCapBtc, @JsonKey(name: 'total_volume')  String totalVolume, @JsonKey(name: 'total_volume_btc')  String totalVolumeBtc,  String sparkline)?  $default,) {final _that = this;
switch (_that) {
case _Data() when $default != null:
return $default(_that.price,_that.priceBtc,_that.priceChangePercentage24h,_that.marketCap,_that.marketCapBtc,_that.totalVolume,_that.totalVolumeBtc,_that.sparkline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Data implements Data {
  const _Data({required this.price, @JsonKey(name: 'price_btc') required this.priceBtc, @JsonKey(name: 'price_change_percentage_24h') required  Map<String, double> priceChangePercentage24h, @JsonKey(name: 'market_cap') required this.marketCap, @JsonKey(name: 'market_cap_btc') required this.marketCapBtc, @JsonKey(name: 'total_volume') required this.totalVolume, @JsonKey(name: 'total_volume_btc') required this.totalVolumeBtc, required this.sparkline}): _priceChangePercentage24h = priceChangePercentage24h;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

@override final  double price;
@override@JsonKey(name: 'price_btc') final  String priceBtc;
 final  Map<String, double> _priceChangePercentage24h;
@override@JsonKey(name: 'price_change_percentage_24h') Map<String, double> get priceChangePercentage24h {
  if (_priceChangePercentage24h is EqualUnmodifiableMapView) return _priceChangePercentage24h;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_priceChangePercentage24h);
}

@override@JsonKey(name: 'market_cap') final  String marketCap;
@override@JsonKey(name: 'market_cap_btc') final  String marketCapBtc;
@override@JsonKey(name: 'total_volume') final  String totalVolume;
@override@JsonKey(name: 'total_volume_btc') final  String totalVolumeBtc;
@override final  String sparkline;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&(identical(other.price, price) || other.price == price)&&(identical(other.priceBtc, priceBtc) || other.priceBtc == priceBtc)&&const DeepCollectionEquality().equals(other.priceChangePercentage24h, _priceChangePercentage24h)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap)&&(identical(other.marketCapBtc, marketCapBtc) || other.marketCapBtc == marketCapBtc)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.totalVolumeBtc, totalVolumeBtc) || other.totalVolumeBtc == totalVolumeBtc)&&(identical(other.sparkline, sparkline) || other.sparkline == sparkline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,price,priceBtc,const DeepCollectionEquality().hash(_priceChangePercentage24h),marketCap,marketCapBtc,totalVolume,totalVolumeBtc,sparkline);
}

@override
String toString() {
    return 'Data(price: $price, priceBtc: $priceBtc, priceChangePercentage24h: $priceChangePercentage24h, marketCap: $marketCap, marketCapBtc: $marketCapBtc, totalVolume: $totalVolume, totalVolumeBtc: $totalVolumeBtc, sparkline: $sparkline)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@override @useResult
$Res call({
 double price,@JsonKey(name: 'price_btc') String priceBtc,@JsonKey(name: 'price_change_percentage_24h') Map<String, double> priceChangePercentage24h,@JsonKey(name: 'market_cap') String marketCap,@JsonKey(name: 'market_cap_btc') String marketCapBtc,@JsonKey(name: 'total_volume') String totalVolume,@JsonKey(name: 'total_volume_btc') String totalVolumeBtc, String sparkline
});




}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? priceBtc = null,Object? priceChangePercentage24h = null,Object? marketCap = null,Object? marketCapBtc = null,Object? totalVolume = null,Object? totalVolumeBtc = null,Object? sparkline = null,}) {
  return _then(_Data(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceBtc: null == priceBtc ? _self.priceBtc : priceBtc // ignore: cast_nullable_to_non_nullable
as String,priceChangePercentage24h: null == priceChangePercentage24h ? _self._priceChangePercentage24h : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
as Map<String, double>,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as String,marketCapBtc: null == marketCapBtc ? _self.marketCapBtc : marketCapBtc // ignore: cast_nullable_to_non_nullable
as String,totalVolume: null == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as String,totalVolumeBtc: null == totalVolumeBtc ? _self.totalVolumeBtc : totalVolumeBtc // ignore: cast_nullable_to_non_nullable
as String,sparkline: null == sparkline ? _self.sparkline : sparkline // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
