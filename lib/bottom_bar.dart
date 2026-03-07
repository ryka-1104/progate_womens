import 'package:flutter/material.dart';
import 'package:progate_womens/camera.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:progate_womens/favorite/favorite_service.dart';
import 'package:progate_womens/component/list_component.dart';

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
    QRScanOnlyPage(onDetected: _onCameraDetected),
    const _StampScreen(),
    SouvenirPage(key: souvenirPageKey),
  ];

  /// QRコードを読み取ったとき
  static void _onCameraDetected(String value) async {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    final json = await loadJson();
    final exhibits = json["exhibits"];

    final exhibit = exhibits.firstWhere(
      (e) => e["id"] == value,
      orElse: () => null,
    );

    if (exhibit == null) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(exhibit["name"]),
          content: Text(exhibit["description"]),
          actions: [
            TextButton(
              child: const Text("閉じる"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text("お気に入り登録"),
              onPressed: () async {
                await FavoriteService.addFavorite(exhibit["id"]);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

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

          /// お土産タブを開いたとき更新
          if (index == 2) {
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

class _StampScreen extends StatelessWidget {
  const _StampScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: Text('スタンプ画面（仮）')),
      ),
    );
  }
}

/// お土産画面
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
    final goods = json["goods"];

    final favoriteIds = await FavoriteService.getFavorites();

    final favoriteExhibits = exhibits.where(
      (exhibit) => favoriteIds.contains(exhibit["id"]),
    );

    List goodsIds = [];

    for (var exhibit in favoriteExhibits) {
      goodsIds.addAll(exhibit["linked_goods_ids"]);
    }

    final resultGoods = goods.where((g) => goodsIds.contains(g["id"])).toList();

    setState(() {
      souvenirItems = List<Map<String, dynamic>>.from(resultGoods);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 背景
        Positioned.fill(
          child: Image.asset(
            "lib/assets/images/background.png",
            fit: BoxFit.cover,
          ),
        ),

        /// お土産リスト
        ListView.builder(
          padding: EdgeInsets.only(top: 72, right: 16, bottom: 16, left: 16),
          itemCount: souvenirItems.length,
          itemBuilder: (context, index) {
            final goods = souvenirItems[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GoodsListComponent(
                photo: Image.asset(goods["image"], fit: BoxFit.cover),
                goodsName: goods["name"],
                categoryLabel: goods["category"] ?? "",
                price: "¥${goods["price"]}",
                isSaved: false,
                onSavePressed: () {
                  // 保存処理（必要なら実装）
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

/// ダイアログ用のcontext取得
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
