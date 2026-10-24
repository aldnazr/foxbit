// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_detail_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinDetailArgs {

 String get id; String? get name; String? get symbol; String? get image; int? get marketCapRank;
/// Create a copy of CoinDetailArgs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinDetailArgsCopyWith<CoinDetailArgs> get copyWith => _$CoinDetailArgsCopyWithImpl<CoinDetailArgs>(this as CoinDetailArgs, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CoinDetailArgs;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinDetailArgs&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.marketCapRank, _this.marketCapRank) || other.marketCapRank == _this.marketCapRank));
}


@override
int get hashCode {
  final _this = this as CoinDetailArgs;
  return Object.hash(runtimeType,_this.id,_this.name,_this.symbol,_this.image,_this.marketCapRank);
}

@override
String toString() {
  final _this = this as CoinDetailArgs;
  return 'CoinDetailArgs(id: ${_this.id}, name: ${_this.name}, symbol: ${_this.symbol}, image: ${_this.image}, marketCapRank: ${_this.marketCapRank})';
}


}

/// @nodoc
abstract mixin class $CoinDetailArgsCopyWith<$Res>  {
  factory $CoinDetailArgsCopyWith(CoinDetailArgs value, $Res Function(CoinDetailArgs) _then) = _$CoinDetailArgsCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? symbol, String? image, int? marketCapRank
});




}
/// @nodoc
class _$CoinDetailArgsCopyWithImpl<$Res>
    implements $CoinDetailArgsCopyWith<$Res> {
  _$CoinDetailArgsCopyWithImpl(this._self, this._then);

  final CoinDetailArgs _self;
  final $Res Function(CoinDetailArgs) _then;

/// Create a copy of CoinDetailArgs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? symbol = freezed,Object? image = freezed,Object? marketCapRank = freezed,}) {
  return _then(CoinDetailArgs(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinDetailArgs].
extension CoinDetailArgsPatterns on CoinDetailArgs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinDetailArgs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinDetailArgs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinDetailArgs value)  $default,){
final _that = this;
switch (_that) {
case _CoinDetailArgs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinDetailArgs value)?  $default,){
final _that = this;
switch (_that) {
case _CoinDetailArgs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? symbol,  String? image,  int? marketCapRank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinDetailArgs() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.image,_that.marketCapRank);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? symbol,  String? image,  int? marketCapRank)  $default,) {final _that = this;
switch (_that) {
case _CoinDetailArgs():
return $default(_that.id,_that.name,_that.symbol,_that.image,_that.marketCapRank);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? symbol,  String? image,  int? marketCapRank)?  $default,) {final _that = this;
switch (_that) {
case _CoinDetailArgs() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.image,_that.marketCapRank);case _:
  return null;

}
}

}

/// @nodoc


class _CoinDetailArgs implements CoinDetailArgs {
  const _CoinDetailArgs({required this.id, this.name, this.symbol, this.image, this.marketCapRank});
  

@override final  String id;
@override final  String? name;
@override final  String? symbol;
@override final  String? image;
@override final  int? marketCapRank;

/// Create a copy of CoinDetailArgs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinDetailArgsCopyWith<_CoinDetailArgs> get copyWith => __$CoinDetailArgsCopyWithImpl<_CoinDetailArgs>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinDetailArgs&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.image, image) || other.image == image)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,symbol,image,marketCapRank);
}

@override
String toString() {
    return 'CoinDetailArgs(id: $id, name: $name, symbol: $symbol, image: $image, marketCapRank: $marketCapRank)';
}


}

/// @nodoc
abstract mixin class _$CoinDetailArgsCopyWith<$Res> implements $CoinDetailArgsCopyWith<$Res> {
  factory _$CoinDetailArgsCopyWith(_CoinDetailArgs value, $Res Function(_CoinDetailArgs) _then) = __$CoinDetailArgsCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? symbol, String? image, int? marketCapRank
});




}
/// @nodoc
class __$CoinDetailArgsCopyWithImpl<$Res>
    implements _$CoinDetailArgsCopyWith<$Res> {
  __$CoinDetailArgsCopyWithImpl(this._self, this._then);

  final _CoinDetailArgs _self;
  final $Res Function(_CoinDetailArgs) _then;

/// Create a copy of CoinDetailArgs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? symbol = freezed,Object? image = freezed,Object? marketCapRank = freezed,}) {
  return _then(_CoinDetailArgs(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,marketCapRank: freezed == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
