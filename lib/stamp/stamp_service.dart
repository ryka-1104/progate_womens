import 'package:shared_preferences/shared_preferences.dart';

/// QR読み取りなどで獲得したスタンプ（展示ID）の収集状態を管理します。
class StampService {
  static const _key = 'collected_stamps';

  static Future<List<String>> getCollectedIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<void> addStamp(String exhibitId) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    if (!list.contains(exhibitId)) {
      list.add(exhibitId);
      await prefs.setStringList(_key, list);
    }
  }

  static Future<bool> isCollected(String exhibitId) async {
    final list = await getCollectedIds();
    return list.contains(exhibitId);
  }
}
