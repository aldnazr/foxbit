// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portofolio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortofolioModel {

 String get id; String get symbol; String get name; String get image;@JsonKey(name: 'marketCapRank') int get marketCapRank;
/// Create a copy of PortofolioModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortofolioModelCopyWith<PortofolioModel> get copyWith => _$PortofolioModelCopyWithImpl<PortofolioModel>(this as PortofolioModel, _$identity);

  /// Serializes this PortofolioModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PortofolioModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortofolioModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.symbol, _this.symbol) || other.symbol == _this.symbol)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.marketCapRank, _this.marketCapRank) || other.marketCapRank == _this.marketCapRank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PortofolioModel;
  return Object.hash(runtimeType,_this.id,_this.symbol,_this.name,_this.image,_this.marketCapRank);
}

@override
String toString() {
  final _this = this as PortofolioModel;
  return 'PortofolioModel(id: ${_this.id}, symbol: ${_this.symbol}, name: ${_this.name}, image: ${_this.image}, marketCapRank: ${_this.marketCapRank})';
}


}

/// @nodoc
abstract mixin class $PortofolioModelCopyWith<$Res>  {
  factory $PortofolioModelCopyWith(PortofolioModel value, $Res Function(PortofolioModel) _then) = _$PortofolioModelCopyWithImpl;
@useResult
$Res call({
 String id, String symbol, String name, String image,@JsonKey(name: 'marketCapRank') int marketCapRank
});




}
/// @nodoc
class _$PortofolioModelCopyWithImpl<$Res>
    implements $PortofolioModelCopyWith<$Res> {
  _$PortofolioModelCopyWithImpl(this._self, this._then);

  final PortofolioModel _self;
  final $Res Function(PortofolioModel) _then;

/// Create a copy of PortofolioModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = null,Object? marketCapRank = null,}) {
  return _then(PortofolioModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,marketCapRank: null == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PortofolioModel].
extension PortofolioModelPatterns on PortofolioModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortofolioModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortofolioModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortofolioModel value)  $default,){
final _that = this;
switch (_that) {
case _PortofolioModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortofolioModel value)?  $default,){
final _that = this;
switch (_that) {
case _PortofolioModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String image, @JsonKey(name: 'marketCapRank')  int marketCapRank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortofolioModel() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.marketCapRank);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String symbol,  String name,  String image, @JsonKey(name: 'marketCapRank')  int marketCapRank)  $default,) {final _that = this;
switch (_that) {
case _PortofolioModel():
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.marketCapRank);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String symbol,  String name,  String image, @JsonKey(name: 'marketCapRank')  int marketCapRank)?  $default,) {final _that = this;
switch (_that) {
case _PortofolioModel() when $default != null:
return $default(_that.id,_that.symbol,_that.name,_that.image,_that.marketCapRank);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortofolioModel implements PortofolioModel {
  const _PortofolioModel({required this.id, required this.symbol, required this.name, required this.image, @JsonKey(name: 'marketCapRank') required this.marketCapRank});
  factory _PortofolioModel.fromJson(Map<String, dynamic> json) => _$PortofolioModelFromJson(json);

@override final  String id;
@override final  String symbol;
@override final  String name;
@override final  String image;
@override@JsonKey(name: 'marketCapRank') final  int marketCapRank;

/// Create a copy of PortofolioModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortofolioModelCopyWith<_PortofolioModel> get copyWith => __$PortofolioModelCopyWithImpl<_PortofolioModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortofolioModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortofolioModel&&(identical(other.id, id) || other.id == id)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.marketCapRank, marketCapRank) || other.marketCapRank == marketCapRank));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,symbol,name,image,marketCapRank);
}

@override
String toString() {
    return 'PortofolioModel(id: $id, symbol: $symbol, name: $name, image: $image, marketCapRank: $marketCapRank)';
}


}

/// @nodoc
abstract mixin class _$PortofolioModelCopyWith<$Res> implements $PortofolioModelCopyWith<$Res> {
  factory _$PortofolioModelCopyWith(_PortofolioModel value, $Res Function(_PortofolioModel) _then) = __$PortofolioModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String symbol, String name, String image,@JsonKey(name: 'marketCapRank') int marketCapRank
});




}
/// @nodoc
class __$PortofolioModelCopyWithImpl<$Res>
    implements _$PortofolioModelCopyWith<$Res> {
  __$PortofolioModelCopyWithImpl(this._self, this._then);

  final _PortofolioModel _self;
  final $Res Function(_PortofolioModel) _then;

/// Create a copy of PortofolioModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? symbol = null,Object? name = null,Object? image = null,Object? marketCapRank = null,}) {
  return _then(_PortofolioModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,marketCapRank: null == marketCapRank ? _self.marketCapRank : marketCapRank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
