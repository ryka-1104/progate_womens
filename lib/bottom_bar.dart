import 'package:flutter/material.dart';
import 'package:progate_womens/camera.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:progate_womens/favorite/favorite_service.dart';
import 'package:progate_womens/stamp_list.dart';

Future<Map<String, dynamic>> loadJson() async {
  final data = await rootBundle.loadString('lib/aquarium.json');
  return jsonDecode(data);
}

class BottomBarApp extends StatefulWidget {
  const BottomBarApp({super.key});

  @override
  State<BottomBarApp> createState() => _BottomBarAppState();
}

class _BottomBarAppState extends State<BottomBarApp> {
  int _currentIndex = 0;
  final GlobalKey<_SouvenirPageState> souvenirPageKey = GlobalKey();
  List<Widget> get _pages => [
    const QRScanOnlyPage(onDetected: _onCameraDetected),
    const StampListPage(),
    SouvenirPage(key: souvenirPageKey),
  ];

  static void _onCameraDetected(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 3) {
            souvenirPageKey.currentState?.loadSouvenirs();
          }
        },
        selectedItemColor: const Color(0xFF2D5ACB),
        unselectedItemColor: const Color(0xFF8C939E),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_outlined),
            activeIcon: Icon(Icons.photo_camera),
            label: 'スキャン',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: 'スタンプ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            activeIcon: Icon(Icons.card_giftcard),
            label: 'お土産',
          ),
        ],
      ),
    );
  }
}

// お土産画面　（お気に入り登録したリスト表記）
// デザイン案に合わせて内容変更
class SouvenirPage extends StatefulWidget {
  const SouvenirPage({super.key});

  @override
  State<SouvenirPage> createState() => _SouvenirPageState();
}

class _SouvenirPageState extends State<SouvenirPage> {
  List<Map<String, dynamic>> souvenirItems = [];

  @override
  void initState() {
    super.initState();
    loadSouvenirs();
  }

  Future<void> loadSouvenirs() async {
    final json = await loadJson();
    final exhibits = json["exhibits"];

    final souvenirIds = await FavoriteService.getFavorites();

    final list = exhibits
        .where((exhibit) => souvenirIds.contains(exhibit["id"]))
        .toList();

    setState(() {
      souvenirItems = List<Map<String, dynamic>>.from(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: souvenirItems.length,
      itemBuilder: (context, index) {
        final souvenir = souvenirItems[index];

        return ListTile(
          title: Text(souvenir["name"]),
          subtitle: Text(souvenir["description"]),
        );
      },
    );
  }
}
