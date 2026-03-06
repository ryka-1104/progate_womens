// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Goods _$GoodsFromJson(Map<String, dynamic> json) => _Goods(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  price: (json['price'] as num).toInt(),
  image: json['image'] as String,
  exhibitAttributeIds: (json['exhibit_attribute_ids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$GoodsToJson(_Goods instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'price': instance.price,
  'image': instance.image,
  'exhibit_attribute_ids': instance.exhibitAttributeIds,
};
