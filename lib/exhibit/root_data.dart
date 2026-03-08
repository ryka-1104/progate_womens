import 'exhibit.dart';
import 'goods.dart';

class RootData {
  final List<Exhibit> exhibits;
  final List<Goods> goods;

  RootData({required this.exhibits, required this.goods});

  factory RootData.fromJson(Map<String, dynamic> json) {
    return RootData(
      exhibits: (json['exhibits'] as List<dynamic>? ?? [])
          .map((e) => Exhibit.fromJson(e as Map<String, dynamic>))
          .toList(),
      goods: (json['goods'] as List<dynamic>? ?? [])
          .map((g) => Goods.fromJson(g as Map<String, dynamic>))
          .toList(),
    );
  }
}
