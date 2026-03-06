// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RootData _$RootDataFromJson(Map<String, dynamic> json) => _RootData(
  exhibitAttributes: (json['exhibit_attributes'] as List<dynamic>)
      .map((e) => ExhibitAttribute.fromJson(e as Map<String, dynamic>))
      .toList(),
  exhibits: (json['exhibits'] as List<dynamic>)
      .map((e) => Exhibit.fromJson(e as Map<String, dynamic>))
      .toList(),
  goods: (json['goods'] as List<dynamic>)
      .map((e) => Goods.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RootDataToJson(_RootData instance) => <String, dynamic>{
  'exhibit_attributes': instance.exhibitAttributes,
  'exhibits': instance.exhibits,
  'goods': instance.goods,
};
