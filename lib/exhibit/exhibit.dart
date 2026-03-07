import 'package:freezed_annotation/freezed_annotation.dart';

part 'exhibit.freezed.dart';
part 'exhibit.g.dart';

@freezed
abstract class Exhibit with _$Exhibit {
  const factory Exhibit({
    required String id,
    required String name,
    required String image,
    @JsonKey(name: 'stamp_image') required String stampImage,
    required String description,
    @JsonKey(name: 'linked_goods_ids') required List<String> linkedGoodsIds,
  }) = _Exhibit;

  factory Exhibit.fromJson(Map<String, dynamic> json) =>
      _$ExhibitFromJson(json);
}
