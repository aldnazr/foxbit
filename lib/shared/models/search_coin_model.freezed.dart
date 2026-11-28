// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_coin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchCoinModel {

 List<SearchCoin> get coins;
/// Create a copy of SearchCoinModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCoinModelCopyWith<SearchCoinModel> get copyWith => _$SearchCoinModelCopyWithImpl<SearchCoinModel>(this as SearchCoinModel, _$identity);

  /// Serializes this SearchCoinModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SearchCoinModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchCoinModel&&const DeepCollectionEquality().equals(other.coins, _this.coins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SearchCoinModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.coins));
}

@override
String toString() {
  final _this = this as SearchCoinModel;
  return 'SearchCoinModel(coins: ${_this.coins})';
}


}

/// @nodoc
abstract mixin class $SearchCoinModelCopyWith<$Res>  {
  factory $SearchCoinModelCopyWith(SearchCoinModel value, $Res Function(SearchCoinModel) _then) = _$SearchCoinModelCopyWithImpl;
@useResult
$Res call({
 List<SearchCoin> coins
});




}
/// @nodoc
class _$SearchCoinModelCopyWithImpl<$Res>
    implements $SearchCoinModelCopyWith<$Res> {
  _$SearchCoinModelCopyWithImpl(this._self, this._then);

  final SearchCoinModel _self;
  final $Res Function(SearchCoinModel) _then;

/// Create a copy of SearchCoinModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coins = null,}) {
  return _then(SearchCoinModel(
coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as List<SearchCoin>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchCoinModel].
extension SearchCoinModelPatterns on SearchCoinModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchCoinModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchCoinModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchCoinModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchCoinModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchCoinModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchCoinModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchCoin> coins)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchCoinModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchCoin> coins)  $default,) {final _that = this;
switch (_that) {
case _SearchCoinModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchCoin> coins)?  $default,) {final _that = this;
switch (_that) {
case _SearchCoinModel() when $default != null:
return $default(_that.coins);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchCoinModel implements SearchCoinModel {
  const _SearchCoinModel({required  List<SearchCoin> coins}): _coins = coins;
  factory _SearchCoinModel.fromJson(Map<String, dynamic> json) => _$SearchCoinModelFromJson(json);

 final  List<SearchCoin> _coins;
@override List<SearchCoin> get coins {
  if (_coins is EqualUnmodifiableListView) return _coins;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coins);
}


/// Create a copy of SearchCoinModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCoinModelCopyWith<_SearchCoinModel> get copyWith => __$SearchCoinModelCopyWithImpl<_SearchCoinModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchCoinModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchCoinModel&&const DeepCollectionEquality().equals(other.coins, _coins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_coins));
}

@override
String toString() {
    return 'SearchCoinModel(coins: $coins)';
}


}

/// @nodoc
abstract mixin class _$SearchCoinModelCopyWith<$Res> implements $SearchCoinModelCopyWith<$Res> {
  factory _$SearchCoinModelCopyWith(_SearchCoinModel value, $Res Function(_SearchCoinModel) _then) = __$SearchCoinModelCopyWithImpl;
@override @useResult
$Res call({
 List<SearchCoin> coins
});




}
/// @nodoc
class __$SearchCoinModelCopyWithImpl<$Res>
    implements _$SearchCoinModelCopyWith<$Res> {
  __$SearchCoinModelCopyWithImpl(this._self, this._then);

  final _SearchCoinModel _self;
  final $Res Function(_SearchCoinModel) _then;

/// Create a copy of SearchCoinModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coins = null,}) {
  return _then(_SearchCoinModel(
coins: null == coins ? _self._coins : coins // ignore: cast_nullable_to_non_nullable
as List<SearchCoin>,
  ));
}


}


/// @nodoc
mixin _$SearchCoin {

 String get id; String get name; String get symbol;@JsonKey(name: 'market_cap_rank') int? get marketCapRank; String? get thumb; String? get large;
/// Create a copy of SearchCoin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCoinCopyWith<SearchCoin> get copyWith => _$SearchCoinCopyWithImpl<SearchCoin>(this as SearchCoin, _$identity);

  /// Serializes this SearchCoin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SearchCoin;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchCoin&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.marketCapRank, _this.marketCapRank) || other.marketCapRank == _this.marketCapRank)&&(identical(other.thumb, _this.thumb) || other.thumb == _this.thumb)&&(identical(other.large, _this.large) || other.large == _this.large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SearchCoin;
  return Object.hash(runtimeType,_this.id,_this.name,_this.symbol,_this.marketCapRank,_this.thumb,_this.large);
}

@override
String toString() {
  final _this = this as SearchCoin;
  return 'SearchCoin(id: ${_this.id}, name: ${_this.name}, symbol: ${_this.symbol}, marketCapRank: ${_this.marketCapRank}, thumb: ${_this.thumb}, large: ${_this.large})';
}


}

/// @nodoc
abstract mixin class $SearchCoinCopyWith<$Res>  {
  factory $SearchCoinCopyWith(SearchCoin value, $Res Function(SearchCoin) _then) = _$SearchCoinCopyWithImpl;
@useResult
$Res call({
 String id, String name, String symbol,@JsonKey(name: 'market_cap_rank') int? marketCapRank, String? thumb, String? large
});




}
/// @nodoc
class _$SearchCoinCopyWithImpl<$Res>
    implements $SearchCoinCopyWith<$Res> {
  _$SearchCoinCopyWithImpl(this._self, this._then);

  final SearchCoin _self;
  final $Res Function(SearchCoin) _then;

/// Create a copy of SearchCoin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? symbol = null,Object? marketCapRank = freezed,Object? thumb = freezed,Object? large = freezed,}) {
  return _then(SearchCoin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,thumb: freezed == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String?,large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchCoin].
extension SearchCoinPatterns on SearchCoin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchCoin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchCoin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchCoin value)  $default,){
final _that = this;
switch (_that) {
case _SearchCoin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchCoin value)?  $default,){
final _that = this;
switch (_that) {
case _SearchCoin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String symbol, @JsonKey(name: 'market_cap_rank')  int? marketCapRank,  String? thumb,  String? large)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchCoin() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.marketCapRank,_that.thumb,_that.large);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String symbol, @JsonKey(name: 'market_cap_rank')  int? marketCapRank,  String? thumb,  String? large)  $default,) {final _that = this;
switch (_that) {
case _SearchCoin():
return $default(_that.id,_that.name,_that.symbol,_that.marketCapRank,_that.thumb,_that.large);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String symbol, @JsonKey(name: 'market_cap_rank')  int? marketCapRank,  String? thumb,  String? large)?  $default,) {final _that = this;
switch (_that) {
case _SearchCoin() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.marketCapRank,_that.thumb,_that.large);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchCoin implements SearchCoin {
  const _SearchCoin({required this.id, required this.name, required this.symbol, @JsonKey(name: 'market_cap_rank') this.marketCapRank, this.thumb, this.large});
  factory _SearchCoin.fromJson(Map<String, dynamic> json) => _$SearchCoinFromJson(json);

@override final  String id;
@override final  String name;
@override final  String symbol;
@override@JsonKey(name: 'market_cap_rank') final  int? marketCapRank;
@override final  String? thumb;
@override final  String? large;

/// Create a copy of SearchCoin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCoinCopyWith<_SearchCoin> get copyWith => __$SearchCoinCopyWithImpl<_SearchCoin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchCoinToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchCoin&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank)&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,symbol,marketCapRank,thumb,large);
}

@override
String toString() {
    return 'SearchCoin(id: $id, name: $name, symbol: $symbol, marketCapRank: $marketCapRank, thumb: $thumb, large: $large)';
}


}

/// @nodoc
abstract mixin class _$SearchCoinCopyWith<$Res> implements $SearchCoinCopyWith<$Res> {
  factory _$SearchCoinCopyWith(_SearchCoin value, $Res Function(_SearchCoin) _then) = __$SearchCoinCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String symbol,@JsonKey(name: 'market_cap_rank') int? marketCapRank, String? thumb, String? large
});




}
/// @nodoc
class __$SearchCoinCopyWithImpl<$Res>
    implements _$SearchCoinCopyWith<$Res> {
  __$SearchCoinCopyWithImpl(this._self, this._then);

  final _SearchCoin _self;
  final $Res Function(_SearchCoin) _then;

/// Create a copy of SearchCoin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? symbol = null,Object? marketCapRank = freezed,Object? thumb = freezed,Object? large = freezed,}) {
  return _then(_SearchCoin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,thumb: freezed == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String?,large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
