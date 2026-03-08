// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exhibit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Exhibit _$ExhibitFromJson(Map<String, dynamic> json) => _Exhibit(
  id: json['id'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  stampImage: json['stamp_image'] as String,
  description: json['description'] as String,
  linkedGoodsIds: (json['linked_goods_ids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ExhibitToJson(_Exhibit instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'stamp_image': instance.stampImage,
  'description': instance.description,
  'linked_goods_ids': instance.linkedGoodsIds,
};
