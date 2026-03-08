import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:progate_womens/creature_dialog.dart';
import 'package:progate_womens/component/list_component.dart';
import 'package:progate_womens/component/stamp_component.dart';
import 'package:progate_womens/stamp/stamp_service.dart';
import 'package:progate_womens/favorite/favorite_service.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadJson() async {
  final data = await rootBundle.loadString('lib/aquarium.json');
  return jsonDecode(data);
}

class QRScanOnlyPage extends StatefulWidget {
  const QRScanOnlyPage({super.key, required this.onDetected});

  final void Function(String value) onDetected;

  @override
  State<QRScanOnlyPage> createState() => _QRScanOnlyPageState();
}

class _QRScanOnlyPageState extends State<QRScanOnlyPage> {
  bool _detected = false;

  List<dynamic> exhibits = [];
  List<dynamic> goods = [];
  List<dynamic> attributes = [];

  Set<String> favoriteIds = {};

  @override
  void initState() {
    super.initState();
    loadData();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final favs = await FavoriteService.getFavorites();
    if (!mounted) return;
    setState(() {
      favoriteIds = favs.toSet();
    });
  }

  /// JSON読み込み
  Future<void> loadData() async {
    final json = await loadJson();

    if (!mounted) return;

    setState(() {
      exhibits = json["exhibits"];
      goods = json["goods"];
      attributes = json["exhibit_attributes"];
    });
  }

  /// exhibit検索
  Map<String, dynamic>? findExhibitByAttribute(String attrId) {
    for (var exhibit in exhibits) {
      for (var gId in exhibit["linked_goods_ids"]) {
        for (var g in goods) {
          if (g["id"] == gId) {
            if ((g["exhibit_attribute_ids"] as List).contains(attrId)) {
              return exhibit;
            }
          }
        }
      }
    }
    return null;
  }

  /// goods取得
  List<Map<String, dynamic>> findGoods(List ids) {
    List<Map<String, dynamic>> result = [];

    for (var g in goods) {
      if (ids.contains(g["id"])) {
        result.add(g);
      }
    }

    return result;
  }

  /// グッズUI（お気に入り対応）
  Widget buildGoodsList(
    List<Map<String, dynamic>> goodsList, {
    VoidCallback? onFavoriteChanged,
  }) {
    if (goodsList.isEmpty) {
      return const Text("関連グッズなし");
    }

    return Column(
      children: goodsList.map((g) {
        final gId = g["id"] as String;
        final isSaved = favoriteIds.contains(gId);

        return GoodsListComponent(
          photo: Image.asset(
            g["image"],
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          goodsName: g["name"],
          categoryLabel: g["category"] ?? "",
          price: "¥${g["price"]}",
          isSaved: isSaved,
          onSavePressed: () async {
            if (favoriteIds.contains(gId)) {
              await FavoriteService.removeFavorite(gId);
              favoriteIds.remove(gId);
            } else {
              await FavoriteService.addFavorite(gId);
              favoriteIds.add(gId);
            }
            await loadFavorites();
            setState(() {});
            onFavoriteChanged?.call();
          },
        );
      }).toList(),
    );
  }

  /// ダイアログ表示
  void showCreatureDialog(Map<String, dynamic> exhibit) async {
    // スタンプを即座に保存
    await StampService.addStamp(exhibit["id"]);

    List goodsIds = exhibit["linked_goods_ids"] ?? [];

    final goodsList = findGoods(goodsIds);

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setInnerState) {
            return CreatureDialog(
              stamp: StampComponent(
                size: 220,
                isActive: true,
                image: Image.asset(exhibit["stamp_image"], fit: BoxFit.contain),
              ),
              name: exhibit["name"],
              detail: exhibit["description"],
              goodsTitle: "この生き物のグッズ",
              itemComponent: buildGoodsList(
                goodsList,
                onFavoriteChanged: () => setInnerState(() {}),
              ),
              onClose: () {
                Navigator.pop(context);
                setState(() {
                  _detected = false;
                });
              },
            );
          },
        );
      },
    ).then((_) {
      /// ダイアログ外タップで閉じた場合も再開
      setState(() {
        _detected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// カメラ
          MobileScanner(
            onDetect: (capture) {
              if (_detected) return;

              final barcode = capture.barcodes.first;
              final value = barcode.rawValue;

              if (value == null) return;

              final exhibit = findExhibitByAttribute(value);

              if (exhibit != null) {
                _detected = true;

                widget.onDetected(value);

                showCreatureDialog(exhibit);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("このQRコードは登録されていません")),
                );
              }
            },
          ),

          /// スキャンUI
          Positioned.fill(
            child: IgnorePointer(
              child: Image.asset(
                "lib/assets/modal_backlog.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
