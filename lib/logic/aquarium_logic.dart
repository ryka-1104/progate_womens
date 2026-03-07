import 'dart:convert';
import 'package:flutter/services.dart';

class AquariumService {
  static Map<String, dynamic>? _jsonData;

  /// JSON読み込み（1回だけ）
  static Future<void> loadJson() async {
    if (_jsonData != null) return;

    final data = await rootBundle.loadString('lib/aquarium.json');
    _jsonData = jsonDecode(data);
  }

  /// 展示一覧
  static List<dynamic> getExhibits() {
    return _jsonData?["exhibits"] ?? [];
  }

  /// グッズ一覧
  static List<dynamic> getGoods() {
    return _jsonData?["goods"] ?? [];
  }

  /// IDから展示取得
  static Map<String, dynamic>? getExhibitById(String id) {
    final exhibits = getExhibits();

    for (var exhibit in exhibits) {
      if (exhibit["id"] == id) {
        return exhibit;
      }
    }
    return null;
  }

  /// グッズIDリストからグッズ取得
  static List<Map<String, dynamic>> getGoodsByIds(List ids) {
    final goods = getGoods();

    return goods
        .where((g) => ids.contains(g["id"]))
        .map<Map<String, dynamic>>((g) => Map<String, dynamic>.from(g))
        .toList();
  }
}
