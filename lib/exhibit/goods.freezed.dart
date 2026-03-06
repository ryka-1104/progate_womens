// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goods.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Goods {

 String get id; String get name; String get category; int get price; String get image;@JsonKey(name: 'exhibit_attribute_ids') List<String> get exhibitAttributeIds;
/// Create a copy of Goods
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoodsCopyWith<Goods> get copyWith => _$GoodsCopyWithImpl<Goods>(this as Goods, _$identity);

  /// Serializes this Goods to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Goods&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.exhibitAttributeIds, exhibitAttributeIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,image,const DeepCollectionEquality().hash(exhibitAttributeIds));

@override
String toString() {
  return 'Goods(id: $id, name: $name, category: $category, price: $price, image: $image, exhibitAttributeIds: $exhibitAttributeIds)';
}


}

/// @nodoc
abstract mixin class $GoodsCopyWith<$Res>  {
  factory $GoodsCopyWith(Goods value, $Res Function(Goods) _then) = _$GoodsCopyWithImpl;
@useResult
$Res call({
 String id, String name, String category, int price, String image,@JsonKey(name: 'exhibit_attribute_ids') List<String> exhibitAttributeIds
});




}
/// @nodoc
class _$GoodsCopyWithImpl<$Res>
    implements $GoodsCopyWith<$Res> {
  _$GoodsCopyWithImpl(this._self, this._then);

  final Goods _self;
  final $Res Function(Goods) _then;

/// Create a copy of Goods
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? image = null,Object? exhibitAttributeIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,exhibitAttributeIds: null == exhibitAttributeIds ? _self.exhibitAttributeIds : exhibitAttributeIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Goods].
extension GoodsPatterns on Goods {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Goods value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Goods() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Goods value)  $default,){
final _that = this;
switch (_that) {
case _Goods():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Goods value)?  $default,){
final _that = this;
switch (_that) {
case _Goods() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String category,  int price,  String image, @JsonKey(name: 'exhibit_attribute_ids')  List<String> exhibitAttributeIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Goods() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.image,_that.exhibitAttributeIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String category,  int price,  String image, @JsonKey(name: 'exhibit_attribute_ids')  List<String> exhibitAttributeIds)  $default,) {final _that = this;
switch (_that) {
case _Goods():
return $default(_that.id,_that.name,_that.category,_that.price,_that.image,_that.exhibitAttributeIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String category,  int price,  String image, @JsonKey(name: 'exhibit_attribute_ids')  List<String> exhibitAttributeIds)?  $default,) {final _that = this;
switch (_that) {
case _Goods() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.image,_that.exhibitAttributeIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Goods implements Goods {
  const _Goods({required this.id, required this.name, required this.category, required this.price, required this.image, @JsonKey(name: 'exhibit_attribute_ids') required final  List<String> exhibitAttributeIds}): _exhibitAttributeIds = exhibitAttributeIds;
  factory _Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);

@override final  String id;
@override final  String name;
@override final  String category;
@override final  int price;
@override final  String image;
 final  List<String> _exhibitAttributeIds;
@override@JsonKey(name: 'exhibit_attribute_ids') List<String> get exhibitAttributeIds {
  if (_exhibitAttributeIds is EqualUnmodifiableListView) return _exhibitAttributeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exhibitAttributeIds);
}


/// Create a copy of Goods
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoodsCopyWith<_Goods> get copyWith => __$GoodsCopyWithImpl<_Goods>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoodsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Goods&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._exhibitAttributeIds, _exhibitAttributeIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,image,const DeepCollectionEquality().hash(_exhibitAttributeIds));

@override
String toString() {
  return 'Goods(id: $id, name: $name, category: $category, price: $price, image: $image, exhibitAttributeIds: $exhibitAttributeIds)';
}


}

/// @nodoc
abstract mixin class _$GoodsCopyWith<$Res> implements $GoodsCopyWith<$Res> {
  factory _$GoodsCopyWith(_Goods value, $Res Function(_Goods) _then) = __$GoodsCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String category, int price, String image,@JsonKey(name: 'exhibit_attribute_ids') List<String> exhibitAttributeIds
});




}
/// @nodoc
class __$GoodsCopyWithImpl<$Res>
    implements _$GoodsCopyWith<$Res> {
  __$GoodsCopyWithImpl(this._self, this._then);

  final _Goods _self;
  final $Res Function(_Goods) _then;

/// Create a copy of Goods
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? image = null,Object? exhibitAttributeIds = null,}) {
  return _then(_Goods(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,exhibitAttributeIds: null == exhibitAttributeIds ? _self._exhibitAttributeIds : exhibitAttributeIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
