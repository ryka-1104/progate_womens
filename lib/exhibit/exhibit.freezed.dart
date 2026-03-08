// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exhibit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Exhibit {

 String get id; String get name; String get image;@JsonKey(name: 'stamp_image') String get stampImage; String get description;@JsonKey(name: 'linked_goods_ids') List<String> get linkedGoodsIds;
/// Create a copy of Exhibit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExhibitCopyWith<Exhibit> get copyWith => _$ExhibitCopyWithImpl<Exhibit>(this as Exhibit, _$identity);

  /// Serializes this Exhibit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Exhibit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.stampImage, stampImage) || other.stampImage == stampImage)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.linkedGoodsIds, linkedGoodsIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,stampImage,description,const DeepCollectionEquality().hash(linkedGoodsIds));

@override
String toString() {
  return 'Exhibit(id: $id, name: $name, image: $image, stampImage: $stampImage, description: $description, linkedGoodsIds: $linkedGoodsIds)';
}


}

/// @nodoc
abstract mixin class $ExhibitCopyWith<$Res>  {
  factory $ExhibitCopyWith(Exhibit value, $Res Function(Exhibit) _then) = _$ExhibitCopyWithImpl;
@useResult
$Res call({
 String id, String name, String image,@JsonKey(name: 'stamp_image') String stampImage, String description,@JsonKey(name: 'linked_goods_ids') List<String> linkedGoodsIds
});




}
/// @nodoc
class _$ExhibitCopyWithImpl<$Res>
    implements $ExhibitCopyWith<$Res> {
  _$ExhibitCopyWithImpl(this._self, this._then);

  final Exhibit _self;
  final $Res Function(Exhibit) _then;

/// Create a copy of Exhibit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = null,Object? stampImage = null,Object? description = null,Object? linkedGoodsIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,stampImage: null == stampImage ? _self.stampImage : stampImage // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,linkedGoodsIds: null == linkedGoodsIds ? _self.linkedGoodsIds : linkedGoodsIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Exhibit].
extension ExhibitPatterns on Exhibit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Exhibit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Exhibit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Exhibit value)  $default,){
final _that = this;
switch (_that) {
case _Exhibit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Exhibit value)?  $default,){
final _that = this;
switch (_that) {
case _Exhibit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String image, @JsonKey(name: 'stamp_image')  String stampImage,  String description, @JsonKey(name: 'linked_goods_ids')  List<String> linkedGoodsIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Exhibit() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.stampImage,_that.description,_that.linkedGoodsIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String image, @JsonKey(name: 'stamp_image')  String stampImage,  String description, @JsonKey(name: 'linked_goods_ids')  List<String> linkedGoodsIds)  $default,) {final _that = this;
switch (_that) {
case _Exhibit():
return $default(_that.id,_that.name,_that.image,_that.stampImage,_that.description,_that.linkedGoodsIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String image, @JsonKey(name: 'stamp_image')  String stampImage,  String description, @JsonKey(name: 'linked_goods_ids')  List<String> linkedGoodsIds)?  $default,) {final _that = this;
switch (_that) {
case _Exhibit() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.stampImage,_that.description,_that.linkedGoodsIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Exhibit implements Exhibit {
  const _Exhibit({required this.id, required this.name, required this.image, @JsonKey(name: 'stamp_image') required this.stampImage, required this.description, @JsonKey(name: 'linked_goods_ids') required final  List<String> linkedGoodsIds}): _linkedGoodsIds = linkedGoodsIds;
  factory _Exhibit.fromJson(Map<String, dynamic> json) => _$ExhibitFromJson(json);

@override final  String id;
@override final  String name;
@override final  String image;
@override@JsonKey(name: 'stamp_image') final  String stampImage;
@override final  String description;
 final  List<String> _linkedGoodsIds;
@override@JsonKey(name: 'linked_goods_ids') List<String> get linkedGoodsIds {
  if (_linkedGoodsIds is EqualUnmodifiableListView) return _linkedGoodsIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_linkedGoodsIds);
}


/// Create a copy of Exhibit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExhibitCopyWith<_Exhibit> get copyWith => __$ExhibitCopyWithImpl<_Exhibit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExhibitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Exhibit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.stampImage, stampImage) || other.stampImage == stampImage)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._linkedGoodsIds, _linkedGoodsIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,stampImage,description,const DeepCollectionEquality().hash(_linkedGoodsIds));

@override
String toString() {
  return 'Exhibit(id: $id, name: $name, image: $image, stampImage: $stampImage, description: $description, linkedGoodsIds: $linkedGoodsIds)';
}


}

/// @nodoc
abstract mixin class _$ExhibitCopyWith<$Res> implements $ExhibitCopyWith<$Res> {
  factory _$ExhibitCopyWith(_Exhibit value, $Res Function(_Exhibit) _then) = __$ExhibitCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String image,@JsonKey(name: 'stamp_image') String stampImage, String description,@JsonKey(name: 'linked_goods_ids') List<String> linkedGoodsIds
});




}
/// @nodoc
class __$ExhibitCopyWithImpl<$Res>
    implements _$ExhibitCopyWith<$Res> {
  __$ExhibitCopyWithImpl(this._self, this._then);

  final _Exhibit _self;
  final $Res Function(_Exhibit) _then;

/// Create a copy of Exhibit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = null,Object? stampImage = null,Object? description = null,Object? linkedGoodsIds = null,}) {
  return _then(_Exhibit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,stampImage: null == stampImage ? _self.stampImage : stampImage // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,linkedGoodsIds: null == linkedGoodsIds ? _self._linkedGoodsIds : linkedGoodsIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
