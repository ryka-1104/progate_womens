import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const _key = "favorites";

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<void> addFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    if (!list.contains(id)) {
      list.add(id);
      await prefs.setStringList(_key, list);
    }
  }

  static Future<void> removeFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    list.remove(id);
    await prefs.setStringList(_key, list);
  }

  static Future<bool> isFavorite(String id) async {
    final list = await getFavorites();
    return list.contains(id);
  }
}
