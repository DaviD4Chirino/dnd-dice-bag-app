// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../dice_bag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiceBag {

 String get label; List<Die> get dice;
/// Create a copy of DiceBag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiceBagCopyWith<DiceBag> get copyWith => _$DiceBagCopyWithImpl<DiceBag>(this as DiceBag, _$identity);

  /// Serializes this DiceBag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiceBag&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.dice, dice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,const DeepCollectionEquality().hash(dice));

@override
String toString() {
  return 'DiceBag(label: $label, dice: $dice)';
}


}

/// @nodoc
abstract mixin class $DiceBagCopyWith<$Res>  {
  factory $DiceBagCopyWith(DiceBag value, $Res Function(DiceBag) _then) = _$DiceBagCopyWithImpl;
@useResult
$Res call({
 String label, List<Die> dice
});




}
/// @nodoc
class _$DiceBagCopyWithImpl<$Res>
    implements $DiceBagCopyWith<$Res> {
  _$DiceBagCopyWithImpl(this._self, this._then);

  final DiceBag _self;
  final $Res Function(DiceBag) _then;

/// Create a copy of DiceBag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? dice = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,dice: null == dice ? _self.dice : dice // ignore: cast_nullable_to_non_nullable
as List<Die>,
  ));
}

}


/// Adds pattern-matching-related methods to [DiceBag].
extension DiceBagPatterns on DiceBag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiceBag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiceBag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiceBag value)  $default,){
final _that = this;
switch (_that) {
case _DiceBag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiceBag value)?  $default,){
final _that = this;
switch (_that) {
case _DiceBag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  List<Die> dice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiceBag() when $default != null:
return $default(_that.label,_that.dice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  List<Die> dice)  $default,) {final _that = this;
switch (_that) {
case _DiceBag():
return $default(_that.label,_that.dice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  List<Die> dice)?  $default,) {final _that = this;
switch (_that) {
case _DiceBag() when $default != null:
return $default(_that.label,_that.dice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiceBag implements DiceBag {
  const _DiceBag({required this.label, required final  List<Die> dice}): _dice = dice;
  factory _DiceBag.fromJson(Map<String, dynamic> json) => _$DiceBagFromJson(json);

@override final  String label;
 final  List<Die> _dice;
@override List<Die> get dice {
  if (_dice is EqualUnmodifiableListView) return _dice;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dice);
}


/// Create a copy of DiceBag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiceBagCopyWith<_DiceBag> get copyWith => __$DiceBagCopyWithImpl<_DiceBag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiceBagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiceBag&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other._dice, _dice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,const DeepCollectionEquality().hash(_dice));

@override
String toString() {
  return 'DiceBag(label: $label, dice: $dice)';
}


}

/// @nodoc
abstract mixin class _$DiceBagCopyWith<$Res> implements $DiceBagCopyWith<$Res> {
  factory _$DiceBagCopyWith(_DiceBag value, $Res Function(_DiceBag) _then) = __$DiceBagCopyWithImpl;
@override @useResult
$Res call({
 String label, List<Die> dice
});




}
/// @nodoc
class __$DiceBagCopyWithImpl<$Res>
    implements _$DiceBagCopyWith<$Res> {
  __$DiceBagCopyWithImpl(this._self, this._then);

  final _DiceBag _self;
  final $Res Function(_DiceBag) _then;

/// Create a copy of DiceBag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? dice = null,}) {
  return _then(_DiceBag(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,dice: null == dice ? _self._dice : dice // ignore: cast_nullable_to_non_nullable
as List<Die>,
  ));
}


}

// dart format on
