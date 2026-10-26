// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fear_greed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FearGreed {

@JsonKey(name: 'data', fromJson: _valueFromData, includeToJson: false) int get value;@JsonKey(name: 'data', fromJson: _classificationFromData, includeToJson: false) String get classification;@JsonKey(name: 'data', fromJson: _timestampFromData, includeToJson: false) DateTime? get timestamp;@JsonKey(name: 'data', fromJson: _historyFromData, includeToJson: false) List<int> get history;
/// Create a copy of FearGreed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FearGreedCopyWith<FearGreed> get copyWith => _$FearGreedCopyWithImpl<FearGreed>(this as FearGreed, _$identity);

  /// Serializes this FearGreed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FearGreed;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FearGreed&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.classification, _this.classification) || other.classification == _this.classification)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp)&&const DeepCollectionEquality().equals(other.history, _this.history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FearGreed;
  return Object.hash(runtimeType,_this.value,_this.classification,_this.timestamp,const DeepCollectionEquality().hash(_this.history));
}

@override
String toString() {
  final _this = this as FearGreed;
  return 'FearGreed(value: ${_this.value}, classification: ${_this.classification}, timestamp: ${_this.timestamp}, history: ${_this.history})';
}


}

/// @nodoc
abstract mixin class $FearGreedCopyWith<$Res>  {
  factory $FearGreedCopyWith(FearGreed value, $Res Function(FearGreed) _then) = _$FearGreedCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'data', fromJson: _valueFromData, includeToJson: false) int value,@JsonKey(name: 'data', fromJson: _classificationFromData, includeToJson: false) String classification,@JsonKey(name: 'data', fromJson: _timestampFromData, includeToJson: false) DateTime? timestamp,@JsonKey(name: 'data', fromJson: _historyFromData, includeToJson: false) List<int> history
});




}
/// @nodoc
class _$FearGreedCopyWithImpl<$Res>
    implements $FearGreedCopyWith<$Res> {
  _$FearGreedCopyWithImpl(this._self, this._then);

  final FearGreed _self;
  final $Res Function(FearGreed) _then;

/// Create a copy of FearGreed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? classification = null,Object? timestamp = freezed,Object? history = null,}) {
  return _then(FearGreed(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [FearGreed].
extension FearGreedPatterns on FearGreed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FearGreed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FearGreed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FearGreed value)  $default,){
final _that = this;
switch (_that) {
case _FearGreed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FearGreed value)?  $default,){
final _that = this;
switch (_that) {
case _FearGreed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'data', fromJson: _valueFromData, includeToJson: false)  int value, @JsonKey(name: 'data', fromJson: _classificationFromData, includeToJson: false)  String classification, @JsonKey(name: 'data', fromJson: _timestampFromData, includeToJson: false)  DateTime? timestamp, @JsonKey(name: 'data', fromJson: _historyFromData, includeToJson: false)  List<int> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FearGreed() when $default != null:
return $default(_that.value,_that.classification,_that.timestamp,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'data', fromJson: _valueFromData, includeToJson: false)  int value, @JsonKey(name: 'data', fromJson: _classificationFromData, includeToJson: false)  String classification, @JsonKey(name: 'data', fromJson: _timestampFromData, includeToJson: false)  DateTime? timestamp, @JsonKey(name: 'data', fromJson: _historyFromData, includeToJson: false)  List<int> history)  $default,) {final _that = this;
switch (_that) {
case _FearGreed():
return $default(_that.value,_that.classification,_that.timestamp,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'data', fromJson: _valueFromData, includeToJson: false)  int value, @JsonKey(name: 'data', fromJson: _classificationFromData, includeToJson: false)  String classification, @JsonKey(name: 'data', fromJson: _timestampFromData, includeToJson: false)  DateTime? timestamp, @JsonKey(name: 'data', fromJson: _historyFromData, includeToJson: false)  List<int> history)?  $default,) {final _that = this;
switch (_that) {
case _FearGreed() when $default != null:
return $default(_that.value,_that.classification,_that.timestamp,_that.history);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FearGreed extends FearGreed {
  const _FearGreed({@JsonKey(name: 'data', fromJson: _valueFromData, includeToJson: false) required this.value, @JsonKey(name: 'data', fromJson: _classificationFromData, includeToJson: false) required this.classification, @JsonKey(name: 'data', fromJson: _timestampFromData, includeToJson: false) this.timestamp, @JsonKey(name: 'data', fromJson: _historyFromData, includeToJson: false)  List<int> history = const <int>[]}): _history = history,super._();
  factory _FearGreed.fromJson(Map<String, dynamic> json) => _$FearGreedFromJson(json);

@override@JsonKey(name: 'data', fromJson: _valueFromData, includeToJson: false) final  int value;
@override@JsonKey(name: 'data', fromJson: _classificationFromData, includeToJson: false) final  String classification;
@override@JsonKey(name: 'data', fromJson: _timestampFromData, includeToJson: false) final  DateTime? timestamp;
 final  List<int> _history;
@override@JsonKey(name: 'data', fromJson: _historyFromData, includeToJson: false) List<int> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of FearGreed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FearGreedCopyWith<_FearGreed> get copyWith => __$FearGreedCopyWithImpl<_FearGreed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FearGreedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FearGreed&&(identical(other.value, value) || other.value == value)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,value,classification,timestamp,const DeepCollectionEquality().hash(_history));
}

@override
String toString() {
    return 'FearGreed(value: $value, classification: $classification, timestamp: $timestamp, history: $history)';
}


}

/// @nodoc
abstract mixin class _$FearGreedCopyWith<$Res> implements $FearGreedCopyWith<$Res> {
  factory _$FearGreedCopyWith(_FearGreed value, $Res Function(_FearGreed) _then) = __$FearGreedCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'data', fromJson: _valueFromData, includeToJson: false) int value,@JsonKey(name: 'data', fromJson: _classificationFromData, includeToJson: false) String classification,@JsonKey(name: 'data', fromJson: _timestampFromData, includeToJson: false) DateTime? timestamp,@JsonKey(name: 'data', fromJson: _historyFromData, includeToJson: false) List<int> history
});




}
/// @nodoc
class __$FearGreedCopyWithImpl<$Res>
    implements _$FearGreedCopyWith<$Res> {
  __$FearGreedCopyWithImpl(this._self, this._then);

  final _FearGreed _self;
  final $Res Function(_FearGreed) _then;

/// Create a copy of FearGreed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? classification = null,Object? timestamp = freezed,Object? history = null,}) {
  return _then(_FearGreed(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
