import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:progate_womens/favorite/favorite_service.dart';

class QRScanOnlyPage extends StatefulWidget {
  const QRScanOnlyPage({super.key, required this.onDetected});

  final void Function(String value) onDetected;

  @override
  State<QRScanOnlyPage> createState() => _QRScanOnlyPageState();
}

class _QRScanOnlyPageState extends State<QRScanOnlyPage> {
  bool _detected = false;
  String? exhibitName;

  /// 仮の展示データ
  final Map<String, String> exhibitMap = {
    "3f9d8c0a-6c54-4b8e-9e21-5f4d1a7c2b13": "クラゲ展示",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              if (_detected) return;

              final barcode = capture.barcodes.first;
              final value = barcode.rawValue;

              if (value != null && exhibitMap.containsKey(value)) {
                setState(() {
                  _detected = true;
                  exhibitName = exhibitMap[value];
                });
                widget.onDetected(value);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('このQRコードは登録されていません。もう一度お試しください。'),
                  ),
                );
              }
            },
          ),
          Center(
            child: Image.asset(
              'lib/assets/modal_backlog.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          if (exhibitName != null)
            // 以下デザイン案に合わせて変更
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "展示: $exhibitName",
                      style: const TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final id = exhibitMap.entries
                            .firstWhere((e) => e.value == exhibitName)
                            .key;

                        await FavoriteService.addFavorite(id);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("お気に入りに追加しました")),
                        );
                      },
                      icon: const Icon(Icons.favorite),
                      label: const Text("お気に入り登録"),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
