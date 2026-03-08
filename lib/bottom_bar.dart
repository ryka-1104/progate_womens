import 'package:flutter/material.dart';
import 'package:progate_womens/camera.dart';
import 'package:progate_womens/logic/aquarium_logic.dart';
import 'package:progate_womens/favorite/favorite_service.dart';
import 'package:progate_womens/component/list_component.dart';
import 'package:progate_womens/stamp_list.dart';

class BottomBarApp extends StatefulWidget {
  const BottomBarApp({super.key});

  @override
  State<BottomBarApp> createState() => _BottomBarAppState();
}

class _BottomBarAppState extends State<BottomBarApp> {
  int _currentIndex = 0;

  final GlobalKey stampListPageKey = GlobalKey();
  final GlobalKey<_SouvenirPageState> souvenirPageKey = GlobalKey();

  List<Widget> get _pages => [
    QRScanOnlyPage(onDetected: _onCameraDetected),
    StampListPage(key: stampListPageKey),
    SouvenirPage(key: souvenirPageKey),
  ];

  /// QR読み取り
  static void _onCameraDetected(String value) async {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    final exhibit = AquariumService.getExhibitById(value);

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
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 1) {
            (stampListPageKey.currentState as dynamic)?.refresh();
          }

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
    final exhibits = AquariumService.getExhibits();
    final goods = AquariumService.getGoods();

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
        Positioned.fill(
          child: Image.asset(
            "lib/assets/images/background.png",
            fit: BoxFit.cover,
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.only(top: 72, left: 16, right: 16),
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
                onSavePressed: () {},
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
