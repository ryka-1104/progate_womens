import 'package:freezed_annotation/freezed_annotation.dart';
import 'exhibit.dart';
import 'exhibit_attribute.dart';
import 'goods.dart';

part 'root_data.freezed.dart';
part 'root_data.g.dart';

@freezed
abstract class RootData with _$RootData {
  const factory RootData({
    @JsonKey(name: 'exhibit_attributes')
    required List<ExhibitAttribute> exhibitAttributes,
    required List<Exhibit> exhibits,
    required List<Goods> goods,
  }) = _RootData;

  factory RootData.fromJson(Map<String, dynamic> json) =>
      _$RootDataFromJson(json);
}
