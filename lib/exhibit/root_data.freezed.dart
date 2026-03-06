// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RootData {

@JsonKey(name: 'exhibit_attributes') List<ExhibitAttribute> get exhibitAttributes; List<Exhibit> get exhibits; List<Goods> get goods;
/// Create a copy of RootData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RootDataCopyWith<RootData> get copyWith => _$RootDataCopyWithImpl<RootData>(this as RootData, _$identity);

  /// Serializes this RootData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RootData&&const DeepCollectionEquality().equals(other.exhibitAttributes, exhibitAttributes)&&const DeepCollectionEquality().equals(other.exhibits, exhibits)&&const DeepCollectionEquality().equals(other.goods, goods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(exhibitAttributes),const DeepCollectionEquality().hash(exhibits),const DeepCollectionEquality().hash(goods));

@override
String toString() {
  return 'RootData(exhibitAttributes: $exhibitAttributes, exhibits: $exhibits, goods: $goods)';
}


}

/// @nodoc
abstract mixin class $RootDataCopyWith<$Res>  {
  factory $RootDataCopyWith(RootData value, $Res Function(RootData) _then) = _$RootDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'exhibit_attributes') List<ExhibitAttribute> exhibitAttributes, List<Exhibit> exhibits, List<Goods> goods
});




}
/// @nodoc
class _$RootDataCopyWithImpl<$Res>
    implements $RootDataCopyWith<$Res> {
  _$RootDataCopyWithImpl(this._self, this._then);

  final RootData _self;
  final $Res Function(RootData) _then;

/// Create a copy of RootData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exhibitAttributes = null,Object? exhibits = null,Object? goods = null,}) {
  return _then(_self.copyWith(
exhibitAttributes: null == exhibitAttributes ? _self.exhibitAttributes : exhibitAttributes // ignore: cast_nullable_to_non_nullable
as List<ExhibitAttribute>,exhibits: null == exhibits ? _self.exhibits : exhibits // ignore: cast_nullable_to_non_nullable
as List<Exhibit>,goods: null == goods ? _self.goods : goods // ignore: cast_nullable_to_non_nullable
as List<Goods>,
  ));
}

}


/// Adds pattern-matching-related methods to [RootData].
extension RootDataPatterns on RootData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RootData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RootData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RootData value)  $default,){
final _that = this;
switch (_that) {
case _RootData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RootData value)?  $default,){
final _that = this;
switch (_that) {
case _RootData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'exhibit_attributes')  List<ExhibitAttribute> exhibitAttributes,  List<Exhibit> exhibits,  List<Goods> goods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RootData() when $default != null:
return $default(_that.exhibitAttributes,_that.exhibits,_that.goods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'exhibit_attributes')  List<ExhibitAttribute> exhibitAttributes,  List<Exhibit> exhibits,  List<Goods> goods)  $default,) {final _that = this;
switch (_that) {
case _RootData():
return $default(_that.exhibitAttributes,_that.exhibits,_that.goods);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'exhibit_attributes')  List<ExhibitAttribute> exhibitAttributes,  List<Exhibit> exhibits,  List<Goods> goods)?  $default,) {final _that = this;
switch (_that) {
case _RootData() when $default != null:
return $default(_that.exhibitAttributes,_that.exhibits,_that.goods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RootData implements RootData {
  const _RootData({@JsonKey(name: 'exhibit_attributes') required final  List<ExhibitAttribute> exhibitAttributes, required final  List<Exhibit> exhibits, required final  List<Goods> goods}): _exhibitAttributes = exhibitAttributes,_exhibits = exhibits,_goods = goods;
  factory _RootData.fromJson(Map<String, dynamic> json) => _$RootDataFromJson(json);

 final  List<ExhibitAttribute> _exhibitAttributes;
@override@JsonKey(name: 'exhibit_attributes') List<ExhibitAttribute> get exhibitAttributes {
  if (_exhibitAttributes is EqualUnmodifiableListView) return _exhibitAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exhibitAttributes);
}

 final  List<Exhibit> _exhibits;
@override List<Exhibit> get exhibits {
  if (_exhibits is EqualUnmodifiableListView) return _exhibits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exhibits);
}

 final  List<Goods> _goods;
@override List<Goods> get goods {
  if (_goods is EqualUnmodifiableListView) return _goods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goods);
}


/// Create a copy of RootData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RootDataCopyWith<_RootData> get copyWith => __$RootDataCopyWithImpl<_RootData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RootDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RootData&&const DeepCollectionEquality().equals(other._exhibitAttributes, _exhibitAttributes)&&const DeepCollectionEquality().equals(other._exhibits, _exhibits)&&const DeepCollectionEquality().equals(other._goods, _goods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_exhibitAttributes),const DeepCollectionEquality().hash(_exhibits),const DeepCollectionEquality().hash(_goods));

@override
String toString() {
  return 'RootData(exhibitAttributes: $exhibitAttributes, exhibits: $exhibits, goods: $goods)';
}


}

/// @nodoc
abstract mixin class _$RootDataCopyWith<$Res> implements $RootDataCopyWith<$Res> {
  factory _$RootDataCopyWith(_RootData value, $Res Function(_RootData) _then) = __$RootDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'exhibit_attributes') List<ExhibitAttribute> exhibitAttributes, List<Exhibit> exhibits, List<Goods> goods
});




}
/// @nodoc
class __$RootDataCopyWithImpl<$Res>
    implements _$RootDataCopyWith<$Res> {
  __$RootDataCopyWithImpl(this._self, this._then);

  final _RootData _self;
  final $Res Function(_RootData) _then;

/// Create a copy of RootData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exhibitAttributes = null,Object? exhibits = null,Object? goods = null,}) {
  return _then(_RootData(
exhibitAttributes: null == exhibitAttributes ? _self._exhibitAttributes : exhibitAttributes // ignore: cast_nullable_to_non_nullable
as List<ExhibitAttribute>,exhibits: null == exhibits ? _self._exhibits : exhibits // ignore: cast_nullable_to_non_nullable
as List<Exhibit>,goods: null == goods ? _self._goods : goods // ignore: cast_nullable_to_non_nullable
as List<Goods>,
  ));
}


}

// dart format on
