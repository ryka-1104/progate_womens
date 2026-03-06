import 'package:freezed_annotation/freezed_annotation.dart';

part 'goods.freezed.dart';
part 'goods.g.dart';

@freezed
abstract class Goods with _$Goods {
  const factory Goods({
    required String id,
    required String name,
    required String category,
    required int price,
    required String image,
    @JsonKey(name: 'exhibit_attribute_ids')
    required List<String> exhibitAttributeIds,
  }) = _Goods;

  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);
}
